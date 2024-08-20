import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class privacyPolicy extends StatefulWidget {
  const privacyPolicy({super.key});

  @override
  State<privacyPolicy> createState() => _privacyPolicyState();
}

class _privacyPolicyState extends State<privacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(languageEnglish
            ? "Privacy"
            : languageNorwegian
                ? "Personvern"
                : languagePolish
                    ? "Prywatność"
                    : "Privatumas"),
      ),
    );
  }
}
