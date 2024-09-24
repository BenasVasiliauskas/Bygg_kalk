import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/items/outer_wall_item.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
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
          title: Text(
            languageEnglish
                ? "Outer wall"
                : languageLithuanian
                    ? "Išorinės sienos"
                    : languageNorwegian
                        ? "Innvendige vegger"
                        : "Ściany wewnętrzne",
          ),
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
                    catData.materialQuantity,
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
      ),
    );
  }
}
