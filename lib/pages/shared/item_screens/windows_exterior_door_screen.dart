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

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../items/windows_exterior_doors_item.dart';
import '../../../widgets/custom_drawer.dart';

class WindowsExteriorDoorScreen extends StatefulWidget {
  final String constructionType;

  const WindowsExteriorDoorScreen({Key? key, required this.constructionType})
      : super(key: key);

  State<WindowsExteriorDoorScreen> createState() =>
      _WindowsExteriorDoorScreenState();
}

class _WindowsExteriorDoorScreenState extends State<WindowsExteriorDoorScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();

  List<TextEditingController> windowsExteriorDoorsCalculationControllers = [];
  List<dynamic> filteredWindowsExteriorDoors = [];
  //Variables to hold the total sum of each field
  double totalLaborHours = 0.0;
  double totalLaborCost = 0.0;
  double totalMaterialCost = 0.0;
  double totalPriceSum = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
    filteredWindowsExteriorDoors = languageEnglish
        ? windowsExteriorDoors
        : languageNorwegian
            ? norwWindowsExteriorDoors
            : languagePolish
                ? polWindowsExteriorDoors
                : litWindowsExteriorDoors;

    filteredWindowsExteriorDoors = filteredWindowsExteriorDoors
        .where((e) => e.constructionType == widget.constructionType)
        .toList();

    // Initialize controllers for each item
    windowsExteriorDoorsCalculationControllers = List.generate(
      filteredWindowsExteriorDoors.length,
      (index) => TextEditingController(
        text:
            filteredWindowsExteriorDoors[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    // Dispose of controllers when the widget is destroyed
    for (var controller in windowsExteriorDoorsCalculationControllers) {
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
                  ? "Windows, doors - New Construction"
                  : languageLithuanian
                      ? "Langai ir lauko durys - Nauja statyba"
                      : languageNorwegian
                          ? "Vinduer og ytterdører - Nybygg"
                          : "Okna i drzwi zewnętrzne - Nowy budynek"
              : widget.constructionType == "Demolition"
                  ? languageEnglish
                      ? "Windows, doors - Demolition"
                      : languageLithuanian
                          ? "Langai ir lauko durys - Griovimas"
                          : languageNorwegian
                              ? "Vinduer og ytterdører - Riving"
                              : "Okna i drzwi zewnętrzne - Rozbiórka"
                  : widget.constructionType == "Reconstruction"
                      ? languageEnglish
                          ? "Windows, doors - Reconstruction"
                          : languageLithuanian
                              ? "Langai ir lauko durys - Rekonstrukcija"
                              : languageNorwegian
                                  ? "Vinduer og ytterdører - Ombygging"
                                  : "Okna i drzwi zewnętrzne - Rekonstrukcja"
                      : ""),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          children: List.generate(filteredWindowsExteriorDoors.length, (index) {
            var catData = filteredWindowsExteriorDoors[index];
            var controller = windowsExteriorDoorsCalculationControllers[index];

            return Row(
              children: [
                Expanded(
                  child: WindowExteriorDoorItem(
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

                            norwWindowsExteriorDoors[index]
                                .calculationQuantity = parsedValue;
                            polWindowsExteriorDoors[index].calculationQuantity =
                                parsedValue;
                            litWindowsExteriorDoors[index].calculationQuantity =
                                parsedValue;
                            windowsExteriorDoors[index].calculationQuantity =
                                parsedValue;

                            //Update labor hours 2
                            for (int i = 0;
                                i < catData.laborHours2.length;
                                i++) {
                              //
                              norwWindowsExteriorDoors[index].laborHours2[i] =
                                  norwWindowsExteriorDoors[index]
                                          .laborHours1[i] *
                                      norwWindowsExteriorDoors[index]
                                          .calculationQuantity;
                              //
                              polWindowsExteriorDoors[index].laborHours2[i] =
                                  polWindowsExteriorDoors[index]
                                          .laborHours1[i] *
                                      polWindowsExteriorDoors[index]
                                          .calculationQuantity;
                              //
                              litWindowsExteriorDoors[index].laborHours2[i] =
                                  litWindowsExteriorDoors[index]
                                          .laborHours1[i] *
                                      litWindowsExteriorDoors[index]
                                          .calculationQuantity;
                              //
                              windowsExteriorDoors[index].laborHours2[i] =
                                  windowsExteriorDoors[index].laborHours1[i] *
                                      windowsExteriorDoors[index]
                                          .calculationQuantity;
                              // Update labor cost

                              norwWindowsExteriorDoors[index].laborCost[i] =
                                  norwWindowsExteriorDoors[index]
                                          .laborHours2[i] *
                                      hourlyRate;

                              polWindowsExteriorDoors[index].laborCost[i] =
                                  polWindowsExteriorDoors[index]
                                          .laborHours2[i] *
                                      hourlyRate;

                              litWindowsExteriorDoors[index].laborCost[i] =
                                  litWindowsExteriorDoors[index]
                                          .laborHours2[i] *
                                      hourlyRate;

                              windowsExteriorDoors[index].laborCost[i] =
                                  windowsExteriorDoors[index].laborHours2[i] *
                                      hourlyRate;

                              // Update material costs

                              norwWindowsExteriorDoors[index].materials[i] =
                                  norwWindowsExteriorDoors[index].material[i] *
                                      norwWindowsExteriorDoors[index]
                                          .calculationQuantity;

                              polWindowsExteriorDoors[index].materials[i] =
                                  polWindowsExteriorDoors[index].material[i] *
                                      polWindowsExteriorDoors[index]
                                          .calculationQuantity;

                              litWindowsExteriorDoors[index].materials[i] =
                                  litWindowsExteriorDoors[index].material[i] *
                                      litWindowsExteriorDoors[index]
                                          .calculationQuantity;

                              windowsExteriorDoors[index].materials[i] =
                                  windowsExteriorDoors[index].material[i] *
                                      windowsExteriorDoors[index]
                                          .calculationQuantity;
                              // Update total price (labor + materials)

                              norwWindowsExteriorDoors[index].totalPrice[i] =
                                  norwWindowsExteriorDoors[index].materials[i] +
                                      norwWindowsExteriorDoors[index]
                                          .laborCost[i];

                              polWindowsExteriorDoors[index].totalPrice[i] =
                                  polWindowsExteriorDoors[index].materials[i] +
                                      polWindowsExteriorDoors[index]
                                          .laborCost[i];

                              litWindowsExteriorDoors[index].totalPrice[i] =
                                  litWindowsExteriorDoors[index].materials[i] +
                                      litWindowsExteriorDoors[index]
                                          .laborCost[i];

                              windowsExteriorDoors[index].totalPrice[i] =
                                  windowsExteriorDoors[index].materials[i] +
                                      windowsExteriorDoors[index].laborCost[i];
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
                            eng.addHours(windowsExteriorDoors[index].name,
                                totalLaborHours);
                            eng.addLaborCosts(windowsExteriorDoors[index].name,
                                totalLaborCost);
                            eng.addMaterialCosts(
                                windowsExteriorDoors[index].name,
                                totalMaterialCost);
                            eng.addBudgetSum(windowsExteriorDoors[index].name,
                                totalPriceSum);

                            norw.addHours(norwWindowsExteriorDoors[index].name,
                                totalLaborHours);
                            norw.addLaborCosts(
                                norwWindowsExteriorDoors[index].name,
                                totalLaborCost);
                            norw.addMaterialCosts(
                                norwWindowsExteriorDoors[index].name,
                                totalMaterialCost);
                            norw.addBudgetSum(
                                norwWindowsExteriorDoors[index].name,
                                totalPriceSum);

                            pol.addHours(polWindowsExteriorDoors[index].name,
                                totalLaborHours);
                            pol.addLaborCosts(
                                polWindowsExteriorDoors[index].name,
                                totalLaborCost);
                            pol.addMaterialCosts(
                                polWindowsExteriorDoors[index].name,
                                totalMaterialCost);
                            pol.addBudgetSum(
                                polWindowsExteriorDoors[index].name,
                                totalPriceSum);

                            lit.addHours(litWindowsExteriorDoors[index].name,
                                totalLaborHours);
                            lit.addLaborCosts(
                                litWindowsExteriorDoors[index].name,
                                totalLaborCost);
                            lit.addMaterialCosts(
                                litWindowsExteriorDoors[index].name,
                                totalMaterialCost);
                            lit.addBudgetSum(
                                litWindowsExteriorDoors[index].name,
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
          }),
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          childAspectRatio: 2,
        ),
      ),
    );
  }
}
