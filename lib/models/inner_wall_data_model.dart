import 'package:flutter/material.dart';

class InnerWallModel {
  String name;
  List<String> description;
  List<String> unit;
  List<double> quantity;
  List<double> materialQuantity;
  List<double> laborHours1;
  List<double> laborHours2;
  List<double> laborCost;
  List<double> material1;
  List<double> material2;
  List<double> totalPrice;
  final Color color;

  InnerWallModel({
    required this.name,
    required this.description,
    required this.unit,
    required this.quantity,
    required this.materialQuantity,
    required this.laborHours1,
    required this.laborHours2,
    required this.laborCost,
    required this.material1,
    required this.material2,
    required this.totalPrice,
    this.color = Colors.orange,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'unit': unit,
      'quantity': quantity,
      'materialQuantity': materialQuantity,
      'laborHours1': laborHours1,
      'laborHours2': laborHours2,
      'laborCost': laborCost,
      'material1': material1,
      'material2': material2,
      'totalPrice': totalPrice,
    };
  }
}
