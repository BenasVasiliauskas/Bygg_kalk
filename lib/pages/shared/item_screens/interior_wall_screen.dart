import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/pages/item_screen/interior_wall_items_screen.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_interior_wall_items_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_interior_wall_items_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_interior_wall_items_screen.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../items/inner_wall_item.dart';
import 'package:flutter/material.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class InnerWallScreen extends StatefulWidget {
  @override
  State<InnerWallScreen> createState() => _InnerWallScreenState();
}

class _InnerWallScreenState extends State<InnerWallScreen> {
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
            ? dataInnerWallData.map(
                (catData) {
                  return Row(
                    children: [
                      Expanded(
                        child: InnerWallItem(
                          catData.name,
                          catData.description,
                          catData.unit,
                          catData.quantity,
                          catData.materialQuantity,
                          catData.laborHours1,
                          catData.laborHours2,
                          catData.laborCost,
                          catData.material1,
                          catData.material2,
                          catData.totalPrice,
                          catData.color,
                          catData.constructionType,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: double.infinity,
                          child: Center(
                            child: TextField(
                              controller:
                                  innerWallCalculationQuantityController,
                              onChanged: (value) {
                                setState(() {
                                  innerWallCalculationQuantityController.text =
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
            : languageNorwegian
                ? norwInnerWallData.map(
                    (catData) {
                      return Row(
                        children: [
                          Expanded(
                            child: InnerWallItem(
                              catData.name,
                              catData.description,
                              catData.unit,
                              catData.quantity,
                              catData.materialQuantity,
                              catData.laborHours1,
                              catData.laborHours2,
                              catData.laborCost,
                              catData.material1,
                              catData.material2,
                              catData.totalPrice,
                              catData.color,
                              catData.constructionType,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: double.infinity,
                              child: Center(
                                child: TextField(
                                  controller:
                                      norwInnerWallCalculationControllers,
                                  onChanged: (value) {
                                    setState(() {
                                      norwInnerWallCalculationControllers.text =
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
                    ? polInnerWallData.map(
                        (catData) {
                          return Row(
                            children: [
                              Expanded(
                                child: InnerWallItem(
                                  catData.name,
                                  catData.description,
                                  catData.unit,
                                  catData.quantity,
                                  catData.materialQuantity,
                                  catData.laborHours1,
                                  catData.laborHours2,
                                  catData.laborCost,
                                  catData.material1,
                                  catData.material2,
                                  catData.totalPrice,
                                  catData.color,
                                  catData.constructionType,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  height: double.infinity,
                                  child: Center(
                                    child: TextField(
                                      controller:
                                          polInnerWallCalculationControllers,
                                      onChanged: (value) {
                                        setState(() {
                                          polInnerWallCalculationControllers
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
                    : litInnerWallData.map(
                        (catData) {
                          return Row(
                            children: [
                              Expanded(
                                child: InnerWallItem(
                                  catData.name,
                                  catData.description,
                                  catData.unit,
                                  catData.quantity,
                                  catData.materialQuantity,
                                  catData.laborHours1,
                                  catData.laborHours2,
                                  catData.laborCost,
                                  catData.material1,
                                  catData.material2,
                                  catData.totalPrice,
                                  catData.color,
                                  catData.constructionType,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  height: double.infinity,
                                  child: Center(
                                    child: TextField(
                                      controller:
                                          litInnerWallCalculationControllers,
                                      onChanged: (value) {
                                        setState(() {
                                          litInnerWallCalculationControllers
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
