import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/scaffolding_item_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScaffoldingSections extends StatefulWidget {
  const ScaffoldingSections({super.key});

  @override
  State<ScaffoldingSections> createState() => _ScaffoldingSectionsState();
}

class _ScaffoldingSectionsState extends State<ScaffoldingSections> {
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
          actions: [
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.houseChimney,
              ),
              tooltip: languageEnglish
                  ? 'Return to main menu'
                  : languageLithuanian
                      ? "Grįžti į pagrindinį meniu"
                      : languageNorwegian
                          ? "Gå tilbake til hovedmenyen"
                          : "Powrót do menu głównego",
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return homePage();
                    },
                  ),
                );
              },
            ),
          ],
          title: Text(
            languageEnglish
                ? "Scaffolding"
                : languageLithuanian
                    ? "Pastoliai"
                    : languageNorwegian
                        ? "Stilas"
                        : "Rusztowanie",
          ),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return ScaffoldingScreen();
                    },
                  ),
                );
              },
              child: Text(
                languageEnglish
                    ? "Scaffolding"
                    : languageLithuanian
                        ? "Pastoliai"
                        : languageNorwegian
                            ? "Stilas"
                            : "Rusztowanie",
              ),
            ),
          ],
        ),
      ),
    );
  }
}