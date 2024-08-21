import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/items/Waste_item.dart';
import 'package:cost_calculator/pages/item_screen/waste_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_waste_item_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_waste_item_screen.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class WasteScreen extends StatefulWidget {
  @override
  State<WasteScreen> createState() => _WasteScreenState();
}

class _WasteScreenState extends State<WasteScreen> {
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
        children: languageEnglish
            ? wasteData.map(
                (catData) {
                  return Row(
                    children: [
                      Expanded(
                        child: WasteItem(
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
                              controller: wasteCalculationControllers,
                              onChanged: (value) {
                                setState(() {
                                  wasteCalculationControllers.text = value;
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
                ? norwWasteData.map(
                    (catData) {
                      return Row(
                        children: [
                          Expanded(
                            child: WasteItem(
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
                                  controller: norwWasteCalculationControllers,
                                  onChanged: (value) {
                                    setState(() {
                                      norwWasteCalculationControllers.text =
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
                    ? polWasteData.map(
                        (catData) {
                          return Row(
                            children: [
                              Expanded(
                                child: WasteItem(
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
                                          polWasteCalculationControllers,
                                      onChanged: (value) {
                                        setState(() {
                                          polWasteCalculationControllers.text =
                                              value;
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
                    : litWasteData.map(
                        (catData) {
                          return Row(children: [
                            Expanded(
                              child: WasteItem(
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
                            )
                          ]);
                        },
                      ).toList(),
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        childAspectRatio: 7 / 2,
      ),
    );
  }
}
