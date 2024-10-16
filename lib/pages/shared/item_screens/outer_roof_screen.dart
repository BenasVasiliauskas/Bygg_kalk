import 'package:cost_calculator/constants/pol_budget_constants.dart' as pol;
import 'package:cost_calculator/constants/norw_budget_constants.dart' as norw;
import 'package:cost_calculator/constants/lit_budget_constants.dart' as lit;
import 'package:cost_calculator/constants/budget_constants.dart' as eng;
import 'package:cost_calculator/data/english%20data%20folder/data.dart';
import 'package:cost_calculator/data/lithuanian%20data%20folder/lith_data.dart';
import 'package:cost_calculator/data/norwegian%20data%20folder/norw_data.dart';
import 'package:cost_calculator/data/polish%20data%20folder/polish_data.dart';
import 'package:cost_calculator/items/outer_roof_item.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class OuterRoofScreen extends StatefulWidget {
  final String constructionType;

  const OuterRoofScreen({Key? key, required this.constructionType})
      : super(key: key);

  State<OuterRoofScreen> createState() => _OuterRoofScreenState();
}

class _OuterRoofScreenState extends State<OuterRoofScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();

  List<TextEditingController> outerRoofCalculationControllers = [];
  List<dynamic> filteredOuterRoofData = [];

  //Variables to hold the total sum of each field
  double totalLaborHours = 0.0;
  double totalLaborCost = 0.0;
  double totalMaterialCost = 0.0;
  double totalPriceSum = 0.0;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
    List<dynamic> currentOuterRoofData = languageEnglish
        ? outerRoofData
        : languageNorwegian
            ? norwOuterRoofData
            : languagePolish
                ? polOuterRoofData
                : litOuterRoofData;

    filteredOuterRoofData = currentOuterRoofData
        .where((e) => e.constructionType == widget.constructionType)
        .toList();

    // Initialize controllers for each item
    outerRoofCalculationControllers = List.generate(
      filteredOuterRoofData.length,
      (index) => TextEditingController(
        text: filteredOuterRoofData[index].calculationQuantity.toString(),
      ),
    );
  }

  void _calculateTotals() {
    // Reset total values
    totalLaborHours = 0.0;
    totalLaborCost = 0.0;
    totalMaterialCost = 0.0;
    totalPriceSum = 0.0;

    // Sum up the values for each item in filteredOuterRoofData
    for (var item in filteredOuterRoofData) {
      // Ensure the lists are not empty before calling reduce to avoid runtime errors
      if (item.laborHours2.isNotEmpty) {
        totalLaborHours += item.laborHours2
            .reduce((double value, double element) => value + element);
      }
      if (item.laborCost.isNotEmpty) {
        totalLaborCost += item.laborCost
            .reduce((double value, double element) => value + element);
      }
      if (item.materials.isNotEmpty) {
        totalMaterialCost += item.materials
            .reduce((double value, double element) => value + element);
      }
      if (item.totalPrice.isNotEmpty) {
        totalPriceSum += item.totalPrice
            .reduce((double value, double element) => value + element);
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    // Dispose of controllers when the widget is destroyed
    for (var controller in outerRoofCalculationControllers) {
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
            return homePage();
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
          children: List.generate(filteredOuterRoofData.length, (index) {
            var catData = filteredOuterRoofData[index];
            var controller = outerRoofCalculationControllers[index];

            return Row(
              children: [
                Expanded(
                  child: OuterRoofItem(
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
                            if (languageEnglish) {
                              eng.addHours(catData.name, totalLaborHours);
                              eng.addLaborCosts(catData.name, totalLaborCost);
                              eng.addMaterialCosts(
                                  catData.name, totalMaterialCost);
                              eng.addBudgetSum(catData.name, totalPriceSum);
                            } else if (languageNorwegian) {
                              norw.addHours(catData.name, totalLaborHours);
                              norw.addLaborCosts(catData.name, totalLaborCost);
                              norw.addMaterialCosts(
                                  catData.name, totalMaterialCost);
                              norw.addBudgetSum(catData.name, totalPriceSum);
                            } else if (languagePolish) {
                              pol.addHours(catData.name, totalLaborHours);
                              pol.addLaborCosts(catData.name, totalLaborCost);
                              pol.addMaterialCosts(
                                  catData.name, totalMaterialCost);
                              pol.addBudgetSum(catData.name, totalPriceSum);
                            } else {
                              lit.addHours(catData.name, totalLaborHours);
                              lit.addLaborCosts(catData.name, totalLaborCost);
                              lit.addMaterialCosts(
                                  catData.name, totalMaterialCost);
                              lit.addBudgetSum(catData.name, totalPriceSum);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Text("m²"),
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
