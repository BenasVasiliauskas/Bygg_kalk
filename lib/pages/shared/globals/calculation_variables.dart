import 'package:flutter/material.dart';

double hourlyRate = 550;
TextEditingController hourlyRateTextEditingController =
    TextEditingController(text: hourlyRate.toStringAsFixed(2));
//Tidsfaktor
double timeCoefficient = 0.0;
TextEditingController timeCoefficientTextEditingController =
    TextEditingController(text: timeCoefficient.toStringAsFixed(2));
//Påslag Paslag
double markup = 0.0;
TextEditingController markupTexteditingController =
    TextEditingController(text: markup.toStringAsFixed(2));
//Rigg og Drift
double costs = 0.0;
TextEditingController costsTextEditingController =
    TextEditingController(text: costs.toStringAsFixed(2));

bool isDirty = false;

void markAsClean() {
  isDirty = !isDirty;
}
