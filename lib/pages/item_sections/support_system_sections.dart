import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/support_system_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SupportSystemSections extends StatefulWidget {
  const SupportSystemSections({super.key});

  @override
  State<SupportSystemSections> createState() => _SupportSystemSectionsState();
}

class _SupportSystemSectionsState extends State<SupportSystemSections> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
  }

  Map<String, double> test = {
    for (var i = 0; i < supportSystem.length; i++) supportSystem[i].name: 0,
  };

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
                ? "Load-bearing systems"
                : languageLithuanian
                    ? "Laikančiosios sistemos"
                    : languageNorwegian
                        ? "Bæresystemer"
                        : "Systemy wsparcia",
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
                          return SupportSystemScreen();
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
                                    : "Śnowy budynek",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //change back to eng after adding eng data
                  child: Text(norwSupportSystem.length.toString()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
