import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/outer_roof_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OuterRoofSections extends StatefulWidget {
  const OuterRoofSections({super.key});

  @override
  State<OuterRoofSections> createState() => _OuterRoofSectionsState();
}

class _OuterRoofSectionsState extends State<OuterRoofSections> {
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
                ? "Outer roof"
                : languageLithuanian
                    ? "Išorinis stogas"
                    : languageNorwegian
                        ? "Yttertak"
                        : "Dach zewnętrzny",
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return OuterRoofScreen(
                              constructionType: "New Construction");
                        },
                      ),
                    );
                  },
                  child: Text(
                    languageEnglish
                        ? "New building"
                        : languageLithuanian
                            ? "Naujas pastatas"
                            : languageNorwegian
                                ? "Ny bygning"
                                : "ŚNowy budynek",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(outerRoofData
                      .where((e) => e.constructionType == "New Construction")
                      .length
                      .toString()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return OuterRoofScreen(
                              constructionType: "Reconstruction");
                        },
                      ),
                    );
                  },
                  child: Text(
                    languageEnglish
                        ? "Reconstruction"
                        : languageLithuanian
                            ? "Rekonstrukcija"
                            : languageNorwegian
                                ? "Ombygging"
                                : "Rekonstrukcja",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(outerRoofData
                      .where((e) => e.constructionType == "Reconstruction")
                      .length
                      .toString()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return OuterRoofScreen(
                              constructionType: "Demolition");
                        },
                      ),
                    );
                  },
                  child: Text(
                    languageEnglish
                        ? "Demolition"
                        : languageLithuanian
                            ? "Griovimas"
                            : languageNorwegian
                                ? "Riving"
                                : "Rozbiórka",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(outerRoofData
                      .where((e) => e.constructionType == "Demolition")
                      .length
                      .toString()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
