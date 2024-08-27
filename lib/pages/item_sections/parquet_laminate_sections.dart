import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/parquet_laminate_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParquetLaminateSections extends StatefulWidget {
  const ParquetLaminateSections({super.key});

  @override
  State<ParquetLaminateSections> createState() =>
      _ParquetLaminateSectionsState();
}

class _ParquetLaminateSectionsState extends State<ParquetLaminateSections> {
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
                ? "Parquet and laminate"
                : languageLithuanian
                    ? "Parketas ir laminatas"
                    : languageNorwegian
                        ? "Parkett og laminat"
                        : "Parkiet i laminat",
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
                          return ParquetLaminateScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    languageEnglish
                        ? "Parquet and laminate"
                        : languageLithuanian
                            ? "Parketas ir laminatas"
                            : languageNorwegian
                                ? "Parkett og laminat"
                                : "Parkiet i laminat",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(parquetAndLaminate.length.toString()),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
