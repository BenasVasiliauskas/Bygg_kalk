import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/item_screens/waste_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class WasteSections extends StatefulWidget {
  const WasteSections({super.key});

  @override
  State<WasteSections> createState() => _WasteSectionsState();
}

class _WasteSectionsState extends State<WasteSections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          languageEnglish
              ? "Waste management"
              : languageLithuanian
                  ? "Atliekų išvežimas"
                  : languageNorwegian
                      ? "Avfall flytting"
                      : "Usuwanie odpadów",
        ),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return WasteScreen();
                  },
                ),
              );
            },
            child: Text(
              languageEnglish
                  ? "Waste management"
                  : languageLithuanian
                      ? "Atliekų išvežimas"
                      : languageNorwegian
                          ? "Avfall flytting"
                          : "Usuwanie odpadów",
            ),
          ),
        ],
      ),
    );
  }
}
