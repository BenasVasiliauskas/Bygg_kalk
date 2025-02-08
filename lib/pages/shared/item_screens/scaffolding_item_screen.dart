import 'package:cost_calculator/constants/pol_budget_constants.dart' as pol;
import 'package:cost_calculator/constants/norw_budget_constants.dart' as norw;
import 'package:cost_calculator/constants/lit_budget_constants.dart' as lit;
import 'package:cost_calculator/constants/budget_constants.dart' as eng;
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/scaffolding_units_LT.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/data/polish_data_folder/polish_data.dart';
import 'package:cost_calculator/items/scaffolding_data.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class ScaffoldingScreen extends StatefulWidget {
  @override
  State<ScaffoldingScreen> createState() => _ScaffoldingScreenState();
}

class _ScaffoldingScreenState extends State<ScaffoldingScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();

  List<TextEditingController> scaffoldingCalculationControllers = [];
  List<dynamic> filteredScaffoldingData = [];
  //Variables to hold the total sum of each field
  double totalLaborHours = 0.0;
  double totalLaborCost = 0.0;
  double totalMaterialCost = 0.0;
  double totalPriceSum = 0.0;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
    filteredScaffoldingData = languageEnglish
        ? scaffoldingData
        : languageNorwegian
            ? norwScaffoldingData
            : languagePolish
                ? polScaffoldingData
                : litScaffoldingData;

    // Initialize controllers for each item
    scaffoldingCalculationControllers = List.generate(
      filteredScaffoldingData.length,
      (index) => TextEditingController(
        text: filteredScaffoldingData[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    // Dispose of controllers when the widget is destroyed
    for (var controller in scaffoldingCalculationControllers) {
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
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return homePage();
        }));
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
              ? "Scaffolding - New Construction"
              : languageLithuanian
                  ? "Pastoliai - Nauja statyba"
                  : languageNorwegian
                      ? "Stillas - Nye konstruksjons"
                      : "Rusztowanie - Nowa konstrukcja"),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          children: List.generate(filteredScaffoldingData.length, (index) {
            var catData = filteredScaffoldingData[index];
            var controller = scaffoldingCalculationControllers[index];

            return Row(
              children: [
                Expanded(
                  child: ScaffoldingItem(
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
                            norwScaffoldingData[index].calculationQuantity =
                                parsedValue;
                            polScaffoldingData[index].calculationQuantity =
                                parsedValue;
                            litScaffoldingData[index].calculationQuantity =
                                parsedValue;
                            scaffoldingData[index].calculationQuantity =
                                parsedValue;
                            //Update labor hours 2
                            for (int i = 0;
                                i < catData.laborHours2.length;
                                i++) {
                              //
                              norwScaffoldingData[index].laborHours2[i] =
                                  norwScaffoldingData[index].laborHours1[i] *
                                      norwScaffoldingData[index]
                                          .calculationQuantity;
                              //
                              polScaffoldingData[index].laborHours2[i] =
                                  polScaffoldingData[index].laborHours1[i] *
                                      polScaffoldingData[index]
                                          .calculationQuantity;
                              //
                              litScaffoldingData[index].laborHours2[i] =
                                  litScaffoldingData[index].laborHours1[i] *
                                      litScaffoldingData[index]
                                          .calculationQuantity;
                              //
                              scaffoldingData[index].laborHours2[i] =
                                  scaffoldingData[index].laborHours1[i] *
                                      scaffoldingData[index]
                                          .calculationQuantity;
                              // Update labor cost

                              norwScaffoldingData[index].laborCost[i] =
                                  norwScaffoldingData[index].laborHours2[i] *
                                      hourlyRate;

                              polScaffoldingData[index].laborCost[i] =
                                  polScaffoldingData[index].laborHours2[i] *
                                      hourlyRate;

                              litScaffoldingData[index].laborCost[i] =
                                  litScaffoldingData[index].laborHours2[i] *
                                      hourlyRate;

                              scaffoldingData[index].laborCost[i] =
                                  scaffoldingData[index].laborHours2[i] *
                                      hourlyRate;

                              // Update material costs

                              norwScaffoldingData[index].materials[i] =
                                  norwScaffoldingData[index].material[i] *
                                      norwScaffoldingData[index]
                                          .calculationQuantity;

                              polScaffoldingData[index].materials[i] =
                                  polScaffoldingData[index].material[i] *
                                      polScaffoldingData[index]
                                          .calculationQuantity;

                              litScaffoldingData[index].materials[i] =
                                  litScaffoldingData[index].material[i] *
                                      litScaffoldingData[index]
                                          .calculationQuantity;

                              scaffoldingData[index].materials[i] =
                                  scaffoldingData[index].material[i] *
                                      scaffoldingData[index]
                                          .calculationQuantity;
                              // Update total price (labor + materials)

                              norwScaffoldingData[index].totalPrice[i] =
                                  norwScaffoldingData[index].materials[i] +
                                      norwScaffoldingData[index].laborCost[i];

                              polScaffoldingData[index].totalPrice[i] =
                                  polScaffoldingData[index].materials[i] +
                                      polScaffoldingData[index].laborCost[i];

                              litScaffoldingData[index].totalPrice[i] =
                                  litScaffoldingData[index].materials[i] +
                                      litScaffoldingData[index].laborCost[i];

                              scaffoldingData[index].totalPrice[i] =
                                  scaffoldingData[index].materials[i] +
                                      scaffoldingData[index].laborCost[i];
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
                                scaffoldingData[index].name, totalLaborHours);
                            eng.addLaborCosts(
                                scaffoldingData[index].name, totalLaborCost);
                            eng.addMaterialCosts(
                                scaffoldingData[index].name, totalMaterialCost);
                            eng.addBudgetSum(
                                scaffoldingData[index].name, totalPriceSum);

                            norw.addHours(norwScaffoldingData[index].name,
                                totalLaborHours);
                            norw.addLaborCosts(norwScaffoldingData[index].name,
                                totalLaborCost);
                            norw.addMaterialCosts(
                                norwScaffoldingData[index].name,
                                totalMaterialCost);
                            norw.addBudgetSum(
                                norwScaffoldingData[index].name, totalPriceSum);

                            pol.addHours(polScaffoldingData[index].name,
                                totalLaborHours);
                            pol.addLaborCosts(
                                polScaffoldingData[index].name, totalLaborCost);
                            pol.addMaterialCosts(polScaffoldingData[index].name,
                                totalMaterialCost);
                            pol.addBudgetSum(
                                polScaffoldingData[index].name, totalPriceSum);

                            lit.addHours(litScaffoldingData[index].name,
                                totalLaborHours);
                            lit.addLaborCosts(
                                litScaffoldingData[index].name, totalLaborCost);
                            lit.addMaterialCosts(litScaffoldingData[index].name,
                                totalMaterialCost);
                            lit.addBudgetSum(
                                litScaffoldingData[index].name, totalPriceSum);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                languageLithuanian
                    ? Text(
                        ScaffoldingUnitsLT[index],
                      )
                    : Text(languageEnglish
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
