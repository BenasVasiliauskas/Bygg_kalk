import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/exterior_wall_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OuterWallSections extends StatefulWidget {
  const OuterWallSections({super.key});

  @override
  State<OuterWallSections> createState() => _OuterWallSectionsState();
}

class _OuterWallSectionsState extends State<OuterWallSections> {
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
                ? "Outer wall"
                : languageLithuanian
                    ? "Išorinės sienos"
                    : languageNorwegian
                        ? "Innvendige vegger"
                        : "Ściany wewnętrzne",
          ),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return ExteriorWallScreen();
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
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return ExteriorWallScreen();
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
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return ExteriorWallScreen();
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
          ],
        ),
      ),
    );
  }
}
