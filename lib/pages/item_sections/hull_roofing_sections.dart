import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/item_screens/hull_roofing_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HullRoofingSections extends StatefulWidget {
  const HullRoofingSections({super.key});

  @override
  State<HullRoofingSections> createState() => _HullRoofingSectionsState();
}

class _HullRoofingSectionsState extends State<HullRoofingSections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          languageEnglish
              ? "Hull roofing"
              : languageLithuanian
                  ? "Korpuso stogo danga"
                  : languageNorwegian
                      ? "Hultaking"
                      : "Pokrycia dachowe Hull",
        ),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return HullRoofingScreen();
                  },
                ),
              );
            },
            child: Text(
              languageEnglish
                  ? "Hull roofing"
                  : languageLithuanian
                      ? "Korpuso stogo danga"
                      : languageNorwegian
                          ? "Hultaking"
                          : "Pokrycia dachowe Hull",
            ),
          ),
        ],
      ),
    );
  }
}
