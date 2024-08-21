import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/items/inner_door_item.dart';
import 'package:cost_calculator/pages/item_screen/inner_door_items_screen.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_inner_door_items_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_inner_door_items_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_inner_door_items_screen.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class InnerDoorScreen extends StatefulWidget {
  @override
  State<InnerDoorScreen> createState() => _InnerDoorScreenState();
}

class _InnerDoorScreenState extends State<InnerDoorScreen> {
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
            ? innerDoor.map(
                (catData) {
                  return Row(
                    children: [
                      Expanded(
                        child: InnerDoorItem(
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
                          catData.constructionType,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: 100,
                          height: double.infinity,
                          child: Center(
                            child: TextField(
                              controller: innerDoorCalculationControllers,
                              onChanged: (value) {
                                setState(() {
                                  innerDoorCalculationControllers.text = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Text("stk"),
                    ],
                  );
                },
              ).toList()
            : languageNorwegian
                ? norwInnerDoor.map(
                    (catData) {
                      return Row(
                        children: [
                          Expanded(
                            child: InnerDoorItem(
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
                              catData.constructionType,
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
                                      norwInnerDoorCalculationControllers,
                                  onChanged: (value) {
                                    setState(() {
                                      norwInnerDoorCalculationControllers.text =
                                          value;
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
                    ? polInnerDoor.map(
                        (catData) {
                          return Row(
                            children: [
                              Expanded(
                                child: InnerDoorItem(
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
                                  catData.constructionType,
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
                                          polInnerDoorCalculationControllers,
                                      onChanged: (value) {
                                        setState(() {
                                          polInnerDoorCalculationControllers
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
                    : litInnerDoor.map(
                        (catData) {
                          return Row(
                            children: [
                              Expanded(
                                child: InnerDoorItem(
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
                                  catData.constructionType,
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
                                          litInnerDoorCalculationControllers,
                                      onChanged: (value) {
                                        setState(() {
                                          litInnerDoorCalculationControllers
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
