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
  final String constructionType;
  double calculationQuantity;

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
    Color? color, // Change to nullable Color
    String? constructionType,
    this.calculationQuantity = 0.0,
  })  : constructionType = constructionType ?? "Nan",
        color = color ??
            Colors.orange; // Initialize color with Colors.orange if null

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
      'constructionType': constructionType,
      'calculationQuantity': calculationQuantity,
    };
  }

  InnerWallModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = (json['description'] as List<dynamic>)
            .map((item) => item.toString())
            .toList(),
        unit = (json['unit'] as List<dynamic>)
            .map((item) => item.toString())
            .toList(),
        quantity = json['quantity'] is List
            ? json['quantity'].cast<double>().toList()
            : [],
        materialQuantity = json['materialQuantity'] is List
            ? json['materialQuantity'].cast<double>().toList()
            : [],
        laborHours1 = json['laborHours1'] is List
            ? json['laborHours1'].cast<double>().toList()
            : [],
        laborHours2 = json['laborHours2'] is List
            ? json['laborHours2'].cast<double>().toList()
            : [],
        laborCost = json['laborCost'] is List
            ? json['laborCost'].cast<double>().toList()
            : [],
        material1 = json['material1'] is List
            ? json['material1'].cast<double>().toList()
            : [],
        material2 = json['material2'] is List
            ? json['material2'].cast<double>().toList()
            : [],
        totalPrice = json['totalPrice'] is List
            ? json['totalPrice'].cast<double>().toList()
            : [],
        color = Colors.orange,
        constructionType = json['constructionType'],
        calculationQuantity = json['calculationQuantity'];
}
