import 'package:flutter/material.dart';

double hourlyRate = 550;
TextEditingController hourlyRateTextEditingController =
    TextEditingController(text: hourlyRate.toStringAsFixed(2));

double timeCoefficient = 0;
TextEditingController timeCoefficientTextEditingController =
    TextEditingController(text: timeCoefficient.toStringAsFixed(2));

double markup = 0;
TextEditingController markupTexteditingController =
    TextEditingController(text: markup.toStringAsFixed(2));

double costs = 0;
TextEditingController costsTextEditingController =
    TextEditingController(text: costs.toStringAsFixed(2));

double calculationQuantity = 0;

bool isDirty = false;

void markAsClean() {
  isDirty = !isDirty;
}
