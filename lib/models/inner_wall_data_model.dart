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

  InnerWallModel.fromJson(Map<String, dynamic> json, this.color)
      : name = json['name'] as String,
        description = json['description'] as List<String>,
        unit = json['unit'] as List<String>,
        quantity = json['quantity'] as List<double>,
        materialQuantity = json['materialQuantity'] as List<double>,
        laborHours1 = json['laborHours1'] as List<double>,
        laborHours2 = json['laborHours2'] as List<double>,
        laborCost = json['laborCost'] as List<double>,
        material1 = json['material1'] as List<double>,
        material2 = json['material2'] as List<double>,
        totalPrice = json['totalPrice'] as List<double>;

  Map<String, dynamic> toJson() => {
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
