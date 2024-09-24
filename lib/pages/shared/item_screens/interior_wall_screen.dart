import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
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
  List<dynamic> filteredDeckData =
      []; // Assuming dataInnerWallData type is dynamic

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

    filteredDeckData = currentDataInnerWallData
        .where((e) => e.constructionType == widget.constructionType)
        .toList();

    // Initialize controllers for each item in the selected data list
    innerWallCalculationQuantityController = List.generate(
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
    for (var controller in innerWallCalculationQuantityController) {
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
          children: List.generate(filteredDeckData.length, (index) {
            var catData = filteredDeckData[index];
            var controller = innerWallCalculationQuantityController[index];
            return Row(
              children: [
                Expanded(
                  child: InnerWallItem(
                    catData.name,
                    catData.description,
                    catData.unit,
                    catData.quantity,
                    catData.materialQuantity,
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
      ),
    );
  }
}
