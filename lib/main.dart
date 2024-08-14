import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/splash.dart';
import 'package:cost_calculator/pages/shared/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cost_calculator/constants/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? language = await SharedPrefs.getLanguage();

  if (language != null) {
    if (language == 'English') {
      languageEnglish = true;
    } else if (language == 'Norwegian') {
      languageNorwegian = true;
    } else if (language == 'Lithuanian') {
      languageLithuanian = true;
    } else if (language == 'Polish') {
      languagePolish = true;
    }
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
