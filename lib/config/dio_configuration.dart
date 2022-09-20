import 'package:dio/dio.dart';
import 'package:my_music/config/interceptor.dart';

final dioWithToken = Dio()
  ..options = BaseOptions(
    baseUrl: 'https://www.googleapis.com/youtube/v3',
    receiveTimeout: 10 * 60 * 1000,
    connectTimeout: 10 * 60 * 1000,
  )
  ..interceptors.add(
    TokenInterceptor(),
  );
