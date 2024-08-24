import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/lith_data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/items/parquet_laminate_item.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class ParquetLaminateScreen extends StatefulWidget {
  @override
  State<ParquetLaminateScreen> createState() => _ParquetLaminateScreenState();
}

class _ParquetLaminateScreenState extends State<ParquetLaminateScreen> {
  List<TextEditingController> parquetAndLaminateCalculationControllers = [];
  List<dynamic> currentParquetAndLaminateData = [];

  @override
  void initState() {
    super.initState();
    currentParquetAndLaminateData = languageEnglish
        ? parquetAndLaminate
        : languageNorwegian
            ? norwParquetAndLaminate
            : languagePolish
                ? polParquetAndLaminate
                : litParquetAndLaminate;

    // Initialize controllers for each item
    parquetAndLaminateCalculationControllers = List.generate(
      currentParquetAndLaminateData.length,
      (index) => TextEditingController(
        text:
            currentParquetAndLaminateData[index].calculationQuantity.toString(),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of controllers when the widget is destroyed
    for (var controller in parquetAndLaminateCalculationControllers) {
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
          title: const Text('Bygg Kalk'),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(25),
          children:
              List.generate(currentParquetAndLaminateData.length, (index) {
            var catData = currentParquetAndLaminateData[index];
            var controller = parquetAndLaminateCalculationControllers[index];
            return Row(
              children: [
                Expanded(
                  child: ParquetLaminateItem(
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
      ),
    );
  }
}
