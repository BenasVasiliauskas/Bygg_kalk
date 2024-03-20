
import 'package:flutter/material.dart';

class OuterWallModel {
  final String name;
  final List<String> description;
  final List<String> unit;
  final List<double> quantity;
  final List<double> materialQuantity;
  final List<double> laborHours1;
  final List<double> laborHours2;
  final List<double> laborCost;
  final List<double> material;
  final List<double> materials;
  final List<double> totalPrice;
  final Color color = Color.fromARGB(255, 174, 228, 75);

  OuterWallModel({
    required this.name,
    required this.description,
    required this.unit,
    required this.quantity,
    required this.materialQuantity,
    required this.laborHours1,
    required this.laborHours2,
    required this.laborCost,
    required this.material,
    required this.materials,
    required this.totalPrice,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> exteriorWallDataJson = [];

    for (int i = 0; i < description.length; i++) {
      Map<String, dynamic> item = {
        'description': description[i],
        'unit': unit[i],
        'quantity': quantity[i],
        'materialQuantity': materialQuantity[i],
        'laborHours1': laborHours1[i],
        'laborHours2': laborHours2[i],
        'laborCost': laborCost[i],
        'material': material[i],
        'materials': materials[i],
        'totalPrice': totalPrice[i],
      };

      exteriorWallDataJson.add(item);
    }

    return {'name': name, 'data': exteriorWallDataJson};
  }
}
