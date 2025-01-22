import 'package:cost_calculator/constants/pol_budget_constants.dart' as pol;
import 'package:cost_calculator/constants/norw_budget_constants.dart' as norw;
import 'package:cost_calculator/constants/lit_budget_constants.dart' as lit;
import 'package:cost_calculator/constants/budget_constants.dart' as eng;
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/data/polish_data_folder/polish_data.dart';
import 'package:cost_calculator/items/inner_door_item.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class InnerDoorScreen extends StatefulWidget {
  final String constructionType;

  const InnerDoorScreen({Key? key, required this.constructionType})
      : super(key: key);

  State<InnerDoorScreen> createState() => _InnerDoorScreenState();
}

class _InnerDoorScreenState extends State<InnerDoorScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();
  List<TextEditingController> innerDoorCalculationControllers = [];
  List<dynamic> filteredInnerDoorData = [];
//Variables to hold the total sum of each field
  double totalLaborHours = 0.0;
  double totalLaborCost = 0.0;
  double totalMaterialCost = 0.0;
  double totalPriceSum = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
    List<dynamic> currentInnerDoorData = languageEnglish
        ? innerDoor
        : languageNorwegian
            ? norwInnerDoor
            : languagePolish
                ? polInnerDoor
                : litInnerDoor;

    filteredInnerDoorData = currentInnerDoorData
        .where((e) => e.constructionType == widget.constructionType)
        .toList();

    // Initialize controllers for each item
    innerDoorCalculationControllers = List.generate(
      filteredInnerDoorData.length,
      (index) => TextEditingController(
        text: filteredInnerDoorData[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    // Dispose of controllers when the widget is destroyed
    for (var controller in innerDoorCalculationControllers) {
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
                  ? "New Construction"
                  : languageLithuanian
                      ? "Nauja statyba"
                      : languageNorwegian
                          ? "Nye konstruksjons"
                          : "Nowa konstrukcja"
              : widget.constructionType == "Demolition"
                  ? languageEnglish
                      ? "Demolition"
                      : languageLithuanian
                          ? "Demontavimas"
                          : languageNorwegian
                              ? "Riving"
                              : "Demolizione"
                  : widget.constructionType == "Reconstruction"
                      ? languageEnglish
                          ? "Reconstruction"
                          : languageLithuanian
                              ? "Rekonstrukcija"
                              : languageNorwegian
                                  ? "Rekonstruksjon"
                                  : "Rekonstrukcja"
                      : ""),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          children: List.generate(
            filteredInnerDoorData.length,
            (index) {
              var catData = filteredInnerDoorData[index];
              var controller = innerDoorCalculationControllers[index];

              return Row(
                children: [
                  Expanded(
                    child: InnerDoorItem(
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
                              norwInnerDoor[index].calculationQuantity =
                                  parsedValue;
                              polInnerDoor[index].calculationQuantity =
                                  parsedValue;
                              litInnerDoor[index].calculationQuantity =
                                  parsedValue;
                              innerDoor[index].calculationQuantity =
                                  parsedValue;
                              //Update labor hours 2
                              for (int i = 0;
                                  i < catData.laborHours2.length;
                                  i++) {
                                //
                                norwInnerDoor[index].laborHours2[i] =
                                    norwInnerDoor[index].laborHours1[i] *
                                        norwInnerDoor[index]
                                            .calculationQuantity;
                                //
                                polInnerDoor[index].laborHours2[i] =
                                    polInnerDoor[index].laborHours1[i] *
                                        polInnerDoor[index].calculationQuantity;
                                //
                                litInnerDoor[index].laborHours2[i] =
                                    litInnerDoor[index].laborHours1[i] *
                                        litInnerDoor[index].calculationQuantity;
                                //

                                innerDoor[index].laborHours2[i] =
                                    innerDoor[index].laborHours1[i] *
                                        innerDoor[index].calculationQuantity;
                                // Update labor cost

                                norwInnerDoor[index].laborCost[i] =
                                    norwInnerDoor[index].laborHours2[i] *
                                        hourlyRate;

                                polInnerDoor[index].laborCost[i] =
                                    polInnerDoor[index].laborHours2[i] *
                                        hourlyRate;

                                litInnerDoor[index].laborCost[i] =
                                    litInnerDoor[index].laborHours2[i] *
                                        hourlyRate;

                                innerDoor[index].laborCost[i] =
                                    innerDoor[index].laborHours2[i] *
                                        hourlyRate;

                                // Update material costs

                                norwInnerDoor[index].materials[i] =
                                    norwInnerDoor[index].material[i] *
                                        norwInnerDoor[index]
                                            .calculationQuantity;

                                polInnerDoor[index].materials[i] =
                                    polInnerDoor[index].material[i] *
                                        polInnerDoor[index].calculationQuantity;

                                litInnerDoor[index].materials[i] =
                                    litInnerDoor[index].material[i] *
                                        litInnerDoor[index].calculationQuantity;

                                innerDoor[index].materials[i] =
                                    innerDoor[index].material[i] *
                                        innerDoor[index].calculationQuantity;
                                // Update total price (labor + materials)

                                norwInnerDoor[index].totalPrice[i] =
                                    norwInnerDoor[index].materials[i] +
                                        norwInnerDoor[index].laborCost[i];

                                polInnerDoor[index].totalPrice[i] =
                                    polInnerDoor[index].materials[i] +
                                        polInnerDoor[index].laborCost[i];

                                litInnerDoor[index].totalPrice[i] =
                                    litInnerDoor[index].materials[i] +
                                        litInnerDoor[index].laborCost[i];

                                innerDoor[index].totalPrice[i] =
                                    innerDoor[index].materials[i] +
                                        innerDoor[index].laborCost[i];
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
                                  innerDoor[index].name, totalLaborHours);
                              eng.addLaborCosts(
                                  innerDoor[index].name, totalLaborCost);
                              eng.addMaterialCosts(
                                  innerDoor[index].name, totalMaterialCost);
                              eng.addBudgetSum(
                                  innerDoor[index].name, totalPriceSum);

                              norw.addHours(
                                  norwInnerDoor[index].name, totalLaborHours);
                              norw.addLaborCosts(
                                  norwInnerDoor[index].name, totalLaborCost);
                              norw.addMaterialCosts(
                                  norwInnerDoor[index].name, totalMaterialCost);
                              norw.addBudgetSum(
                                  norwInnerDoor[index].name, totalPriceSum);

                              pol.addHours(
                                  polInnerDoor[index].name, totalLaborHours);
                              pol.addLaborCosts(
                                  polInnerDoor[index].name, totalLaborCost);
                              pol.addMaterialCosts(
                                  polInnerDoor[index].name, totalMaterialCost);
                              pol.addBudgetSum(
                                  polInnerDoor[index].name, totalPriceSum);

                              lit.addHours(
                                  litInnerDoor[index].name, totalLaborHours);
                              lit.addLaborCosts(
                                  litInnerDoor[index].name, totalLaborCost);
                              lit.addMaterialCosts(
                                  litInnerDoor[index].name, totalMaterialCost);
                              lit.addBudgetSum(
                                  litInnerDoor[index].name, totalPriceSum);
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
