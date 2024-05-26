import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.black,
    secondary: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 2, 114, 45),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  textTheme: ThemeData.light().textTheme.copyWith(
        bodyLarge: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        bodyMedium: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 41, 39, 39),
    primary: Colors.white,
    secondary: Colors.white,
  ),
  appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
);
