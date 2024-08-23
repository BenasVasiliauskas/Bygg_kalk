import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/items/deck_item.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class DeckScreen extends StatefulWidget {
  @override
  State<DeckScreen> createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {
  List<TextEditingController> deckCalculationControllers = [];

  @override
  void initState() {
    super.initState();
    // Initialize controllers for each item in deckData
    deckCalculationControllers = List.generate(
      deckData.length,
      (index) => TextEditingController(
        text: deckData[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of controllers when the widget is destroyed
    for (var controller in deckCalculationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        children: List.generate(deckData.length, (index) {
          var catData = languageEnglish
              ? deckData[index]
              : languageNorwegian
                  ? norwDeckData[index]
                  : languagePolish
                      ? polDeckData[index]
                      : litDeckData[index];
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
                          catData.calculationQuantity = double.parse(value);
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
    );
  }
}
