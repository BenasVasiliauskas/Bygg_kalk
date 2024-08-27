import 'package:flutter/material.dart';

class TerraceModel {
  String name;
  List<String> description;
  List<String> unit;
  List<double> quantity;
  List<double> laborHours1;
  List<double> laborHours2;
  List<double> laborCost;
  List<double> material;
  List<double> materials;
  List<double> totalPrice;
  final Color color;
  final String constructionType;
  double calculationQuantity;

  TerraceModel({
    required this.name,
    required this.description,
    required this.unit,
    required this.quantity,
    required this.laborHours1,
    required this.laborHours2,
    required this.laborCost,
    required this.material,
    required this.materials,
    required this.totalPrice,
    Color? color, // Change to nullable Color
    String? constructionType,
    this.calculationQuantity = 0.0,
  })  : constructionType = constructionType ?? "Nan",
        color = color ?? Color.fromARGB(255, 166, 116, 212);
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'unit': unit,
      'quantity': quantity,
      'laborHours1': laborHours1,
      'laborHours2': laborHours2,
      'laborCost': laborCost,
      'material': material,
      'materials': materials,
      'totalPrice': totalPrice,
    };
  }

  TerraceModel.fromJson(Map<String, dynamic> json)
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
        laborHours1 = json['laborHours1'] is List
            ? json['laborHours1'].cast<double>().toList()
            : [],
        laborHours2 = json['laborHours2'] is List
            ? json['laborHours2'].cast<double>().toList()
            : [],
        laborCost = json['laborCost'] is List
            ? json['laborCost'].cast<double>().toList()
            : [],
        material = json['material'] is List
            ? json['material'].cast<double>().toList()
            : [],
        materials = json['materials'] is List
            ? json['materials'].cast<double>().toList()
            : [],
        totalPrice = json['totalPrice'] is List
            ? json['totalPrice'].cast<double>().toList()
            : [],
        color = Color.fromARGB(255, 166, 116, 212),
        constructionType = json['constructionType'],
        calculationQuantity = json['calculationQuantity'];
}
