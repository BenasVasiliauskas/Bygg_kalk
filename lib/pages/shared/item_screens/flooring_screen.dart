import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/items/flooring_item.dart';
import 'package:cost_calculator/pages/item_screen/flooring_item_screen.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_flooring_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_flooring_item_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_flooring_item_screen.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class FlooringScreen extends StatefulWidget {
  @override
  State<FlooringScreen> createState() => _FlooringSectionsState();
}

class _FlooringSectionsState extends State<FlooringScreen> {
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
            ? flooringData.map(
                (catData) {
                  return Row(
                    children: [
                      Expanded(
                        child: FlooringItem(
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
                              controller: flooringCalculationControllers,
                              onChanged: (value) {
                                setState(() {
                                  flooringCalculationControllers.text = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Text("m²")
                    ],
                  );
                },
              ).toList()
            : languageNorwegian
                ? norwFlooringData.map(
                    (catData) {
                      return Row(
                        children: [
                          Expanded(
                            child: FlooringItem(
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
                                      norwFlooringCalculationControllers,
                                  onChanged: (value) {
                                    setState(() {
                                      norwFlooringCalculationControllers.text =
                                          value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Text("m²")
                        ],
                      );
                    },
                  ).toList()
                : languagePolish
                    ? polFlooringData.map(
                        (catData) {
                          return Row(
                            children: [
                              Expanded(
                                child: FlooringItem(
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
                                          polFlooringCalculationControllers,
                                      onChanged: (value) {
                                        setState(() {
                                          polFlooringCalculationControllers
                                              .text = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Text("m²")
                            ],
                          );
                        },
                      ).toList()
                    : litFlooringData.map(
                        (catData) {
                          return Row(
                            children: [
                              Expanded(
                                child: FlooringItem(
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
                                          litFlooringCalculationControllers,
                                      onChanged: (value) {
                                        setState(() {
                                          litFlooringCalculationControllers
                                              .text = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Text("m²")
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
