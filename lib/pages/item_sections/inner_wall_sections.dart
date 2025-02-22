import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
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
                ? "Internal walls"
                : languageLithuanian
                    ? "Vidinės sienos"
                    : languageNorwegian
                        ? "Yttervegger"
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
                          return InnerWallScreen(
                              constructionType: "New Construction");
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.folder,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Text(
                        languageEnglish
                            ? "New building"
                            : languageLithuanian
                                ? "Naujas pastatas"
                                : languageNorwegian
                                    ? "Ny Bygg"
                                    : "Nowy budynek",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(norwInnerWallData
                      .where((innerWall) =>
                          innerWall.constructionType == "New Construction")
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
                          return InnerWallScreen(
                              constructionType: "Reconstruction");
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.folder,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Text(
                        languageEnglish
                            ? "Reconstruction"
                            : languageLithuanian
                                ? "Rekonstrukcija"
                                : languageNorwegian
                                    ? "Ombygging"
                                    : "Rekonstrukcja",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(norwInnerWallData
                      .where((innerWall) =>
                          innerWall.constructionType == "Reconstruction")
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
                          return InnerWallScreen(
                              constructionType: "Demolition");
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.folder,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Text(
                        languageEnglish
                            ? "Demolition"
                            : languageLithuanian
                                ? "Griovimas"
                                : languageNorwegian
                                    ? "Riving"
                                    : "Rozbiórka",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(norwInnerWallData
                      .where((innerWall) =>
                          innerWall.constructionType == "Demolition")
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
