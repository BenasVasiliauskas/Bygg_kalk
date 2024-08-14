import 'package:cost_calculator/constants/language.dart';

String selectedOption = languageEnglish == true
    ? 'English'
    : languageNorwegian == true
        ? 'Norwegian'
        : languageLithuanian == true
            ? 'Lithuanian'
            : languagePolish == true
                ? 'Polish'
                : 'English';
