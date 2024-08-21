import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/items/hull_roofing_item.dart';
import 'package:cost_calculator/pages/item_screen/hull_roofing_item_screen.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_hull_roofing_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_hull_roofing_item_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_hull_roofing_item_screen.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class HullRoofingScreen extends StatefulWidget {
  @override
  State<HullRoofingScreen> createState() => _HullRoofingScreenState();
}

class _HullRoofingScreenState extends State<HullRoofingScreen> {
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
            ? hullRoofingData.map(
                (catData) {
                  return Row(
                    children: [
                      Expanded(
                        child: HullRoofingItem(
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
                              controller: hullCalculationControllers,
                              onChanged: (value) {
                                setState(() {
                                  hullCalculationControllers.text = value;
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
                ? norwHullRoofingData.map(
                    (catData) {
                      return Row(
                        children: [
                          Expanded(
                            child: HullRoofingItem(
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
                                  controller: norwHullCalculationControllers,
                                  onChanged: (value) {
                                    setState(() {
                                      norwHullCalculationControllers.text =
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
                    ? polHullRoofingData.map(
                        (catData) {
                          return Row(
                            children: [
                              Expanded(
                                child: HullRoofingItem(
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
                                      controller: polHullCalculationControllers,
                                      onChanged: (value) {
                                        setState(() {
                                          polHullCalculationControllers.text =
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
                    : litHullRoofingData.map(
                        (catData) {
                          return Row(
                            children: [
                              Expanded(
                                child: HullRoofingItem(
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
                                      controller: litHullCalculationControllers,
                                      onChanged: (value) {
                                        setState(() {
                                          litHullCalculationControllers.text =
                                              value;
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
