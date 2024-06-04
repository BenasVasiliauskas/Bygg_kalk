import 'package:flutter/material.dart';

double hourlyRate = 1;
TextEditingController hourlyRateTextEditingController =
    TextEditingController(text: hourlyRate.toStringAsFixed(2));

double timeCoefficient = 1;
TextEditingController timeCoefficientTextEditingController =
    TextEditingController(text: timeCoefficient.toStringAsFixed(2));

double markup = 1;
TextEditingController markupTexteditingController =
    TextEditingController(text: markup.toStringAsFixed(2));

double costs = 1;
TextEditingController costsTextEditingController =
    TextEditingController(text: costs.toStringAsFixed(2));

double calculationQuantity = 1;

bool isDirty = false;

void markAsClean() {
  isDirty = !isDirty;
}
