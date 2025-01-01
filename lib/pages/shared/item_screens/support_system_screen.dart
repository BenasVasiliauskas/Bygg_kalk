import 'package:cost_calculator/constants/pol_budget_constants.dart' as pol;
import 'package:cost_calculator/constants/norw_budget_constants.dart' as norw;
import 'package:cost_calculator/constants/lit_budget_constants.dart' as lit;
import 'package:cost_calculator/constants/budget_constants.dart' as eng;
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/data/polish_data_folder/polish_data.dart';
import 'package:cost_calculator/items/support_system_item.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class SupportSystemScreen extends StatefulWidget {
  @override
  State<SupportSystemScreen> createState() => _SupportSystemScreenState();
}

class _SupportSystemScreenState extends State<SupportSystemScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();

  List<TextEditingController> supportSystemCalculationQuantityController = [];
  List<dynamic> filteredSupportSystemData = [];
  //Variables to hold the total sum of each field
  double totalLaborHours = 0.0;
  double totalLaborCost = 0.0;
  double totalMaterialCost = 0.0;
  double totalPriceSum = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
    filteredSupportSystemData = languageEnglish
        ? supportSystem
        : languageNorwegian
            ? norwSupportSystem
            : languagePolish
                ? polSupportSystem
                : litSupportSystem;

    // Initialize controllers for each item
    supportSystemCalculationQuantityController = List.generate(
      filteredSupportSystemData.length,
      (index) => TextEditingController(
        text: filteredSupportSystemData[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    // Dispose of controllers when the widget is destroyed
    for (var controller in supportSystemCalculationQuantityController) {
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
              ? "Support System"
              : languageNorwegian
                  ? "Bæresystemer"
                  : languagePolish
                      ? "Systemy wspierające"
                      : "Palaikymo sistema"),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          children: List.generate(filteredSupportSystemData.length, (index) {
            var catData = filteredSupportSystemData[index];
            var controller = supportSystemCalculationQuantityController[index];

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
                              norwSupportSystem[index].calculationQuantity =
                                  parsedValue;
                              polSupportSystem[index].calculationQuantity =
                                  parsedValue;
                              litSupportSystem[index].calculationQuantity =
                                  parsedValue;
                              supportSystem[index].calculationQuantity =
                                  parsedValue;

                              // Update labor hours 2
                              for (int i = 0;
                                  i < catData.laborHours2.length;
                                  i++) {
                                //
                                norwSupportSystem[index].laborHours2[i] =
                                    norwSupportSystem[index].laborHours1[i] *
                                        norwSupportSystem[index]
                                            .calculationQuantity;
                                //
                                polSupportSystem[index].laborHours2[i] =
                                    polSupportSystem[index].laborHours1[i] *
                                        polSupportSystem[index]
                                            .calculationQuantity;
                                //
                                litSupportSystem[index].laborHours2[i] =
                                    litSupportSystem[index].laborHours1[i] *
                                        litSupportSystem[index]
                                            .calculationQuantity;
                                //
                                supportSystem[index].laborHours2[i] =
                                    supportSystem[index].laborHours1[i] *
                                        supportSystem[index]
                                            .calculationQuantity;
                                // Update labor cost

                                norwSupportSystem[index].laborCost[i] =
                                    norwSupportSystem[index].laborHours2[i] *
                                        hourlyRate;

                                polSupportSystem[index].laborCost[i] =
                                    polSupportSystem[index].laborHours2[i] *
                                        hourlyRate;

                                litSupportSystem[index].laborCost[i] =
                                    litSupportSystem[index].laborHours2[i] *
                                        hourlyRate;

                                supportSystem[index].laborCost[i] =
                                    supportSystem[index].laborHours2[i] *
                                        hourlyRate;

                                // Update material costs

                                norwSupportSystem[index].materials[i] =
                                    norwSupportSystem[index].material[i] *
                                        norwSupportSystem[index]
                                            .calculationQuantity;

                                polSupportSystem[index].materials[i] =
                                    polSupportSystem[index].material[i] *
                                        polSupportSystem[index]
                                            .calculationQuantity;

                                litSupportSystem[index].materials[i] =
                                    litSupportSystem[index].material[i] *
                                        litSupportSystem[index]
                                            .calculationQuantity;

                                supportSystem[index].materials[i] =
                                    supportSystem[index].material[i] *
                                        supportSystem[index]
                                            .calculationQuantity;
                                // Update total price (labor + materials)

                                norwSupportSystem[index].totalPrice[i] =
                                    norwSupportSystem[index].materials[i] +
                                        norwSupportSystem[index].laborCost[i];

                                polSupportSystem[index].totalPrice[i] =
                                    polSupportSystem[index].materials[i] +
                                        polSupportSystem[index].laborCost[i];

                                litSupportSystem[index].totalPrice[i] =
                                    litSupportSystem[index].materials[i] +
                                        litSupportSystem[index].laborCost[i];

                                supportSystem[index].totalPrice[i] =
                                    supportSystem[index].materials[i] +
                                        supportSystem[index].laborCost[i];
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
                                  supportSystem[index].name, totalLaborHours);
                              eng.addLaborCosts(
                                  supportSystem[index].name, totalLaborCost);
                              eng.addMaterialCosts(
                                  supportSystem[index].name, totalMaterialCost);
                              eng.addBudgetSum(
                                  supportSystem[index].name, totalPriceSum);

                              norw.addHours(norwSupportSystem[index].name,
                                  totalLaborHours);
                              norw.addLaborCosts(norwSupportSystem[index].name,
                                  totalLaborCost);
                              norw.addMaterialCosts(
                                  norwSupportSystem[index].name,
                                  totalMaterialCost);
                              norw.addBudgetSum(
                                  norwSupportSystem[index].name, totalPriceSum);

                              pol.addHours(polSupportSystem[index].name,
                                  totalLaborHours);
                              pol.addLaborCosts(
                                  polSupportSystem[index].name, totalLaborCost);
                              pol.addMaterialCosts(polSupportSystem[index].name,
                                  totalMaterialCost);
                              pol.addBudgetSum(
                                  polSupportSystem[index].name, totalPriceSum);

                              lit.addHours(litSupportSystem[index].name,
                                  totalLaborHours);
                              lit.addLaborCosts(
                                  litSupportSystem[index].name, totalLaborCost);
                              lit.addMaterialCosts(litSupportSystem[index].name,
                                  totalMaterialCost);
                              lit.addBudgetSum(
                                  litSupportSystem[index].name, totalPriceSum);
                            });
                          }),
                    ),
                  ),
                ),
                Text(
                  catData.unit[0],
                ),
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
