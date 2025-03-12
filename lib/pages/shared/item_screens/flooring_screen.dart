import 'package:cost_calculator/constants/pol_budget_constants.dart' as pol;
import 'package:cost_calculator/constants/norw_budget_constants.dart' as norw;
import 'package:cost_calculator/constants/lit_budget_constants.dart' as lit;
import 'package:cost_calculator/constants/budget_constants.dart' as eng;
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/floor_units_LT.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/data/polish_data_folder/polish_data.dart';
import 'package:cost_calculator/items/flooring_item.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class FlooringScreen extends StatefulWidget {
  final String constructionType;

  const FlooringScreen({Key? key, required this.constructionType})
      : super(key: key);

  State<FlooringScreen> createState() => _FlooringSectionsState();
}

class _FlooringSectionsState extends State<FlooringScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();
  List<TextEditingController> flooringCalculationControllers = [];
  List<dynamic> filteredFlooringData = [];
  //Variables to hold the total sum of each field
  double totalLaborHours = 0.0;
  double totalLaborCost = 0.0;
  double totalMaterialCost = 0.0;
  double totalPriceSum = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();

    List<dynamic> currentFlooringData = languageEnglish
        ? flooringData
        : languageNorwegian
            ? norwFlooringData
            : languagePolish
                ? polFlooringData
                : litFlooringData;

    filteredFlooringData = currentFlooringData
        .where((e) => e.constructionType == widget.constructionType)
        .toList();

    // Initialize controllers for each item
    flooringCalculationControllers = List.generate(
      filteredFlooringData.length,
      (index) => TextEditingController(
        text: filteredFlooringData[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    // Dispose of controllers when the widget is destroyed
    for (var controller in flooringCalculationControllers) {
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
          title: Text(widget.constructionType == "New Construction"
              ? languageEnglish
                  ? "Flooring - New Construction"
                  : languageLithuanian
                      ? "Grindys - Nauja statyba"
                      : languageNorwegian
                          ? "Gulvbelegg - Nybygg"
                          : "Wiercenie otworów. - Nowy budynek"
              : widget.constructionType == "Demolition"
                  ? languageEnglish
                      ? "Flooring - Demolition"
                      : languageLithuanian
                          ? "Grindys - Griovimas"
                          : languageNorwegian
                              ? "Wiercenie otworów. - Riving"
                              : "Gulvbelegg - Rozbiórka"
                  : widget.constructionType == "Reconstruction"
                      ? languageEnglish
                          ? "Flooring - Reconstruction"
                          : languageLithuanian
                              ? "Gulvbelegg - Rekonstrukcija"
                              : languageNorwegian
                                  ? "Wiercenie otworów. - Ombygging"
                                  : "Grindys - Rekonstrukcja"
                      : ""),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          children: List.generate(filteredFlooringData.length, (index) {
            var catData = filteredFlooringData[index];
            var controller = flooringCalculationControllers[index];
            return Row(
              children: [
                Expanded(
                  child: FlooringItem(
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
                            norwFlooringData[index].calculationQuantity =
                                parsedValue;
                            polFlooringData[index].calculationQuantity =
                                parsedValue;
                            litFlooringData[index].calculationQuantity =
                                parsedValue;
                            flooringData[index].calculationQuantity =
                                parsedValue;
                            //Update labor hours 2
                            for (int i = 0;
                                i < catData.laborHours2.length;
                                i++) {
                              //
                              norwFlooringData[index].laborHours2[i] =
                                  norwFlooringData[index].laborHours1[i] *
                                      norwFlooringData[index]
                                          .calculationQuantity;
                              //
                              polFlooringData[index].laborHours2[i] =
                                  polFlooringData[index].laborHours1[i] *
                                      polFlooringData[index]
                                          .calculationQuantity;
                              //
                              litFlooringData[index].laborHours2[i] =
                                  litFlooringData[index].laborHours1[i] *
                                      litFlooringData[index]
                                          .calculationQuantity;
                              //
                              flooringData[index].laborHours2[i] =
                                  flooringData[index].laborHours1[i] *
                                      flooringData[index].calculationQuantity;
                              // Update labor cost

                              norwFlooringData[index].laborCost[i] =
                                  norwFlooringData[index].laborHours2[i] *
                                      hourlyRate;

                              polFlooringData[index].laborCost[i] =
                                  polFlooringData[index].laborHours2[i] *
                                      hourlyRate;

                              litFlooringData[index].laborCost[i] =
                                  litFlooringData[index].laborHours2[i] *
                                      hourlyRate;

                              flooringData[index].laborCost[i] =
                                  flooringData[index].laborHours2[i] *
                                      hourlyRate;

                              // Update material costs

                              norwFlooringData[index].materials[i] =
                                  norwFlooringData[index].material[i] *
                                      norwFlooringData[index]
                                          .calculationQuantity;

                              polFlooringData[index].materials[i] =
                                  polFlooringData[index].material[i] *
                                      polFlooringData[index]
                                          .calculationQuantity;

                              litFlooringData[index].materials[i] =
                                  litFlooringData[index].material[i] *
                                      litFlooringData[index]
                                          .calculationQuantity;

                              flooringData[index].materials[i] =
                                  flooringData[index].material[i] *
                                      flooringData[index].calculationQuantity;
                              // Update total price (labor + materials)

                              norwFlooringData[index].totalPrice[i] =
                                  norwFlooringData[index].materials[i] +
                                      norwFlooringData[index].laborCost[i];

                              polFlooringData[index].totalPrice[i] =
                                  polFlooringData[index].materials[i] +
                                      polFlooringData[index].laborCost[i];

                              litFlooringData[index].totalPrice[i] =
                                  litFlooringData[index].materials[i] +
                                      litFlooringData[index].laborCost[i];

                              flooringData[index].totalPrice[i] =
                                  flooringData[index].materials[i] +
                                      flooringData[index].laborCost[i];
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
                                flooringData[index].name, totalLaborHours);
                            eng.addLaborCosts(
                                flooringData[index].name, totalLaborCost);
                            eng.addMaterialCosts(
                                flooringData[index].name, totalMaterialCost);
                            eng.addBudgetSum(
                                flooringData[index].name, totalPriceSum);

                            norw.addHours(
                                norwFlooringData[index].name, totalLaborHours);
                            norw.addLaborCosts(
                                norwFlooringData[index].name, totalLaborCost);
                            norw.addMaterialCosts(norwFlooringData[index].name,
                                totalMaterialCost);
                            norw.addBudgetSum(
                                norwFlooringData[index].name, totalPriceSum);

                            pol.addHours(
                                polFlooringData[index].name, totalLaborHours);
                            pol.addLaborCosts(
                                polFlooringData[index].name, totalLaborCost);
                            pol.addMaterialCosts(
                                polFlooringData[index].name, totalMaterialCost);
                            pol.addBudgetSum(
                                polFlooringData[index].name, totalPriceSum);

                            lit.addHours(
                                litFlooringData[index].name, totalLaborHours);
                            lit.addLaborCosts(
                                litFlooringData[index].name, totalLaborCost);
                            lit.addMaterialCosts(
                                litFlooringData[index].name, totalMaterialCost);
                            lit.addBudgetSum(
                                litFlooringData[index].name, totalPriceSum);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Text(
                  widget.constructionType == "New Construction"
                      ? LTFloorUnitsNewC[index]
                      : widget.constructionType == "Demolition"
                          ? "m²"
                          : "m²",
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
