import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/items/support_system_item.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SupportSystemScreen extends StatefulWidget {
  @override
  State<SupportSystemScreen> createState() => _SupportSystemScreenState();
}

class _SupportSystemScreenState extends State<SupportSystemScreen> {
  List<TextEditingController> supportSystemControllers = [];
  List<TextEditingController> norwSupportSystemControllers = [];

  @override
  void initState() {
    super.initState();

    // Initialize controllers based on the length of the support system lists
    supportSystemControllers = List.generate(
      supportSystem.length,
      (index) => TextEditingController(
        text: supportSystem[index].calculationQuantity?.isNotEmpty == true
            ? supportSystem[index].calculationQuantity!.first.toString()
            : '0.0',
      ),
    );

    norwSupportSystemControllers = List.generate(
      norwSupportSystem.length,
      (index) => TextEditingController(
        text: norwSupportSystem[index].calculationQuantity?.isNotEmpty == true
            ? norwSupportSystem[index].calculationQuantity!.first.toString()
            : '0.0',
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of controllers when the widget is disposed
    for (var controller in supportSystemControllers) {
      controller.dispose();
    }
    for (var controller in norwSupportSystemControllers) {
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
        children: languageEnglish
            ? supportSystem.asMap().entries.map(
                (entry) {
                  final index = entry.key;
                  final catData = entry.value;

                  return Row(
                    children: [
                      Expanded(
                        child: SupportSystemItem(
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
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: 100,
                          height: double.infinity,
                          child: Center(
                            child: TextField(
                              controller: supportSystemControllers[index],
                              onChanged: (value) {
                                setState(() {
                                  supportSystemControllers[index].text = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Text("Units")
                    ],
                  );
                },
              ).toList()
            : norwSupportSystem.asMap().entries.map((entry) {
                final index = entry.key;
                final catData = entry.value;

                return Row(
                  children: [
                    Expanded(
                      child: SupportSystemItem(
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        width: 100,
                        height: double.infinity,
                        child: Center(
                          child: TextField(
                            controller: norwSupportSystemControllers[index],
                            onChanged: (value) {
                              setState(() {
                                norwSupportSystemControllers[index].text =
                                    value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Text("stk")
                  ],
                );
              }).toList(),
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        childAspectRatio: 7 / 2,
      ),
    );
  }
}
