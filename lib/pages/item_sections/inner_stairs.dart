import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/inner_stairs_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InnerStairsSections extends StatefulWidget {
  const InnerStairsSections({super.key});

  @override
  State<InnerStairsSections> createState() => _InnerStairsSectionsState();
}

class _InnerStairsSectionsState extends State<InnerStairsSections> {
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
                ? "Inner stairs"
                : languageLithuanian
                    ? "Vidaus laiptai"
                    : languageNorwegian
                        ? "Innvendige trapper"
                        : "Schody wewnętrzne",
          ),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return InnerStairsScreen();
                    },
                  ),
                );
              },
              child: Text(
                languageEnglish
                    ? "Inner stairs"
                    : languageLithuanian
                        ? "Vidaus laiptai"
                        : languageNorwegian
                            ? "Innvendige trapper"
                            : "Schody wewnętrzne",
              ),
            ),
          ],
        ),
      ),
    );
  }
}