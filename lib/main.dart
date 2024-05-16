import 'package:cost_calculator/pages/shared/splash.dart';
import 'package:cost_calculator/pages/shared/theme/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splashScreen(),
      initialRoute: '/',
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => splashScreen(),
        );
      },
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.light,
    );
  }
}
