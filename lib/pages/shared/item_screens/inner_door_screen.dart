import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/items/inner_door_item.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
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
          title: const Text('Bygg Kalk'),
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
