import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
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
  final AppLifecycleObserver _observer = AppLifecycleObserver();
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return ExteriorWallScreen(
                            constructionType: "New Construction",
                          );
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
                                ? "Ny Bygg"
                                : "ŚNowy budynek",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(norwExteriorWallData
                      .where((e) => e.constructionType == "New Construction")
                      .length
                      .toString()),
                )
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
                          return ExteriorWallScreen(
                            constructionType: "Reconstruction",
                          );
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
                  child: Text(norwExteriorWallData
                      .where((e) => e.constructionType == "Reconstruction")
                      .length
                      .toString()),
                )
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
                          return ExteriorWallScreen(
                            constructionType: "Demolition",
                          );
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
                  child: Text(norwExteriorWallData
                      .where((e) => e.constructionType == "Demolition")
                      .length
                      .toString()),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
