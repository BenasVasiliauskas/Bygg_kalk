import 'package:cost_calculator/constants/pol_budget_constants.dart' as pol;
import 'package:cost_calculator/constants/norw_budget_constants.dart' as norw;
import 'package:cost_calculator/constants/lit_budget_constants.dart' as lit;
import 'package:cost_calculator/constants/budget_constants.dart' as eng;
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/data/polish_data_folder/polish_data.dart';
import 'package:cost_calculator/items/terrace_item.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class TerraceScreen extends StatefulWidget {
  @override
  State<TerraceScreen> createState() => _TerraceScreenState();
}

class _TerraceScreenState extends State<TerraceScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();

  List<TextEditingController> terraceCalculationControllers = [];
  List<dynamic> filteredTerraceData = [];
  //Variables to hold the total sum of each field
  double totalLaborHours = 0.0;
  double totalLaborCost = 0.0;
  double totalMaterialCost = 0.0;
  double totalPriceSum = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
    filteredTerraceData = languageEnglish
        ? terraceData
        : languageNorwegian
            ? norwTerraceData
            : languagePolish
                ? polTerraceData
                : litTerraceData;

    // Initialize controllers for each item
    terraceCalculationControllers = List.generate(
      filteredTerraceData.length,
      (index) => TextEditingController(
        text: filteredTerraceData[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    // Dispose of controllers when the widget is destroyed
    for (var controller in terraceCalculationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return buildingComponentsScreen();
          }),
        );
      },
      child: Scaffold(
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
          title: Text(languageEnglish
              ? 'Terrace'
              : languageNorwegian
                  ? 'Terrasser'
                  : languagePolish
                      ? 'Tarasy'
                      : 'Terasos'),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          children: List.generate(filteredTerraceData.length, (index) {
            var catData = filteredTerraceData[index];
            var controller = terraceCalculationControllers[index];

            return Row(
              children: [
                Expanded(
                  child: TerraceItem(
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
                    catData.calculationQuantity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: 35,
                    height: double.infinity,
                    child: Center(
                      child: TextField(
                        controller: controller,
                        onChanged: (value) {
                          setState(() {
                            double parsedValue = double.tryParse(value) ?? 0.0;
                            catData.calculationQuantity = parsedValue;
                            //Update labor hours 2
                            for (int i = 0;
                                i < catData.laborHours2.length;
                                i++) {
                              //
                              norwTerraceData[index].laborHours2[i] =
                                  norwTerraceData[index].laborHours1[i] *
                                      norwTerraceData[index]
                                          .calculationQuantity;
                              //
                              polTerraceData[index].laborHours2[i] =
                                  polTerraceData[index].laborHours1[i] *
                                      polTerraceData[index].calculationQuantity;
                              //
                              litTerraceData[index].laborHours2[i] =
                                  litTerraceData[index].laborHours1[i] *
                                      litTerraceData[index].calculationQuantity;
                              //
                              terraceData[index].laborHours2[i] =
                                  terraceData[index].laborHours1[i] *
                                      terraceData[index].calculationQuantity;
                              // Update labor cost

                              norwTerraceData[index].laborCost[i] =
                                  norwTerraceData[index].laborHours2[i] *
                                      hourlyRate;

                              polTerraceData[index].laborCost[i] =
                                  polTerraceData[index].laborHours2[i] *
                                      hourlyRate;

                              litTerraceData[index].laborCost[i] =
                                  litTerraceData[index].laborHours2[i] *
                                      hourlyRate;

                              terraceData[index].laborCost[i] =
                                  terraceData[index].laborHours2[i] *
                                      hourlyRate;

                              // Update material costs

                              norwTerraceData[index].materials[i] =
                                  norwTerraceData[index].material[i] *
                                      norwTerraceData[index]
                                          .calculationQuantity;

                              polTerraceData[index].materials[i] =
                                  polTerraceData[index].material[i] *
                                      polTerraceData[index].calculationQuantity;

                              litTerraceData[index].materials[i] =
                                  litTerraceData[index].material[i] *
                                      litTerraceData[index].calculationQuantity;

                              terraceData[index].materials[i] =
                                  terraceData[index].material[i] *
                                      terraceData[index].calculationQuantity;
                              // Update total price (labor + materials)

                              norwTerraceData[index].totalPrice[i] =
                                  norwTerraceData[index].materials[i] +
                                      norwTerraceData[index].laborCost[i];

                              polTerraceData[index].totalPrice[i] =
                                  polTerraceData[index].materials[i] +
                                      polTerraceData[index].laborCost[i];

                              litTerraceData[index].totalPrice[i] =
                                  litTerraceData[index].materials[i] +
                                      litTerraceData[index].laborCost[i];

                              terraceData[index].totalPrice[i] =
                                  terraceData[index].materials[i] +
                                      terraceData[index].laborCost[i];
                            }
                            totalLaborHours = catData.laborHours2.fold(
                                0, (prev, laborHours) => prev + laborHours);

                            totalLaborCost = catData.laborCost
                                .fold(0, (prev, laborCost) => prev + laborCost);

                            totalMaterialCost = catData.materials.fold(
                                0, (prev, materialCost) => prev + materialCost);

                            totalPriceSum = catData.totalPrice.fold(
                                0, (prev, totalPrice) => prev + totalPrice);
                            // Update the total budget
                            eng.addHours(
                                terraceData[index].name, totalLaborHours);
                            eng.addLaborCosts(
                                terraceData[index].name, totalLaborCost);
                            eng.addMaterialCosts(
                                terraceData[index].name, totalMaterialCost);
                            eng.addBudgetSum(
                                terraceData[index].name, totalPriceSum);

                            norw.addHours(
                                norwTerraceData[index].name, totalLaborHours);
                            norw.addLaborCosts(
                                norwTerraceData[index].name, totalLaborCost);
                            norw.addMaterialCosts(
                                norwTerraceData[index].name, totalMaterialCost);
                            norw.addBudgetSum(
                                norwTerraceData[index].name, totalPriceSum);

                            pol.addHours(
                                polTerraceData[index].name, totalLaborHours);
                            pol.addLaborCosts(
                                polTerraceData[index].name, totalLaborCost);
                            pol.addMaterialCosts(
                                polTerraceData[index].name, totalMaterialCost);
                            pol.addBudgetSum(
                                polTerraceData[index].name, totalPriceSum);

                            lit.addHours(
                                litTerraceData[index].name, totalLaborHours);
                            lit.addLaborCosts(
                                litTerraceData[index].name, totalLaborCost);
                            lit.addMaterialCosts(
                                litTerraceData[index].name, totalMaterialCost);
                            lit.addBudgetSum(
                                litTerraceData[index].name, totalPriceSum);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Text(languageEnglish
                    ? "m"
                    : languageNorwegian
                        ? "lm"
                        : languagePolish
                            ? "m"
                            : "m"),
              ],
            );
          }),
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          childAspectRatio: 2,
        ),
      ),
    );
  }
}
