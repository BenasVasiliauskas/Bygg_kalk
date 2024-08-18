import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/windows_exterior_door_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WindowsExteriorDoorSections extends StatefulWidget {
  const WindowsExteriorDoorSections({super.key});

  @override
  State<WindowsExteriorDoorSections> createState() =>
      _WindowsExteriorDoorSectionsState();
}

class _WindowsExteriorDoorSectionsState
    extends State<WindowsExteriorDoorSections> {
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
                ? "Windows and exterior doors"
                : languageLithuanian
                    ? "Langai ir išorinės durys"
                    : languageNorwegian
                        ? "Vinduer og ytterdører"
                        : "Okna i drzwi zewnętrzne",
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
                          return WindowsExteriorDoorScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    languageEnglish
                        ? "Windows and exterior doors"
                        : languageLithuanian
                            ? "Langai ir išorinės durys"
                            : languageNorwegian
                                ? "Vinduer og ytterdører"
                                : "Okna i drzwi zewnętrzne",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
