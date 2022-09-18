import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_music/config/colors.dart';
import 'package:my_music/view/intro/v_profile.dart';
import 'package:my_music/view/koleksi/v_film_anda.dart';
import 'package:my_music/view/koleksi/v_histori.dart';
import 'package:my_music/view/koleksi/v_tonton_nanti.dart';
import 'package:my_music/view/v_home.dart';
import 'package:my_music/config/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: kTransparent),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: ThemeMode.system,
        getPages: [
          GetPage(
            name: '/',
            page: () => const MyHomePage(),
            transition: Transition.downToUp,
          ),
          GetPage(
            name: '/profile',
            page: () => const ProfileView(),
            transition: Transition.downToUp,
          ),
          GetPage(
            name: '/history',
            page: () => const HistoriView(),
            transition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 300),
          ),
          GetPage(
            name: '/tonton-nanti',
            page: () => const TontonNantiView(),
            transition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 300),
          ),
          GetPage(
            name: '/film-anda',
            page: () => const FilmAndaView(),
            transition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 300),
          ),
        ],
        // home: const MyHomePage(),
      ),
    );
  }
}
