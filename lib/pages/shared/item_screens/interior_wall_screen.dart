import 'package:cost_calculator/constants/pol_budget_constants.dart' as pol;
import 'package:cost_calculator/constants/norw_budget_constants.dart' as norw;
import 'package:cost_calculator/constants/lit_budget_constants.dart' as lit;
import 'package:cost_calculator/constants/budget_constants.dart' as eng;
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/english_data_folder/inner_wall_units_ENG.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/inner_wall_units_LT.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/inner_wall_units.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/data/polish_data_folder/inner_wall_units_pol.dart';
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
          title: Text(widget.constructionType == "New Construction"
              ? languageEnglish
                  ? "Interior walls - New Construction"
                  : languageLithuanian
                      ? "Vidinės sienos - Nauja statyba"
                      : languageNorwegian
                          ? "Innervegger - Nybygg"
                          : "Ściany wewnętrzne - Nowy budynek"
              : widget.constructionType == "Demolition"
                  ? languageEnglish
                      ? "Interior walls - Demolition"
                      : languageLithuanian
                          ? "Vidinės sienos - Griovimas"
                          : languageNorwegian
                              ? "Innervegger - Riving"
                              : "Ściany wewnętrzne - Rozbiórka"
                  : widget.constructionType == "Reconstruction"
                      ? languageEnglish
                          ? "Interior walls - Reconstruction"
                          : languageLithuanian
                              ? "Vidinės sienos - Rekonstrukcija"
                              : languageNorwegian
                                  ? "Innervegger - Ombygging"
                                  : "Ściany wewnętrzne - Rekonstrukcja"
                      : ""),
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
                            norwInnerWallData[index].calculationQuantity =
                                parsedValue;
                            polInnerWallData[index].calculationQuantity =
                                parsedValue;
                            litInnerWallData[index].calculationQuantity =
                                parsedValue;
                            dataInnerWallData[index].calculationQuantity =
                                parsedValue;
                            //Update labor hours 2
                            for (int i = 0;
                                i < catData.laborHours2.length;
                                i++) {
                              catData.laborHours2[i] = catData.laborHours1[i] *
                                  catData.calculationQuantity;
                              //
                              norwInnerWallData[index].laborHours2[i] =
                                  norwInnerWallData[index].laborHours1[i] *
                                      norwInnerWallData[index]
                                          .calculationQuantity;
                              //
                              polInnerWallData[index].laborHours2[i] =
                                  polInnerWallData[index].laborHours1[i] *
                                      polInnerWallData[index]
                                          .calculationQuantity;
                              //
                              litInnerWallData[index].laborHours2[i] =
                                  litInnerWallData[index].laborHours1[i] *
                                      litInnerWallData[index]
                                          .calculationQuantity;
                              //
                              dataInnerWallData[index].laborHours2[i] =
                                  dataInnerWallData[index].laborHours1[i] *
                                      dataInnerWallData[index]
                                          .calculationQuantity;
                              // Update labor cost

                              norwInnerWallData[index].laborCost[i] =
                                  norwInnerWallData[index].laborHours2[i] *
                                      hourlyRate;

                              polInnerWallData[index].laborCost[i] =
                                  polInnerWallData[index].laborHours2[i] *
                                      hourlyRate;

                              litInnerWallData[index].laborCost[i] =
                                  litInnerWallData[index].laborHours2[i] *
                                      hourlyRate;

                              dataInnerWallData[index].laborCost[i] =
                                  dataInnerWallData[index].laborHours2[i] *
                                      hourlyRate;

                              // Update material costs

                              norwInnerWallData[index].material2[i] =
                                  norwInnerWallData[index].material1[i] *
                                      norwInnerWallData[index]
                                          .calculationQuantity;

                              polInnerWallData[index].material2[i] =
                                  polInnerWallData[index].material1[i] *
                                      polInnerWallData[index]
                                          .calculationQuantity;

                              litInnerWallData[index].material2[i] =
                                  litInnerWallData[index].material1[i] *
                                      litInnerWallData[index]
                                          .calculationQuantity;

                              dataInnerWallData[index].material2[i] =
                                  dataInnerWallData[index].material1[i] *
                                      dataInnerWallData[index]
                                          .calculationQuantity;
                              // Update total price (labor + material2)

                              norwInnerWallData[index].totalPrice[i] =
                                  norwInnerWallData[index].material2[i] +
                                      norwInnerWallData[index].laborCost[i];

                              polInnerWallData[index].totalPrice[i] =
                                  polInnerWallData[index].material2[i] +
                                      polInnerWallData[index].laborCost[i];

                              litInnerWallData[index].totalPrice[i] =
                                  litInnerWallData[index].material2[i] +
                                      litInnerWallData[index].laborCost[i];

                              dataInnerWallData[index].totalPrice[i] =
                                  dataInnerWallData[index].material2[i] +
                                      dataInnerWallData[index].laborCost[i];
                            }
                            totalLaborHours = catData.laborHours2.fold(
                                0, (prev, laborHours) => prev + laborHours);

                            totalLaborCost = catData.laborCost
                                .fold(0, (prev, laborCost) => prev + laborCost);

                            totalMaterialCost = catData.material2.fold(
                                0, (prev, materialCost) => prev + materialCost);

                            totalPriceSum = catData.totalPrice.fold(
                                0, (prev, totalPrice) => prev + totalPrice);
                            // Update the total budget
                            eng.addHours(
                                dataInnerWallData[index].name, totalLaborHours);
                            eng.addLaborCosts(
                                dataInnerWallData[index].name, totalLaborCost);
                            eng.addMaterialCosts(dataInnerWallData[index].name,
                                totalMaterialCost);
                            eng.addBudgetSum(
                                dataInnerWallData[index].name, totalPriceSum);

                            norw.addHours(
                                norwInnerWallData[index].name, totalLaborHours);
                            norw.addLaborCosts(
                                norwInnerWallData[index].name, totalLaborCost);
                            norw.addMaterialCosts(norwInnerWallData[index].name,
                                totalMaterialCost);
                            norw.addBudgetSum(
                                norwInnerWallData[index].name, totalPriceSum);

                            pol.addHours(
                                polInnerWallData[index].name, totalLaborHours);
                            pol.addLaborCosts(
                                polInnerWallData[index].name, totalLaborCost);
                            pol.addMaterialCosts(polInnerWallData[index].name,
                                totalMaterialCost);
                            pol.addBudgetSum(
                                polInnerWallData[index].name, totalPriceSum);

                            lit.addHours(
                                litInnerWallData[index].name, totalLaborHours);
                            lit.addLaborCosts(
                                litInnerWallData[index].name, totalLaborCost);
                            lit.addMaterialCosts(litInnerWallData[index].name,
                                totalMaterialCost);
                            lit.addBudgetSum(
                                litInnerWallData[index].name, totalPriceSum);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                languageNorwegian
                    ? Text(
                        widget.constructionType == "New Construction"
                            ? LTInnerWallUnitsNewConstruction[index]
                            : widget.constructionType == "Demolition"
                                ? InnerWallUnitsDemo[index]
                                : InnerWallUnitsRecon[index],
                      )
                    : languageLithuanian
                        ? Text(
                            widget.constructionType == "New Construction"
                                ? LTInnerWallUnitsNewConstruction[index]
                                : widget.constructionType == "Demolition"
                                    ? LTInnerWallUnitsDestro[index]
                                    : InnerWallUnitsRecon[index],
                          )
                        : languageEnglish
                            ? Text(
                                widget.constructionType == "New Construction"
                                    ? LTInnerWallUnitsNewConstruction[index]
                                    : widget.constructionType == "Demolition"
                                        ? ENGInnerWallUnitsDestro[index]
                                        : InnerWallUnitsRecon[index],
                              )
                            : Text(
                                widget.constructionType == "New Construction"
                                    ? LTInnerWallUnitsNewConstruction[index]
                                    : widget.constructionType == "Demolition"
                                        ? POLInnerWallUnitsDestro[index]
                                        : InnerWallUnitsRecon[index],
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
