import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/items/outer_wall_item.dart';

import 'package:flutter/material.dart';
import '../../constants/language.dart';
import '../../widgets/custom_drawer.dart';

class ExteriorWallScreen extends StatefulWidget {
  @override
  State<ExteriorWallScreen> createState() => _ExteriorWallScreenState();
}

class _ExteriorWallScreenState extends State<ExteriorWallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        languageEnglish: languageEnglish,
        onLanguageChanged: (value) {
          setState(() {
            languageEnglish = value;
          });
        },
      ),
      appBar: AppBar(
        title: const Text('Bygg Kalk'),
      ),
      body: languageEnglish == true
          ? GridView.count(
              padding: const EdgeInsets.all(25),
              children: exteriorWallData
                  .map(
                    (wallItem) => OuterWallItem(
                      wallItem.name,
                      wallItem.description,
                      wallItem.unit,
                      wallItem.quantity,
                      wallItem.materialQuantity,
                      wallItem.laborHours1,
                      wallItem.laborHours2,
                      wallItem.laborCost,
                      wallItem.material,
                      wallItem.materials,
                      wallItem.totalPrice,
                      wallItem.color,
                    ),
                  )
                  .toList(),
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              childAspectRatio: 7 / 2,
            )
          : GridView.count(
              padding: const EdgeInsets.all(25),
              children: norwExteriorWallData
                  .map(
                    (wallItem) => OuterWallItem(
                      wallItem.name,
                      wallItem.description,
                      wallItem.unit,
                      wallItem.quantity,
                      wallItem.materialQuantity,
                      wallItem.laborHours1,
                      wallItem.laborHours2,
                      wallItem.laborCost,
                      wallItem.material,
                      wallItem.materials,
                      wallItem.totalPrice,
                      wallItem.color,
                    ),
                  )
                  .toList(),
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              childAspectRatio: 7 / 2,
            ),
    );
  }
}
