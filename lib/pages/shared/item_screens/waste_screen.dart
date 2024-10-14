import 'package:cost_calculator/constants/budget_constants.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/items/Waste_item.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class WasteScreen extends StatefulWidget {
  @override
  State<WasteScreen> createState() => _WasteScreenState();
}

class _WasteScreenState extends State<WasteScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();

  List<TextEditingController> wasteCalculationControllers = [];
  List<dynamic> filteredWasteData = [];
  //Variables to hold the total sum of each field
  double totalLaborHours = 0.0;
  double totalLaborCost = 0.0;
  double totalMaterialCost = 0.0;
  double totalPriceSum = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
    filteredWasteData = languageEnglish
        ? wasteData
        : languageNorwegian
            ? norwWasteData
            : languagePolish
                ? polWasteData
                : litWasteData;

    // Initialize controllers for each item
    wasteCalculationControllers = List.generate(
      filteredWasteData.length,
      (index) => TextEditingController(
        text: filteredWasteData[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    // Dispose of controllers when the widget is destroyed
    for (var controller in wasteCalculationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _calculateTotals() {
    // Reset total values
    totalLaborHours = 0.0;
    totalLaborCost = 0.0;
    totalMaterialCost = 0.0;
    totalPriceSum = 0.0;

    // Sum up the values for each item in filteredWasteData
    for (var deckItem in filteredWasteData) {
      // Ensure the lists are not empty before calling reduce to avoid runtime errors
      if (deckItem.laborHours2.isNotEmpty) {
        totalLaborHours += deckItem.laborHours2
            .reduce((double value, double element) => value + element);
      }
      if (deckItem.laborCost.isNotEmpty) {
        totalLaborCost += deckItem.laborCost
            .reduce((double value, double element) => value + element);
      }
      if (deckItem.materials.isNotEmpty) {
        totalMaterialCost += deckItem.materials
            .reduce((double value, double element) => value + element);
      }
      if (deckItem.totalPrice.isNotEmpty) {
        totalPriceSum += deckItem.totalPrice
            .reduce((double value, double element) => value + element);
      }
    }
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
          title: const Text('Bygg Kalk'),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          children: List.generate(filteredWasteData.length, (index) {
            var catData = filteredWasteData[index];
            var controller = wasteCalculationControllers[index];

            return Row(
              children: [
                Expanded(
                  child: WasteItem(
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
                    width: 100,
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
                              catData.laborHours2[i] = catData.laborHours1[i] *
                                  catData.calculationQuantity;
                            }
                            // Update labor cost
                            for (int i = 0; i < catData.laborCost.length; i++) {
                              catData.laborCost[i] =
                                  catData.laborHours2[i] * hourlyRate;
                            }
                            // Update material costs
                            for (int i = 0; i < catData.materials.length; i++) {
                              catData.materials[i] = catData.material[i] *
                                  catData.calculationQuantity;
                            }
                            // Update total price (labor + materials)
                            for (int i = 0;
                                i < catData.totalPrice.length;
                                i++) {
                              catData.totalPrice[i] =
                                  catData.materials[i] + catData.laborCost[i];
                            }
                            // Calculate the total budget
                            _calculateTotals();
                            // Update the total budget
                            addHours(catData.name, totalLaborHours);
                            addLaborCosts(catData.name, totalLaborCost);
                            addMaterialCosts(catData.name, totalMaterialCost);
                            addBudgetSum(catData.name, totalPriceSum);
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
          childAspectRatio: 7 / 2,
        ),
      ),
    );
  }
}
