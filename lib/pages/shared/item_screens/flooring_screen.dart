import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/items/flooring_item.dart';
import 'package:flutter/material.dart';
import '../../../constants/language.dart';
import '../../../widgets/custom_drawer.dart';

class FlooringScreen extends StatefulWidget {
  @override
  State<FlooringScreen> createState() => _FlooringSectionsState();
}

class _FlooringSectionsState extends State<FlooringScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Bygg Kalk'),
      ),
      body: languageEnglish == true
          ? GridView.count(
              padding: const EdgeInsets.all(25),
              children: flooringData
                  .map(
                    (catData) => FlooringItem(
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
                  )
                  .toList(),
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              childAspectRatio: 7 / 2,
            )
          : GridView.count(
              padding: const EdgeInsets.all(25),
              children: norwFlooringData
                  .map(
                    (catData) => FlooringItem(
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
                  )
                  .toList(),
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              childAspectRatio: 7 / 2,
            ),
    );
  }
}
