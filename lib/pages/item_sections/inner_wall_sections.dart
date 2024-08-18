import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/interior_wall_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InnerWallSections extends StatefulWidget {
  const InnerWallSections({super.key});

  @override
  State<InnerWallSections> createState() => _InnerWallSectionsState();
}

class _InnerWallSectionsState extends State<InnerWallSections> {
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
                ? "Inner walls"
                : languageLithuanian
                    ? "Vidinės sienos"
                    : languageNorwegian
                        ? "Innvendige vegger"
                        : "Ściany wewnętrzne",
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
                          return InnerWallScreen();
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
                  child: const Text("6"),
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
                          return InnerWallScreen();
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
                                ? "Rekonstruksjon"
                                : "Rekonstrukcja",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text("6"),
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
                          return InnerWallScreen();
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
                  child: const Text("6"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
