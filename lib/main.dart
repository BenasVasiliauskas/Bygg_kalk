import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/splash.dart';
import 'package:cost_calculator/pages/shared/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cost_calculator/constants/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? language = await SharedPrefs.getLanguage();

  if (language == 'English') {
    languageEnglish = true;
    languageNorwegian = false;
    languageLithuanian = false;
    languagePolish = false;
  } else if (language == 'Norwegian') {
    languageEnglish = false;
    languageNorwegian = true;
    languageLithuanian = false;
    languagePolish = false;
  } else if (language == 'Lithuanian') {
    languageEnglish = false;
    languageNorwegian = false;
    languageLithuanian = true;
    languagePolish = false;
  } else if (language == 'Polish') {
    languageEnglish = false;
    languageNorwegian = false;
    languageLithuanian = false;
    languagePolish = true;
  }

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
