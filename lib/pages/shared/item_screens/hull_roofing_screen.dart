import 'package:cost_calculator/constants/pol_budget_constants.dart' as pol;
import 'package:cost_calculator/constants/norw_budget_constants.dart' as norw;
import 'package:cost_calculator/constants/lit_budget_constants.dart' as lit;
import 'package:cost_calculator/constants/budget_constants.dart' as eng;
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/data/polish_data_folder/polish_data.dart';
import 'package:cost_calculator/items/hull_roofing_item.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class HullRoofingScreen extends StatefulWidget {
  @override
  State<HullRoofingScreen> createState() => _HullRoofingScreenState();
}

class _HullRoofingScreenState extends State<HullRoofingScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();
  List<TextEditingController> hullCalculationControllers = [];
  List<dynamic> filteredHullRoofingData = [];

  //Variables to hold the total sum of each field
  double totalLaborHours = 0.0;
  double totalLaborCost = 0.0;
  double totalMaterialCost = 0.0;
  double totalPriceSum = 0.0;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
    filteredHullRoofingData = languageEnglish
        ? hullRoofingData
        : languageNorwegian
            ? norwHullRoofingData
            : languagePolish
                ? polHullRoofingData
                : litHullRoofingData;

    // Initialize controllers for each item
    hullCalculationControllers = List.generate(
      filteredHullRoofingData.length,
      (index) => TextEditingController(
        text: filteredHullRoofingData[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of controllers when the widget is destroyed
    for (var controller in hullCalculationControllers) {
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
              ? 'Hull and Roofing'
              : languageNorwegian
                  ? "Skrog og tak"
                  : languagePolish
                      ? "Kadłub i pokrycie"
                      : "Korpusas ir stogas"),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          children: List.generate(
            hullRoofingData.length,
            (index) {
              var catData = filteredHullRoofingData[index];
              var controller = hullCalculationControllers[index];

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
                              double parsedValue =
                                  double.tryParse(value) ?? 0.0;
                              catData.calculationQuantity = parsedValue;
                              //Update labor hours 2
                              for (int i = 0;
                                  i < catData.laborHours2.length;
                                  i++) {
                                //
                                norwHullRoofingData[index].laborHours2[i] =
                                    norwHullRoofingData[index].laborHours1[i] *
                                        norwHullRoofingData[index]
                                            .calculationQuantity;
                                //
                                polHullRoofingData[index].laborHours2[i] =
                                    polHullRoofingData[index].laborHours1[i] *
                                        polHullRoofingData[index]
                                            .calculationQuantity;
                                //
                                litHullRoofingData[index].laborHours2[i] =
                                    litHullRoofingData[index].laborHours1[i] *
                                        litHullRoofingData[index]
                                            .calculationQuantity;
                                //
                                hullRoofingData[index].laborHours2[i] =
                                    hullRoofingData[index].laborHours1[i] *
                                        hullRoofingData[index]
                                            .calculationQuantity;
                                // Update labor cost

                                norwHullRoofingData[index].laborCost[i] =
                                    norwHullRoofingData[index].laborHours2[i] *
                                        hourlyRate;

                                polHullRoofingData[index].laborCost[i] =
                                    polHullRoofingData[index].laborHours2[i] *
                                        hourlyRate;

                                litHullRoofingData[index].laborCost[i] =
                                    litHullRoofingData[index].laborHours2[i] *
                                        hourlyRate;

                                hullRoofingData[index].laborCost[i] =
                                    hullRoofingData[index].laborHours2[i] *
                                        hourlyRate;

                                // Update material costs

                                norwHullRoofingData[index].materials[i] =
                                    norwHullRoofingData[index].material[i] *
                                        norwHullRoofingData[index]
                                            .calculationQuantity;

                                polHullRoofingData[index].materials[i] =
                                    polHullRoofingData[index].material[i] *
                                        polHullRoofingData[index]
                                            .calculationQuantity;

                                litHullRoofingData[index].materials[i] =
                                    litHullRoofingData[index].material[i] *
                                        litHullRoofingData[index]
                                            .calculationQuantity;

                                hullRoofingData[index].materials[i] =
                                    hullRoofingData[index].material[i] *
                                        hullRoofingData[index]
                                            .calculationQuantity;
                                // Update total price (labor + materials)

                                norwHullRoofingData[index].totalPrice[i] =
                                    norwHullRoofingData[index].materials[i] +
                                        norwHullRoofingData[index].laborCost[i];

                                polHullRoofingData[index].totalPrice[i] =
                                    polHullRoofingData[index].materials[i] +
                                        polHullRoofingData[index].laborCost[i];

                                litHullRoofingData[index].totalPrice[i] =
                                    litHullRoofingData[index].materials[i] +
                                        litHullRoofingData[index].laborCost[i];

                                hullRoofingData[index].totalPrice[i] =
                                    hullRoofingData[index].materials[i] +
                                        hullRoofingData[index].laborCost[i];
                              }
                              totalLaborHours = catData.laborHours2.fold(
                                  0, (prev, laborHours) => prev + laborHours);

                              totalLaborCost = catData.laborCost.fold(
                                  0, (prev, laborCost) => prev + laborCost);

                              totalMaterialCost = catData.materials.fold(0,
                                  (prev, materialCost) => prev + materialCost);

                              totalPriceSum = catData.totalPrice.fold(
                                  0, (prev, totalPrice) => prev + totalPrice);
                              // Update the total budget
                              eng.addHours(
                                  hullRoofingData[index].name, totalLaborHours);
                              eng.addLaborCosts(
                                  hullRoofingData[index].name, totalLaborCost);
                              eng.addMaterialCosts(hullRoofingData[index].name,
                                  totalMaterialCost);
                              eng.addBudgetSum(
                                  hullRoofingData[index].name, totalPriceSum);

                              norw.addHours(norwHullRoofingData[index].name,
                                  totalLaborHours);
                              norw.addLaborCosts(
                                  norwHullRoofingData[index].name,
                                  totalLaborCost);
                              norw.addMaterialCosts(
                                  norwHullRoofingData[index].name,
                                  totalMaterialCost);
                              norw.addBudgetSum(norwHullRoofingData[index].name,
                                  totalPriceSum);

                              pol.addHours(polHullRoofingData[index].name,
                                  totalLaborHours);
                              pol.addLaborCosts(polHullRoofingData[index].name,
                                  totalLaborCost);
                              pol.addMaterialCosts(
                                  polHullRoofingData[index].name,
                                  totalMaterialCost);
                              pol.addBudgetSum(polHullRoofingData[index].name,
                                  totalPriceSum);

                              lit.addHours(litHullRoofingData[index].name,
                                  totalLaborHours);
                              lit.addLaborCosts(litHullRoofingData[index].name,
                                  totalLaborCost);
                              lit.addMaterialCosts(
                                  litHullRoofingData[index].name,
                                  totalMaterialCost);
                              lit.addBudgetSum(litHullRoofingData[index].name,
                                  totalPriceSum);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Text(languageEnglish
                      ? "Units"
                      : languageNorwegian
                          ? "stk"
                          : languagePolish
                              ? "szt."
                              : "vnt."),
                ],
              );
            },
          ),
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          childAspectRatio: 2,
        ),
      ),
    );
  }
}
