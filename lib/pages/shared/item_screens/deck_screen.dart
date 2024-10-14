import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
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
  //final AppLifecycleObserver _observer = AppLifecycleObserver();

  List<TextEditingController> deckCalculationControllers = [];
  List<dynamic> filteredDeckData = [];

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
    //WidgetsBinding.instance.removeObserver(_observer);
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
          title: const Text('Bygg Kalk'),
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
                    width: 100,
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
                              print(catData.laborHours2[i]);
                            }
                            // Update labor cost
                            for (int i = 0; i < catData.laborCost.length; i++) {
                              catData.laborCost[i] =
                                  catData.laborHours2[i] * hourlyRate;
                              print(catData.laborCost[i]);
                            }
                            // Update material costs
                            for (int i = 0; i < catData.materials.length; i++) {
                              catData.materials[i] = catData.material[i] *
                                  catData.calculationQuantity;
                              print(catData.materials[i]);
                            }
                            // Update total price (labor + materials)
                            for (int i = 0;
                                i < catData.totalPrice.length;
                                i++) {
                              catData.totalPrice[i] =
                                  catData.materials[i] + catData.laborCost[i];
                              print(catData.totalPrice[i]);
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
          childAspectRatio: 7 / 2,
        ),
      ),
    );
  }
}
