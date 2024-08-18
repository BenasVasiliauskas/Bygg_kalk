import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/items/support_system_item.dart';
import 'package:cost_calculator/pages/item_screen/support_system_screen.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_support_system_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_support_system_item_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_support_system_item_screen.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class SupportSystemScreen extends StatefulWidget {
  @override
  State<SupportSystemScreen> createState() => _SupportSystemScreenState();
}

class _SupportSystemScreenState extends State<SupportSystemScreen> {
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
            ? supportSystem.map(
                (catData) {
                  return Row(
                    children: [
                      Expanded(
                        child: SupportSystemItem(
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
                                  supportSystemCalculationQuantityController,
                              onChanged: (value) {
                                setState(() {
                                  supportSystemCalculationQuantityController
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
                ? norwSupportSystem.map((catData) {
                    return Row(
                      children: [
                        Expanded(
                          child: SupportSystemItem(
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
                                    norwSupportSystemCalculationControllers,
                                onChanged: (value) {
                                  setState(() {
                                    norwSupportSystemCalculationControllers
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
                  }).toList()
                : languagePolish
                    ? polSupportSystem.map((catData) {
                        return Row(
                          children: [
                            Expanded(
                              child: SupportSystemItem(
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
                                        polSupportSystemCalculationControllers,
                                    onChanged: (value) {
                                      setState(() {
                                        polSupportSystemCalculationControllers
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
                      }).toList()
                    : litSupportSystem.map((catData) {
                        return Row(
                          children: [
                            Expanded(
                              child: SupportSystemItem(
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
                                        litSupportSystemCalculationControllers,
                                    onChanged: (value) {
                                      setState(() {
                                        litSupportSystemCalculationControllers
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
                      }).toList(),
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        childAspectRatio: 7 / 2,
      ),
    );
  }
}
