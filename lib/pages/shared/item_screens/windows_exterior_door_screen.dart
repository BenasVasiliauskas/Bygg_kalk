import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../items/windows_exterior_doors_item.dart';
import '../../../widgets/custom_drawer.dart';

class WindowsExteriorDoorScreen extends StatefulWidget {
  @override
  State<WindowsExteriorDoorScreen> createState() =>
      _WindowsExteriorDoorScreenState();
}

class _WindowsExteriorDoorScreenState extends State<WindowsExteriorDoorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: const Text('Bygg Kalk'),
        ),
        body: languageEnglish == true
            ? GridView.count(
                padding: const EdgeInsets.all(25),
                children: windowsExteriorDoors
                    .map(
                      (wallItem) => WindowExteriorDoorItem(
                        wallItem.name,
                        wallItem.description,
                        wallItem.unit,
                        wallItem.quantity,
                        wallItem.laborHours1,
                        wallItem.laborHours2,
                        wallItem.laborCost,
                        wallItem.material,
                        wallItem.materials,
                        wallItem.totalPrice,
                        wallItem.color,
                      ),
                    )
                    .toList(),
                crossAxisCount: 1,
                mainAxisSpacing: 20,
                childAspectRatio: 7 / 2,
              )
            : GridView.count(
                padding: const EdgeInsets.all(25),
                children: norwWindowsExteriorDoors
                    .map(
                      (catData) => WindowExteriorDoorItem(
                        catData.name,
                        catData.description,
                        catData.unit,
                        catData.quantity,
                        catData.laborHours1,
                        catData.laborHours2,
                        catData.laborCost,
                        catData.material,
                        catData.materials,
                        catData.totalPrice,
                        catData.color,
                      ),
                    )
                    .toList(),
                crossAxisCount: 1,
                mainAxisSpacing: 20,
                childAspectRatio: 7 / 2,
              ));
  }
}
