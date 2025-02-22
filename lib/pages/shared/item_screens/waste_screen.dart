import 'package:cost_calculator/constants/pol_budget_constants.dart' as pol;
import 'package:cost_calculator/constants/norw_budget_constants.dart' as norw;
import 'package:cost_calculator/constants/lit_budget_constants.dart' as lit;
import 'package:cost_calculator/constants/budget_constants.dart' as eng;
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/data/polish_data_folder/polish_data.dart';
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
              ? "Waste - New Construction"
              : languageLithuanian
                  ? "Atliekų išvežimas - Nauja statyba"
                  : languageNorwegian
                      ? "Avfall - Nybygg"
                      : "Gospodarka odpadami - Nowy budynek"),
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
                    width: 35,
                    height: double.infinity,
                    child: Center(
                      child: TextField(
                        controller: controller,
                        onChanged: (value) {
                          setState(() {
                            double parsedValue = double.tryParse(value) ?? 0.0;
                            norwWasteData[index].calculationQuantity =
                                parsedValue;
                            polWasteData[index].calculationQuantity =
                                parsedValue;
                            litWasteData[index].calculationQuantity =
                                parsedValue;
                            wasteData[index].calculationQuantity = parsedValue;
                            //Update labor hours 2
                            for (int i = 0;
                                i < catData.laborHours2.length;
                                i++) {
                              //
                              norwWasteData[index].laborHours2[i] =
                                  norwWasteData[index].laborHours1[i] *
                                      norwWasteData[index].calculationQuantity;
                              //
                              polWasteData[index].laborHours2[i] =
                                  polWasteData[index].laborHours1[i] *
                                      polWasteData[index].calculationQuantity;
                              //
                              litWasteData[index].laborHours2[i] =
                                  litWasteData[index].laborHours1[i] *
                                      litWasteData[index].calculationQuantity;
                              //
                              wasteData[index].laborHours2[i] =
                                  wasteData[index].laborHours1[i] *
                                      wasteData[index].calculationQuantity;
                              // Update labor cost

                              norwWasteData[index].laborCost[i] =
                                  norwWasteData[index].laborHours2[i] *
                                      hourlyRate;

                              polWasteData[index].laborCost[i] =
                                  polWasteData[index].laborHours2[i] *
                                      hourlyRate;

                              litWasteData[index].laborCost[i] =
                                  litWasteData[index].laborHours2[i] *
                                      hourlyRate;

                              wasteData[index].laborCost[i] =
                                  wasteData[index].laborHours2[i] * hourlyRate;

                              // Update material costs

                              norwWasteData[index].materials[i] =
                                  norwWasteData[index].material[i] *
                                      norwWasteData[index].calculationQuantity;

                              polWasteData[index].materials[i] =
                                  polWasteData[index].material[i] *
                                      polWasteData[index].calculationQuantity;

                              litWasteData[index].materials[i] =
                                  litWasteData[index].material[i] *
                                      litWasteData[index].calculationQuantity;

                              wasteData[index].materials[i] =
                                  wasteData[index].material[i] *
                                      wasteData[index].calculationQuantity;
                              // Update total price (labor + materials)

                              norwWasteData[index].totalPrice[i] =
                                  norwWasteData[index].materials[i] +
                                      norwWasteData[index].laborCost[i];

                              polWasteData[index].totalPrice[i] =
                                  polWasteData[index].materials[i] +
                                      polWasteData[index].laborCost[i];

                              litWasteData[index].totalPrice[i] =
                                  litWasteData[index].materials[i] +
                                      litWasteData[index].laborCost[i];

                              wasteData[index].totalPrice[i] =
                                  wasteData[index].materials[i] +
                                      wasteData[index].laborCost[i];
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
                                wasteData[index].name, totalLaborHours);
                            eng.addLaborCosts(
                                wasteData[index].name, totalLaborCost);
                            eng.addMaterialCosts(
                                wasteData[index].name, totalMaterialCost);
                            eng.addBudgetSum(
                                wasteData[index].name, totalPriceSum);

                            norw.addHours(
                                norwWasteData[index].name, totalLaborHours);
                            norw.addLaborCosts(
                                norwWasteData[index].name, totalLaborCost);
                            norw.addMaterialCosts(
                                norwWasteData[index].name, totalMaterialCost);
                            norw.addBudgetSum(
                                norwWasteData[index].name, totalPriceSum);

                            pol.addHours(
                                polWasteData[index].name, totalLaborHours);
                            pol.addLaborCosts(
                                polWasteData[index].name, totalLaborCost);
                            pol.addMaterialCosts(
                                polWasteData[index].name, totalMaterialCost);
                            pol.addBudgetSum(
                                polWasteData[index].name, totalPriceSum);

                            lit.addHours(
                                litWasteData[index].name, totalLaborHours);
                            lit.addLaborCosts(
                                litWasteData[index].name, totalLaborCost);
                            lit.addMaterialCosts(
                                litWasteData[index].name, totalMaterialCost);
                            lit.addBudgetSum(
                                litWasteData[index].name, totalPriceSum);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Text(languageEnglish
                    ? "pcs"
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
