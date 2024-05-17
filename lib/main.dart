import 'package:cost_calculator/pages/shared/splash.dart';
import 'package:cost_calculator/pages/shared/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

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
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
