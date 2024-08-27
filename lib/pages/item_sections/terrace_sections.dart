import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/terrace_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TerraceSections extends StatefulWidget {
  const TerraceSections({super.key});

  @override
  State<TerraceSections> createState() => _TerraceSectionsState();
}

class _TerraceSectionsState extends State<TerraceSections> {
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
                ? "New building"
                : languageLithuanian
                    ? "Naujas pastatas"
                    : languageNorwegian
                        ? "Ny bygning"
                        : "ŚNowy budynek",
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
                                : "Taras", // change
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(terraceData.length.toString()),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
