import 'package:flutter/material.dart';

class OuterWallModel {
  String name;
  List<String> description;
  List<String> unit;
  List<double> quantity;
  List<double> materialQuantity;
  List<double> laborHours1;
  List<double> laborHours2;
  List<double> laborCost;
  List<double> material;
  List<double> materials;
  List<double> totalPrice;
  final Color color;

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
    this.color = const Color.fromARGB(255, 168, 192, 32),
  });
}
