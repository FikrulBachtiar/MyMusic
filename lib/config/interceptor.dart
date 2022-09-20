import 'dart:async';

import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_music/config/dio_configuration.dart';
import 'package:my_music/config/env.dart';
import 'package:my_music/config/shared_preference.dart';

class TokenInterceptor extends Interceptor {
  SharedPreferenceConfig shared = SharedPreferenceConfig();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? accessToken = await shared.getAccessToken() ?? "";
    String? auth = accessToken != '' ? "Bearer $accessToken" : null;

    options.headers['Authorization'] = auth;
    options.queryParameters.addAll({"key": apiKey});
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.response) {
      if (err.response!.statusCode == 401) {
        print("Unauthorized");
        try {
          var refreshToken = await refreshAccessToken();
        } on DioError catch (e) {
          handler.reject(e);
        }
      } else {
        handler.reject(err);
      }
    } else if (err.type == DioErrorType.cancel) {
      handler.reject(err);
    } else if (err.type == DioErrorType.receiveTimeout) {
      handler.reject(err);
    } else {
      handler.reject(err);
    }
    // super.onError(err, handler);
  }

  // * Refresh Token
  Future<void> refreshAccessToken() async {
    GoogleSignIn signIn = GoogleSignIn(scopes: scopesGoogle);
    GoogleSignInAccount? signAgain = await signIn.signInSilently();
    GoogleSignInAuthentication auth = await signAgain!.authentication;
    String token = auth.accessToken ?? "";
    shared.setAccessToken(token);
  }

  // * Retry
  Future<dynamic> retry(RequestOptions requestOptions) async {
    final responseCompleter = Completer<Response>();
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    final token = await shared.getAccessToken() ?? "";
    options.headers!["Authorization"] = "Bearer $token";

    try {
      responseCompleter.complete(
        dioWithToken.request(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: options,
        ),
      );
      return responseCompleter.future;
    } on DioError catch (e) {
      return e;
    }
  }
}
