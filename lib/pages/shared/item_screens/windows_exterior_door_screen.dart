import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/pages/item_screen/windows_exterior_door_items_screen.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_windows_exterior_door_items_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_windows_exterior_door_items_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_windows_exterior_door_items_screen.dart';
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
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        children: languageEnglish == true
            ? windowsExteriorDoors.map(
                (wallItem) {
                  return Row(
                    children: [
                      Expanded(
                        child: WindowExteriorDoorItem(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: 100,
                          height: double.infinity,
                          child: Center(
                            child: TextField(
                              controller:
                                  windowsExteriorDoorsCalculationControllers,
                              onChanged: (value) {
                                setState(() {
                                  windowsExteriorDoorsCalculationControllers
                                      .text = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Text("Units")
                    ],
                  );
                },
              ).toList()
            : languageNorwegian
                ? norwWindowsExteriorDoors.map(
                    (catData) {
                      return Row(
                        children: [
                          Expanded(
                            child: WindowExteriorDoorItem(
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
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              width: 100,
                              height: double.infinity,
                              child: Center(
                                child: TextField(
                                  controller:
                                      norwWindowsExteriorDoorsCalculationControllers,
                                  onChanged: (value) {
                                    setState(() {
                                      norwWindowsExteriorDoorsCalculationControllers
                                          .text = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Text("stk")
                        ],
                      );
                    },
                  ).toList()
                : languagePolish
                    ? polWindowsExteriorDoors.map(
                        (catData) {
                          return Row(
                            children: [
                              Expanded(
                                child: WindowExteriorDoorItem(
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
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  width: 100,
                                  height: double.infinity,
                                  child: Center(
                                    child: TextField(
                                      controller:
                                          polWindowsExteriorDoorsCalculationControllers,
                                      onChanged: (value) {
                                        setState(() {
                                          polWindowsExteriorDoorsCalculationControllers
                                              .text = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Text("szt")
                            ],
                          );
                        },
                      ).toList()
                    : litWindowsExteriorDoors.map(
                        (catData) {
                          return Row(
                            children: [
                              Expanded(
                                child: WindowExteriorDoorItem(
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
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  width: 100,
                                  height: double.infinity,
                                  child: Center(
                                    child: TextField(
                                      controller:
                                          litWindowsExteriorDoorsCalculationControllers,
                                      onChanged: (value) {
                                        setState(() {
                                          litWindowsExteriorDoorsCalculationControllers
                                              .text = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Text("vnt")
                            ],
                          );
                        },
                      ).toList(),
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        childAspectRatio: 7 / 2,
      ),
    );
  }
}
