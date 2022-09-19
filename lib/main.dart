import 'package:my_music/model/m_history_hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:my_music/config/colors.dart';
import 'package:my_music/config/profile_obs.dart';
import 'package:my_music/config/routes.gr.dart';
import 'package:my_music/config/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: kTransparent),
  );
  var appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDirectory.path)
    ..registerAdapter(HistoryHiveAdapter());
  Future.wait([checkLogin()]).then((value) => runApp(MyApp()));
}

ProfileObs served = Get.put(ProfileObs());

Future<void> checkLogin() async {
  GoogleSignIn signIn = GoogleSignIn(
    scopes: [
      'https://www.googleapis.com/auth/youtube.readonly',
      'https://www.googleapis.com/auth/youtube',
      'https://www.googleapis.com/auth/youtube.force-ssl',
      'https://www.googleapis.com/auth/youtubepartner',
    ],
  );
  bool googleUsers = await signIn.isSignedIn();
  if (!googleUsers) {
    GoogleSignInAccount? googleUser = await signIn.signIn();
    GoogleSignInAuthentication? auth = await googleUser!.authentication;
    served.username.value = googleUser.displayName ?? "";
    served.emails.value = googleUser.email;
    served.photoUrl.value = googleUser.photoUrl ?? "";
    return;
  }
  return;
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}

// flutter pub run build_runner build --delete-conflicting-outputs