import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../items/inner_wall_item.dart';
import 'package:flutter/material.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class InnerWallScreen extends StatefulWidget {
  @override
  State<InnerWallScreen> createState() => _InnerWallScreenState();
}

class _InnerWallScreenState extends State<InnerWallScreen> {
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
          children: languageEnglish == true
              ? dataInnerWallData
                  .map(
                    (catData) => InnerWallItem(
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
                    ),
                  )
                  .toList()
              : norwInnerWallData
                  .map(
                    (catData) => InnerWallItem(
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
                    ),
                  )
                  .toList(),
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          childAspectRatio: 7 / 2,
        ));
  }
}
