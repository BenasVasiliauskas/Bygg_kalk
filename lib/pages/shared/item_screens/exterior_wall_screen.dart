import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/items/outer_wall_item.dart';
import 'package:cost_calculator/pages/item_screen/exterior_wall_items_screen.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_exterior_wall_items_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_exterior_wall_items_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_exterior_wall_items_screen.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class ExteriorWallScreen extends StatefulWidget {
  @override
  State<ExteriorWallScreen> createState() => _ExteriorWallScreenState();
}

class _ExteriorWallScreenState extends State<ExteriorWallScreen> {
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
            ? exteriorWallData.map(
                (wallItem) {
                  return Row(
                    children: [
                      Expanded(
                        child: OuterWallItem(
                          wallItem.name,
                          wallItem.description,
                          wallItem.unit,
                          wallItem.quantity,
                          wallItem.materialQuantity,
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
                              controller: exteriorWallCalculationControllers,
                              onChanged: (value) {
                                setState(() {
                                  exteriorWallCalculationControllers.text =
                                      value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Text("m²"),
                    ],
                  );
                },
              ).toList()
            : languageNorwegian
                ? norwExteriorWallData.map((wallItem) {
                    return Row(
                      children: [
                        Expanded(
                          child: OuterWallItem(
                            wallItem.name,
                            wallItem.description,
                            wallItem.unit,
                            wallItem.quantity,
                            wallItem.materialQuantity,
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
                                    norwExteriorWallCalculationControllers,
                                onChanged: (value) {
                                  setState(() {
                                    norwExteriorWallCalculationControllers
                                        .text = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Text("m²"),
                      ],
                    );
                  }).toList()
                : languagePolish
                    ? polExteriorWallData.map((wallItem) {
                        return Row(
                          children: [
                            Expanded(
                              child: OuterWallItem(
                                wallItem.name,
                                wallItem.description,
                                wallItem.unit,
                                wallItem.quantity,
                                wallItem.materialQuantity,
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
                                        polExteriorWallCalculationControllers,
                                    onChanged: (value) {
                                      setState(() {
                                        polExteriorWallCalculationControllers
                                            .text = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Text("m²"),
                          ],
                        );
                      }).toList()
                    : litExteriorWallData.map((wallItem) {
                        return Row(
                          children: [
                            Expanded(
                              child: OuterWallItem(
                                wallItem.name,
                                wallItem.description,
                                wallItem.unit,
                                wallItem.quantity,
                                wallItem.materialQuantity,
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
                                        litExteriorWallCalculationControllers,
                                    onChanged: (value) {
                                      setState(() {
                                        litExteriorWallCalculationControllers
                                            .text = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Text("m²"),
                          ],
                        );
                      }).toList(),
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        childAspectRatio: 7 / 2,
      ),
    );
  }
}
