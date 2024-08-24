import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/items/inner_door_item.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class InnerDoorScreen extends StatefulWidget {
  @override
  State<InnerDoorScreen> createState() => _InnerDoorScreenState();
}

class _InnerDoorScreenState extends State<InnerDoorScreen> {
  List<TextEditingController> innerDoorCalculationControllers = [];
  List<dynamic> currentInnerDoorData = [];

  @override
  void initState() {
    super.initState();
    currentInnerDoorData = languageEnglish
        ? innerDoor
        : languageNorwegian
            ? norwInnerDoor
            : languagePolish
                ? polInnerDoor
                : litInnerDoor;

    // Initialize controllers for each item
    innerDoorCalculationControllers = List.generate(
      currentInnerDoorData.length,
      (index) => TextEditingController(
        text: currentInnerDoorData[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
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
      onPopInvoked: (bool didPop) async {
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
          children: List.generate(
            innerDoor.length,
            (index) {
              var catData = currentInnerDoorData[index];
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
          childAspectRatio: 7 / 2,
        ),
      ),
    );
  }
}
