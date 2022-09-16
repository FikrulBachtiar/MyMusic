import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTheme extends GetxController {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    // scaffoldBackgroundColor: const Color.fromRGBO(56, 56, 56, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(33, 33, 33, 1),
    bottomAppBarColor: const Color.fromRGBO(33, 33, 33, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(33, 33, 33, 1),
      elevation: 0,
    ),
    backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
  );
}
