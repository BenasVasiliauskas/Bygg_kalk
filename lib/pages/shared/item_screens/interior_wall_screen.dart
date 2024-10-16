import 'package:cost_calculator/constants/pol_budget_constants.dart' as pol;
import 'package:cost_calculator/constants/norw_budget_constants.dart' as norw;
import 'package:cost_calculator/constants/lit_budget_constants.dart' as lit;
import 'package:cost_calculator/constants/budget_constants.dart' as eng;
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/data/polish_data_folder/polish_data.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../items/inner_wall_item.dart';
import 'package:flutter/material.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class InnerWallScreen extends StatefulWidget {
  final String constructionType;

  const InnerWallScreen({Key? key, required this.constructionType})
      : super(key: key);

  State<InnerWallScreen> createState() => _InnerWallScreenState();
}

class _InnerWallScreenState extends State<InnerWallScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();

  List<TextEditingController> innerWallCalculationQuantityController = [];
  List<dynamic> filteredInnerWallData = [];
  //Variables to hold the total sum of each field
  double totalLaborHours = 0.0;
  double totalLaborCost = 0.0;
  double totalMaterialCost = 0.0;
  double totalPriceSum = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();

    // Select the appropriate data list based on the current language
    List<dynamic> currentDataInnerWallData = languageEnglish
        ? dataInnerWallData
        : languageNorwegian
            ? norwInnerWallData
            : languagePolish
                ? polInnerWallData
                : litInnerWallData;

    filteredInnerWallData = currentDataInnerWallData
        .where((e) => e.constructionType == widget.constructionType)
        .toList();

    // Initialize controllers for each item in the selected data list
    innerWallCalculationQuantityController = List.generate(
      filteredInnerWallData.length,
      (index) => TextEditingController(
        text: filteredInnerWallData[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    // Dispose of controllers when the widget is destroyed
    for (var controller in innerWallCalculationQuantityController) {
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
          title: const Text('Bygg Kalk'),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          children: List.generate(filteredInnerWallData.length, (index) {
            var catData = filteredInnerWallData[index];
            var controller = innerWallCalculationQuantityController[index];
            return Row(
              children: [
                Expanded(
                  child: InnerWallItem(
                    catData.name,
                    catData.description,
                    catData.unit,
                    catData.quantity,
                    catData.laborHours1,
                    catData.laborHours2,
                    catData.laborCost,
                    catData.material1,
                    catData.material2,
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
                            totalLaborHours = catData.laborHours2.fold(
                                0, (prev, laborHours) => prev + laborHours);

                            totalLaborCost = catData.laborCost
                                .fold(0, (prev, laborCost) => prev + laborCost);

                            totalMaterialCost = catData.materials.fold(
                                0, (prev, materialCost) => prev + materialCost);

                            totalPriceSum = catData.totalPrice.fold(
                                0, (prev, totalPrice) => prev + totalPrice);
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
