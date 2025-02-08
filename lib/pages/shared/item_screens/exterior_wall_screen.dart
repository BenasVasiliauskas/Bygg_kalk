import 'package:cost_calculator/constants/pol_budget_constants.dart' as pol;
import 'package:cost_calculator/constants/norw_budget_constants.dart' as norw;
import 'package:cost_calculator/constants/lit_budget_constants.dart' as lit;
import 'package:cost_calculator/constants/budget_constants.dart' as eng;
import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/outer_wall_units_LT.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/outer_wall_units.dart';
import 'package:cost_calculator/data/polish_data_folder/polish_data.dart';
import 'package:cost_calculator/items/outer_wall_item.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExteriorWallScreen extends StatefulWidget {
  final String constructionType;

  const ExteriorWallScreen({Key? key, required this.constructionType})
      : super(key: key);

  State<ExteriorWallScreen> createState() => _ExteriorWallScreenState();
}

class _ExteriorWallScreenState extends State<ExteriorWallScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();
  List<TextEditingController> outerWallCalculationControllers = [];
  List<dynamic> filteredExteriorWallData = [];
  //Variables to hold the total sum of each field
  double totalLaborHours = 0.0;
  double totalLaborCost = 0.0;
  double totalMaterialCost = 0.0;
  double totalPriceSum = 0.0;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);

    super.initState();

    List<dynamic> currentExteriorWallData = languageEnglish
        ? exteriorWallData
        : languageNorwegian
            ? norwExteriorWallData
            : languagePolish
                ? polExteriorWallData
                : litExteriorWallData;

    filteredExteriorWallData = currentExteriorWallData
        .where((e) => e.constructionType == widget.constructionType)
        .toList();

    // Initialize controllers for each item
    outerWallCalculationControllers = List.generate(
      filteredExteriorWallData.length,
      (index) => TextEditingController(
        text: filteredExteriorWallData[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    // Dispose of controllers when the widget is destroyed
    for (var controller in outerWallCalculationControllers) {
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
                  ? "Outer wall - New Construction"
                  : languageLithuanian
                      ? "Išorinės sienos - Nauja statyba"
                      : languageNorwegian
                          ? "Yttervegger - Nye konstruksjons"
                          : "Ściany wewnętrzne - Nowa konstrukcja"
              : widget.constructionType == "Demolition"
                  ? languageEnglish
                      ? "Outer wall - Demolition"
                      : languageLithuanian
                          ? "Išorinės sienos - Griovimas"
                          : languageNorwegian
                              ? "Yttervegger - Riving"
                              : "Ściany wewnętrzne - Demolizione"
                  : widget.constructionType == "Reconstruction"
                      ? languageEnglish
                          ? "Outer wall - Reconstruction"
                          : languageLithuanian
                              ? "Išorinės sienos - Rekonstrukcija"
                              : languageNorwegian
                                  ? "Yttervegger - Rekonstruksjon"
                                  : "Ściany wewnętrzne - Rekonstrukcja"
                      : ""),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          children: List.generate(filteredExteriorWallData.length, (index) {
            var catData = filteredExteriorWallData[index];
            var controller = outerWallCalculationControllers[index];
            return Row(
              children: [
                Expanded(
                  child: OuterWallItem(
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
                            norwExteriorWallData[index].calculationQuantity =
                                parsedValue;
                            polExteriorWallData[index].calculationQuantity =
                                parsedValue;
                            litExteriorWallData[index].calculationQuantity =
                                parsedValue;
                            exteriorWallData[index].calculationQuantity =
                                parsedValue;
                            //Update labor hours 2
                            for (int i = 0;
                                i < catData.laborHours2.length;
                                i++) {
                              //
                              norwExteriorWallData[index].laborHours2[i] =
                                  norwExteriorWallData[index].laborHours1[i] *
                                      norwExteriorWallData[index]
                                          .calculationQuantity;
                              //
                              polExteriorWallData[index].laborHours2[i] =
                                  polExteriorWallData[index].laborHours1[i] *
                                      polExteriorWallData[index]
                                          .calculationQuantity;
                              //
                              litExteriorWallData[index].laborHours2[i] =
                                  litExteriorWallData[index].laborHours1[i] *
                                      litExteriorWallData[index]
                                          .calculationQuantity;
                              //
                              exteriorWallData[index].laborHours2[i] =
                                  exteriorWallData[index].laborHours1[i] *
                                      exteriorWallData[index]
                                          .calculationQuantity;
                              // Update labor cost

                              norwExteriorWallData[index].laborCost[i] =
                                  norwExteriorWallData[index].laborHours2[i] *
                                      hourlyRate;

                              polExteriorWallData[index].laborCost[i] =
                                  polExteriorWallData[index].laborHours2[i] *
                                      hourlyRate;

                              litExteriorWallData[index].laborCost[i] =
                                  litExteriorWallData[index].laborHours2[i] *
                                      hourlyRate;

                              exteriorWallData[index].laborCost[i] =
                                  exteriorWallData[index].laborHours2[i] *
                                      hourlyRate;

                              // Update material costs

                              norwExteriorWallData[index].materials[i] =
                                  norwExteriorWallData[index].material[i] *
                                      norwExteriorWallData[index]
                                          .calculationQuantity;

                              polExteriorWallData[index].materials[i] =
                                  polExteriorWallData[index].material[i] *
                                      polExteriorWallData[index]
                                          .calculationQuantity;

                              litExteriorWallData[index].materials[i] =
                                  litExteriorWallData[index].material[i] *
                                      litExteriorWallData[index]
                                          .calculationQuantity;

                              exteriorWallData[index].materials[i] =
                                  exteriorWallData[index].material[i] *
                                      exteriorWallData[index]
                                          .calculationQuantity;
                              // Update total price (labor + materials)

                              norwExteriorWallData[index].totalPrice[i] =
                                  norwExteriorWallData[index].materials[i] +
                                      norwExteriorWallData[index].laborCost[i];

                              polExteriorWallData[index].totalPrice[i] =
                                  polExteriorWallData[index].materials[i] +
                                      polExteriorWallData[index].laborCost[i];

                              litExteriorWallData[index].totalPrice[i] =
                                  litExteriorWallData[index].materials[i] +
                                      litExteriorWallData[index].laborCost[i];

                              exteriorWallData[index].totalPrice[i] =
                                  exteriorWallData[index].materials[i] +
                                      exteriorWallData[index].laborCost[i];
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
                                exteriorWallData[index].name, totalLaborHours);
                            eng.addLaborCosts(
                                exteriorWallData[index].name, totalLaborCost);
                            eng.addMaterialCosts(exteriorWallData[index].name,
                                totalMaterialCost);
                            eng.addBudgetSum(
                                exteriorWallData[index].name, totalPriceSum);

                            norw.addHours(norwExteriorWallData[index].name,
                                totalLaborHours);
                            norw.addLaborCosts(norwExteriorWallData[index].name,
                                totalLaborCost);
                            norw.addMaterialCosts(
                                norwExteriorWallData[index].name,
                                totalMaterialCost);
                            norw.addBudgetSum(norwExteriorWallData[index].name,
                                totalPriceSum);

                            pol.addHours(polExteriorWallData[index].name,
                                totalLaborHours);
                            pol.addLaborCosts(polExteriorWallData[index].name,
                                totalLaborCost);
                            pol.addMaterialCosts(
                                polExteriorWallData[index].name,
                                totalMaterialCost);
                            pol.addBudgetSum(
                                polExteriorWallData[index].name, totalPriceSum);

                            lit.addHours(litExteriorWallData[index].name,
                                totalLaborHours);
                            lit.addLaborCosts(litExteriorWallData[index].name,
                                totalLaborCost);
                            lit.addMaterialCosts(
                                litExteriorWallData[index].name,
                                totalMaterialCost);
                            lit.addBudgetSum(
                                litExteriorWallData[index].name, totalPriceSum);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                languageNorwegian
                    ? Text(
                        widget.constructionType == "New Construction"
                            ? outerWallUnitsNewC[index]
                            : widget.constructionType == "Demolition"
                                ? outerWallUnitsDemo[index]
                                : outerWallUnitsRecon[index],
                      )
                    : Text(
                        widget.constructionType == "New Construction"
                            ? outerWallUnitsNewCLT[index]
                            : widget.constructionType == "Demolition"
                                ? outerWallUnitsDemo[index]
                                : outerWallUnitsRecon[index],
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
