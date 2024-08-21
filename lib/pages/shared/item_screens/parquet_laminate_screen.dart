import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/items/parquet_laminate_item.dart';
import 'package:cost_calculator/pages/item_screen/parquet_laminate_items_screen.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_parquet_laminate_items_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_parquet_laminate_items_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_parquet_laminate_items_screen.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class ParquetLaminateScreen extends StatefulWidget {
  @override
  State<ParquetLaminateScreen> createState() => _ParquetLaminateScreenState();
}

class _ParquetLaminateScreenState extends State<ParquetLaminateScreen> {
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
            ? parquetAndLaminate.map(
                (catData) {
                  return Row(
                    children: [
                      Expanded(
                        child: ParquetLaminateItem(
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
                                  parquetAndLaminateCalculationControllers,
                              onChanged: (value) {
                                setState(() {
                                  parquetAndLaminateCalculationControllers
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
            : languageNorwegian
                ? norwParquetAndLaminate.map(
                    (catData) {
                      return Row(
                        children: [
                          Expanded(
                            child: ParquetLaminateItem(
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
                                      norwParquetAndLaminateCalculationControllers,
                                  onChanged: (value) {
                                    setState(() {
                                      norwParquetAndLaminateCalculationControllers
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
                : languagePolish
                    ? polParquetAndLaminate.map(
                        (catData) {
                          return Row(
                            children: [
                              Expanded(
                                child: ParquetLaminateItem(
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
                                          polParquetAndLaminateCalculationControllers,
                                      onChanged: (value) {
                                        setState(() {
                                          polParquetAndLaminateCalculationControllers
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
                    : litParquetAndLaminate.map(
                        (catData) {
                          return Row(
                            children: [
                              Expanded(
                                child: ParquetLaminateItem(
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
                                          litParquetAndLaminateCalculationControllers,
                                      onChanged: (value) {
                                        setState(() {
                                          litParquetAndLaminateCalculationControllers
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
