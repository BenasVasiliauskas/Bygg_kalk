import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
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
                ? "Load-bearing structure"
                : languageLithuanian
                    ? "Pastoliai"
                    : languageNorwegian
                        ? "Stillas"
                        : "Rusztowanie",
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
                          return ScaffoldingScreen();
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
                                    ? "Nybygg"
                                    : "Nowy budynek",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(scaffoldingData.length.toString()),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
