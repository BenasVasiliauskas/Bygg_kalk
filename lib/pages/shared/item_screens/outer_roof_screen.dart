import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/items/outer_roof_item.dart';
import 'package:cost_calculator/pages/item_screen/outer_roof_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_outer_roof_item_screen.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class OuterRoofScreen extends StatefulWidget {
  @override
  State<OuterRoofScreen> createState() => _OuterRoofScreenState();
}

class _OuterRoofScreenState extends State<OuterRoofScreen> {
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
            ? outerRoofData.map(
                (catData) {
                  return Row(
                    children: [
                      Expanded(
                        child: OuterRoofItem(
                          catData.name,
                          catData.description,
                          catData.unit,
                          catData.quantity,
                          catData.materialQuantity,
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
                              controller: outerRoofCalculationControllers,
                              onChanged: (value) {
                                setState(() {
                                  outerRoofCalculationControllers.text = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ).toList()
            : norwOuterRoofData.map(
                (catData) {
                  return Row(
                    children: [
                      Expanded(
                        child: OuterRoofItem(
                          catData.name,
                          catData.description,
                          catData.unit,
                          catData.quantity,
                          catData.materialQuantity,
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
                              controller: norwOuterRoofCalculationControllers,
                              onChanged: (value) {
                                setState(() {
                                  norwOuterRoofCalculationControllers.text =
                                      value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
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
