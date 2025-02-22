import 'package:cost_calculator/constants/pol_budget_constants.dart' as pol;
import 'package:cost_calculator/constants/norw_budget_constants.dart' as norw;
import 'package:cost_calculator/constants/lit_budget_constants.dart' as lit;
import 'package:cost_calculator/constants/budget_constants.dart' as eng;
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/english_data_folder/roof_units_ENG.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/roof_units_LT.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/roof_units_norw.dart';
import 'package:cost_calculator/data/polish_data_folder/pol_roof_units_pol.dart';
import 'package:cost_calculator/data/polish_data_folder/polish_data.dart';
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
          title: Text(widget.constructionType == "New Construction"
              ? languageEnglish
                  ? "Roof - New Construction"
                  : languageLithuanian
                      ? "Stogas - Nauja statyba"
                      : languageNorwegian
                          ? "Yttertak - Nybygg"
                          : "Dach zewnętrzny - Nowy budynek"
              : widget.constructionType == "Demolition"
                  ? languageEnglish
                      ? "Roof - Demolition"
                      : languageLithuanian
                          ? "Stogas - Griovimas"
                          : languageNorwegian
                              ? "Yttertak - Riving"
                              : "Dach zewnętrzny - Rozbiórka"
                  : widget.constructionType == "Reconstruction"
                      ? languageEnglish
                          ? "Roof - Reconstruction"
                          : languageLithuanian
                              ? "Stogas - Rekonstrukcija"
                              : languageNorwegian
                                  ? "Yttertak - Ombygging"
                                  : "Dach zewnętrzny - Rekonstrukcja"
                      : ""),
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
                            norwOuterRoofData[index].calculationQuantity =
                                parsedValue;
                            polOuterRoofData[index].calculationQuantity =
                                parsedValue;
                            litOuterRoofData[index].calculationQuantity =
                                parsedValue;
                            outerRoofData[index].calculationQuantity =
                                parsedValue;
                            //Update labor hours 2
                            for (int i = 0;
                                i < catData.laborHours2.length;
                                i++) {
                              //
                              norwOuterRoofData[index].laborHours2[i] =
                                  norwOuterRoofData[index].laborHours1[i] *
                                      norwOuterRoofData[index]
                                          .calculationQuantity;
                              //
                              polOuterRoofData[index].laborHours2[i] =
                                  polOuterRoofData[index].laborHours1[i] *
                                      polOuterRoofData[index]
                                          .calculationQuantity;
                              //
                              litOuterRoofData[index].laborHours2[i] =
                                  litOuterRoofData[index].laborHours1[i] *
                                      litOuterRoofData[index]
                                          .calculationQuantity;
                              //
                              outerRoofData[index].laborHours2[i] =
                                  outerRoofData[index].laborHours1[i] *
                                      outerRoofData[index].calculationQuantity;
                              // Update labor cost

                              norwOuterRoofData[index].laborCost[i] =
                                  norwOuterRoofData[index].laborHours2[i] *
                                      hourlyRate;

                              polOuterRoofData[index].laborCost[i] =
                                  polOuterRoofData[index].laborHours2[i] *
                                      hourlyRate;

                              litOuterRoofData[index].laborCost[i] =
                                  litOuterRoofData[index].laborHours2[i] *
                                      hourlyRate;

                              outerRoofData[index].laborCost[i] =
                                  outerRoofData[index].laborHours2[i] *
                                      hourlyRate;

                              // Update material costs

                              norwOuterRoofData[index].materials[i] =
                                  norwOuterRoofData[index].material[i] *
                                      norwOuterRoofData[index]
                                          .calculationQuantity;

                              polOuterRoofData[index].materials[i] =
                                  polOuterRoofData[index].material[i] *
                                      polOuterRoofData[index]
                                          .calculationQuantity;

                              litOuterRoofData[index].materials[i] =
                                  litOuterRoofData[index].material[i] *
                                      litOuterRoofData[index]
                                          .calculationQuantity;

                              outerRoofData[index].materials[i] =
                                  outerRoofData[index].material[i] *
                                      outerRoofData[index].calculationQuantity;
                              // Update total price (labor + materials)

                              norwOuterRoofData[index].totalPrice[i] =
                                  norwOuterRoofData[index].materials[i] +
                                      norwOuterRoofData[index].laborCost[i];

                              polOuterRoofData[index].totalPrice[i] =
                                  polOuterRoofData[index].materials[i] +
                                      polOuterRoofData[index].laborCost[i];

                              litOuterRoofData[index].totalPrice[i] =
                                  litOuterRoofData[index].materials[i] +
                                      litOuterRoofData[index].laborCost[i];

                              outerRoofData[index].totalPrice[i] =
                                  outerRoofData[index].materials[i] +
                                      outerRoofData[index].laborCost[i];
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
                                outerRoofData[index].name, totalLaborHours);
                            eng.addLaborCosts(
                                outerRoofData[index].name, totalLaborCost);
                            eng.addMaterialCosts(
                                outerRoofData[index].name, totalMaterialCost);
                            eng.addBudgetSum(
                                outerRoofData[index].name, totalPriceSum);

                            norw.addHours(
                                norwOuterRoofData[index].name, totalLaborHours);
                            norw.addLaborCosts(
                                norwOuterRoofData[index].name, totalLaborCost);
                            norw.addMaterialCosts(norwOuterRoofData[index].name,
                                totalMaterialCost);
                            norw.addBudgetSum(
                                norwOuterRoofData[index].name, totalPriceSum);

                            pol.addHours(
                                polOuterRoofData[index].name, totalLaborHours);
                            pol.addLaborCosts(
                                polOuterRoofData[index].name, totalLaborCost);
                            pol.addMaterialCosts(polOuterRoofData[index].name,
                                totalMaterialCost);
                            pol.addBudgetSum(
                                polOuterRoofData[index].name, totalPriceSum);

                            lit.addHours(
                                litOuterRoofData[index].name, totalLaborHours);
                            lit.addLaborCosts(
                                litOuterRoofData[index].name, totalLaborCost);
                            lit.addMaterialCosts(litOuterRoofData[index].name,
                                totalMaterialCost);
                            lit.addBudgetSum(
                                litOuterRoofData[index].name, totalPriceSum);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Text(languageLithuanian
                    ? widget.constructionType == "New Construction"
                        ? LTRoofUnitsNewC[index]
                        : widget.constructionType == "Demolition"
                            ? LTRoofUnitsDestro[index]
                            : LTRoofUnitsReco[index]
                    : languageEnglish
                        ? widget.constructionType == "New Construction"
                            ? ENGRoofUnitsNewC[index]
                            : widget.constructionType == "Demolition"
                                ? ENGRoofUnitsDestro[index]
                                : ENGRoofUnitsReco[index]
                        : languageNorwegian
                            ? widget.constructionType == "New Construction"
                                ? NORWRoofUnitsNewC[index]
                                : widget.constructionType == "Demolition"
                                    ? NORWRoofUnitsDestro[index]
                                    : NORWRoofUnitsReco[index]
                            : languagePolish
                                ? widget.constructionType == "New Construction"
                                    ? POLRoofUnitsNewC[index]
                                    : widget.constructionType == "Demolition"
                                        ? POLRoofUnitsDestro[index]
                                        : POLRoofUnitsReco[index]
                                : ""),
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
