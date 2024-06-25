import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/flooring_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class FlooringSections extends StatefulWidget {
  const FlooringSections({super.key});

  @override
  State<FlooringSections> createState() => _FlooringSectionsState();
}

class _FlooringSectionsState extends State<FlooringSections> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return buildingComponentsScreen();
          }),
        );
      },
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text(
            languageEnglish
                ? "Flooring"
                : languageLithuanian
                    ? "Grindys"
                    : languageNorwegian
                        ? "Gulvbelegg"
                        : "Wykładziny podłogowe",
          ),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return FlooringScreen();
                    },
                  ),
                );
              },
              child: Text(
                languageEnglish
                    ? "Flooring"
                    : languageLithuanian
                        ? "Grindys"
                        : languageNorwegian
                            ? "Gulvbelegg"
                            : "Wykładziny podłogowe",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
