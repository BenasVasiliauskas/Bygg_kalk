import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/hull_roofing_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HullRoofingSections extends StatefulWidget {
  const HullRoofingSections({super.key});

  @override
  State<HullRoofingSections> createState() => _HullRoofingSectionsState();
}

class _HullRoofingSectionsState extends State<HullRoofingSections> {
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
      ),
    );
  }
}