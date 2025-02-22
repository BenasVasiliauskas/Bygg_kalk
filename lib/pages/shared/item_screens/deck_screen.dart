import 'package:cost_calculator/constants/pol_budget_constants.dart' as pol;
import 'package:cost_calculator/constants/norw_budget_constants.dart' as norw;
import 'package:cost_calculator/constants/lit_budget_constants.dart' as lit;
import 'package:cost_calculator/constants/budget_constants.dart' as eng;
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/deck_units.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/data/polish_data_folder/polish_data.dart';
import 'package:cost_calculator/items/deck_item.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class DeckScreen extends StatefulWidget {
  final String constructionType;

  const DeckScreen({Key? key, required this.constructionType})
      : super(key: key);

  State<DeckScreen> createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();

  List<TextEditingController> deckCalculationControllers = [];
  List<dynamic> filteredDeckData = [];

  //Variables to hold the total sum of each field
  double totalLaborHours = 0.0;
  double totalLaborCost = 0.0;
  double totalMaterialCost = 0.0;
  double totalPriceSum = 0.0;

  @override
  void initState() {
    //WidgetsBinding.instance.addObserver(_observer);
    super.initState();
    List<dynamic> currentDeckData = languageEnglish
        ? deckData
        : languageNorwegian
            ? norwDeckData
            : languagePolish
                ? polDeckData
                : litDeckData;

    // Filter data based on the selected construction type
    filteredDeckData = currentDeckData
        .where((deck) => deck.constructionType == widget.constructionType)
        .toList();

    // Initialize controllers for each item
    deckCalculationControllers = List.generate(
      filteredDeckData.length,
      (index) => TextEditingController(
        text: filteredDeckData[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    // Dispose of controllers when the widget is destroyed
    for (var controller in deckCalculationControllers) {
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
                  ? "Floor structure - New Construction"
                  : languageLithuanian
                      ? "Perdangos - Nauja statyba"
                      : languageNorwegian
                          ? "Dekker - Nybygg"
                          : "Opona - Nowy budynek"
              : widget.constructionType == "Demolition"
                  ? languageEnglish
                      ? "Floor structure - Demolition"
                      : languageLithuanian
                          ? "Perdangos - Griovimas"
                          : languageNorwegian
                              ? "Dekker - Riving"
                              : "Opona - Rozbiórka"
                  : widget.constructionType == "Reconstruction"
                      ? languageEnglish
                          ? "Floor structure - Reconstruction"
                          : languageLithuanian
                              ? "Perdangos - Rekonstrukcija"
                              : languageNorwegian
                                  ? "Dekker - Ombygging"
                                  : "Opona - Rekonstrukcja"
                      : ""),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          children: List.generate(filteredDeckData.length, (index) {
            var catData = filteredDeckData[index];
            var controller = deckCalculationControllers[index];

            return Row(
              children: [
                Expanded(
                  child: DeckItem(
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
                            norwDeckData[index].calculationQuantity =
                                parsedValue;
                            polDeckData[index].calculationQuantity =
                                parsedValue;
                            litDeckData[index].calculationQuantity =
                                parsedValue;
                            deckData[index].calculationQuantity = parsedValue;
                            //Update labor hours 2
                            for (int i = 0;
                                i < catData.laborHours2.length;
                                i++) {
                              //
                              norwDeckData[index].laborHours2[i] =
                                  norwDeckData[index].laborHours1[i] *
                                      norwDeckData[index].calculationQuantity;
                              //
                              polDeckData[index].laborHours2[i] =
                                  polDeckData[index].laborHours1[i] *
                                      polDeckData[index].calculationQuantity;
                              //
                              litDeckData[index].laborHours2[i] =
                                  litDeckData[index].laborHours1[i] *
                                      litDeckData[index].calculationQuantity;
                              //
                              deckData[index].laborHours2[i] =
                                  deckData[index].laborHours1[i] *
                                      deckData[index].calculationQuantity;
                              // Update labor cost

                              norwDeckData[index].laborCost[i] =
                                  norwDeckData[index].laborHours2[i] *
                                      hourlyRate;

                              polDeckData[index].laborCost[i] =
                                  polDeckData[index].laborHours2[i] *
                                      hourlyRate;

                              litDeckData[index].laborCost[i] =
                                  litDeckData[index].laborHours2[i] *
                                      hourlyRate;

                              deckData[index].laborCost[i] =
                                  deckData[index].laborHours2[i] * hourlyRate;

                              // Update material costs

                              norwDeckData[index].materials[i] =
                                  norwDeckData[index].material[i] *
                                      norwDeckData[index].calculationQuantity;

                              polDeckData[index].materials[i] =
                                  polDeckData[index].material[i] *
                                      polDeckData[index].calculationQuantity;

                              litDeckData[index].materials[i] =
                                  litDeckData[index].material[i] *
                                      litDeckData[index].calculationQuantity;

                              deckData[index].materials[i] =
                                  deckData[index].material[i] *
                                      deckData[index].calculationQuantity;
                              // Update total price (labor + materials)

                              norwDeckData[index].totalPrice[i] =
                                  norwDeckData[index].materials[i] +
                                      norwDeckData[index].laborCost[i];

                              polDeckData[index].totalPrice[i] =
                                  polDeckData[index].materials[i] +
                                      polDeckData[index].laborCost[i];

                              litDeckData[index].totalPrice[i] =
                                  litDeckData[index].materials[i] +
                                      litDeckData[index].laborCost[i];

                              deckData[index].totalPrice[i] =
                                  deckData[index].materials[i] +
                                      deckData[index].laborCost[i];
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
                            eng.addHours(deckData[index].name, totalLaborHours);
                            eng.addLaborCosts(
                                deckData[index].name, totalLaborCost);
                            eng.addMaterialCosts(
                                deckData[index].name, totalMaterialCost);
                            eng.addBudgetSum(
                                deckData[index].name, totalPriceSum);

                            norw.addHours(
                                norwDeckData[index].name, totalLaborHours);
                            norw.addLaborCosts(
                                norwDeckData[index].name, totalLaborCost);
                            norw.addMaterialCosts(
                                norwDeckData[index].name, totalMaterialCost);
                            norw.addBudgetSum(
                                norwDeckData[index].name, totalPriceSum);

                            pol.addHours(
                                polDeckData[index].name, totalLaborHours);
                            pol.addLaborCosts(
                                polDeckData[index].name, totalLaborCost);
                            pol.addMaterialCosts(
                                polDeckData[index].name, totalMaterialCost);
                            pol.addBudgetSum(
                                polDeckData[index].name, totalPriceSum);

                            lit.addHours(
                                litDeckData[index].name, totalLaborHours);
                            lit.addLaborCosts(
                                litDeckData[index].name, totalLaborCost);
                            lit.addMaterialCosts(
                                litDeckData[index].name, totalMaterialCost);
                            lit.addBudgetSum(
                                litDeckData[index].name, totalPriceSum);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Text(
                  widget.constructionType == "New Construction"
                      ? deckUnitsNewC[index]
                      : widget.constructionType == "Demolition"
                          ? deckUnitsNewC[index]
                          : deckUnitsNewC[index],
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
