import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
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
                ? "Holes"
                : languageLithuanian
                    ? "Angų gręžimas"
                    : languageNorwegian
                        ? "Hultaking"
                        : "Pokrycia dachowe Hull",
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
                          return HullRoofingScreen();
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
                                    : "ŚNowy budynek",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(hullRoofingData.length.toString()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
