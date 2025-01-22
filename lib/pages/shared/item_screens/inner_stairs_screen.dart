import 'package:cost_calculator/constants/pol_budget_constants.dart' as pol;
import 'package:cost_calculator/constants/norw_budget_constants.dart' as norw;
import 'package:cost_calculator/constants/lit_budget_constants.dart' as lit;
import 'package:cost_calculator/constants/budget_constants.dart' as eng;
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/data/polish_data_folder/polish_data.dart';
import 'package:cost_calculator/items/inner_stairs_item.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class InnerStairsScreen extends StatefulWidget {
  @override
  State<InnerStairsScreen> createState() => _InnerStairsScreen();
}

class _InnerStairsScreen extends State<InnerStairsScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();

  List<TextEditingController> innerStairsCalculationControllers = [];
  List<dynamic> filteredInnerStairsData = [];
  //Variables to hold the total sum of each field
  double totalLaborHours = 0.0;
  double totalLaborCost = 0.0;
  double totalMaterialCost = 0.0;
  double totalPriceSum = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
    filteredInnerStairsData = languageEnglish
        ? innerStairsData
        : languageNorwegian
            ? norwInnerStairsData
            : languagePolish
                ? polInnerStairsData
                : litInnerStairsData;
    // Initialize controllers for each item
    innerStairsCalculationControllers = List.generate(
      filteredInnerStairsData.length,
      (index) => TextEditingController(
        text: filteredInnerStairsData[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    // Dispose of controllers when the widget is destroyed
    for (var controller in innerStairsCalculationControllers) {
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
              ? "New Construction"
              : languageLithuanian
                  ? "Nauja statyba"
                  : languageNorwegian
                      ? "Nye konstruksjons"
                      : "Nowa konstrukcja"),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          children: List.generate(innerStairsData.length, (index) {
            var catData = filteredInnerStairsData[index];
            var controller = innerStairsCalculationControllers[index];

            return Row(
              children: [
                Expanded(
                  child: InnerStairsItem(
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
                            norwInnerStairsData[index].calculationQuantity =
                                parsedValue;
                            polInnerStairsData[index].calculationQuantity =
                                parsedValue;
                            litInnerStairsData[index].calculationQuantity =
                                parsedValue;
                            innerStairsData[index].calculationQuantity =
                                parsedValue;
                            //Update labor hours 2
                            for (int i = 0;
                                i < catData.laborHours2.length;
                                i++) {
                              //
                              norwInnerStairsData[index].laborHours2[i] =
                                  norwInnerStairsData[index].laborHours1[i] *
                                      norwInnerStairsData[index]
                                          .calculationQuantity;
                              //
                              polInnerStairsData[index].laborHours2[i] =
                                  polInnerStairsData[index].laborHours1[i] *
                                      polInnerStairsData[index]
                                          .calculationQuantity;
                              //
                              litInnerStairsData[index].laborHours2[i] =
                                  litInnerStairsData[index].laborHours1[i] *
                                      litInnerStairsData[index]
                                          .calculationQuantity;
                              //
                              innerStairsData[index].laborHours2[i] =
                                  innerStairsData[index].laborHours1[i] *
                                      innerStairsData[index]
                                          .calculationQuantity;
                              // Update labor cost

                              norwInnerStairsData[index].laborCost[i] =
                                  norwInnerStairsData[index].laborHours2[i] *
                                      hourlyRate;

                              polInnerStairsData[index].laborCost[i] =
                                  polInnerStairsData[index].laborHours2[i] *
                                      hourlyRate;

                              litInnerStairsData[index].laborCost[i] =
                                  litInnerStairsData[index].laborHours2[i] *
                                      hourlyRate;

                              innerStairsData[index].laborCost[i] =
                                  innerStairsData[index].laborHours2[i] *
                                      hourlyRate;

                              // Update material costs

                              norwInnerStairsData[index].materials[i] =
                                  norwInnerStairsData[index].material[i] *
                                      norwInnerStairsData[index]
                                          .calculationQuantity;

                              polInnerStairsData[index].materials[i] =
                                  polInnerStairsData[index].material[i] *
                                      polInnerStairsData[index]
                                          .calculationQuantity;

                              litInnerStairsData[index].materials[i] =
                                  litInnerStairsData[index].material[i] *
                                      litInnerStairsData[index]
                                          .calculationQuantity;

                              innerStairsData[index].materials[i] =
                                  innerStairsData[index].material[i] *
                                      innerStairsData[index]
                                          .calculationQuantity;
                              // Update total price (labor + materials)

                              norwInnerStairsData[index].totalPrice[i] =
                                  norwInnerStairsData[index].materials[i] +
                                      norwInnerStairsData[index].laborCost[i];

                              polInnerStairsData[index].totalPrice[i] =
                                  polInnerStairsData[index].materials[i] +
                                      polInnerStairsData[index].laborCost[i];

                              litInnerStairsData[index].totalPrice[i] =
                                  litInnerStairsData[index].materials[i] +
                                      litInnerStairsData[index].laborCost[i];

                              innerStairsData[index].totalPrice[i] =
                                  innerStairsData[index].materials[i] +
                                      innerStairsData[index].laborCost[i];
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
                                innerStairsData[index].name, totalLaborHours);
                            eng.addLaborCosts(
                                innerStairsData[index].name, totalLaborCost);
                            eng.addMaterialCosts(
                                innerStairsData[index].name, totalMaterialCost);
                            eng.addBudgetSum(
                                innerStairsData[index].name, totalPriceSum);

                            norw.addHours(norwInnerStairsData[index].name,
                                totalLaborHours);
                            norw.addLaborCosts(norwInnerStairsData[index].name,
                                totalLaborCost);
                            norw.addMaterialCosts(
                                norwInnerStairsData[index].name,
                                totalMaterialCost);
                            norw.addBudgetSum(
                                norwInnerStairsData[index].name, totalPriceSum);

                            pol.addHours(polInnerStairsData[index].name,
                                totalLaborHours);
                            pol.addLaborCosts(
                                polInnerStairsData[index].name, totalLaborCost);
                            pol.addMaterialCosts(polInnerStairsData[index].name,
                                totalMaterialCost);
                            pol.addBudgetSum(
                                polInnerStairsData[index].name, totalPriceSum);

                            lit.addHours(litInnerStairsData[index].name,
                                totalLaborHours);
                            lit.addLaborCosts(
                                litInnerStairsData[index].name, totalLaborCost);
                            lit.addMaterialCosts(litInnerStairsData[index].name,
                                totalMaterialCost);
                            lit.addBudgetSum(
                                litInnerStairsData[index].name, totalPriceSum);
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
          }),
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          childAspectRatio: 2,
        ),
      ),
    );
  }
}
