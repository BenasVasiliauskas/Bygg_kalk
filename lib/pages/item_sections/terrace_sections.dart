import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/item_screens/terrace_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class TerraceSections extends StatefulWidget {
  const TerraceSections({super.key});

  @override
  State<TerraceSections> createState() => _TerraceSectionsState();
}

class _TerraceSectionsState extends State<TerraceSections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          languageEnglish
              ? "Terrace"
              : languageLithuanian
                  ? "Terasa"
                  : languageNorwegian
                      ? "Terrasse/rekkverk"
                      : "Taras",
        ),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return TerraceScreen();
                  },
                ),
              );
            },
            child: Text(
              languageEnglish
                  ? "Terrace"
                  : languageLithuanian
                      ? "Terasa"
                      : languageNorwegian
                          ? "Terrasse/rekkverk"
                          : "Taras",
            ),
          ),
        ],
      ),
    );
  }
}