import 'package:cost_calculator/pages/item_screen/interior_wall_items_screen.dart';
import 'package:flutter/material.dart';

//used in Sparkling strimmel, flekksp.1, skjøtsp. 2, helsp.1, grunning. 2 strøk maling
double calculateCostPainting(
    int index, InteriorWallItemsScreen widget, hourlyRatePainting) {
  double laborCost = widget.laborHours2[index];
  return laborCost * hourlyRatePainting;
}

double calculateMaterialQuantity(
    int index, InteriorWallItemsScreen widget, calculationQuantity) {
  double quantity = widget.quantity[index];
  return quantity * calculationQuantity;
}

double calculateWorkHours2(int index, customColumn, emptyCustomList,
    InteriorWallItemsScreen widget, calculationQuantity) {
  if (customColumn) {
    double laborHours1 = emptyCustomList[index];
    return laborHours1 * calculationQuantity;
  } else {
    double laborHours1 = widget.laborHours1[index];
    return laborHours1 * calculationQuantity;
  }
}

double calculateJobCost(int index, InteriorWallItemsScreen widget,
    hourlyRateConstructionRemodeling) {
  double laborHours2 = widget.laborHours2[index];
  return laborHours2 * hourlyRateConstructionRemodeling;
}

double calculateMaterialCost(int index, InteriorWallItemsScreen widget,
    calculationQuantity, customColumn, emptyCustomList) {
  double material1 = widget.material1[index];
  return material1 * calculationQuantity;
}

double calculateTotalPrice(int index, InteriorWallItemsScreen widget,
    calculationQuantity, customColumn, emptyCustomList) {
  double jobCost = widget.laborCost[index];
  return jobCost + widget.material1[index] * calculationQuantity;
}

double totalLaborHours1 = 0.0;
double totalCustomColumn = 0.0;
double totalLaborHours2 = 0.0;
double totalLaborCost = 0.0;
double totalMaterial1 = 0.0;
double totalMaterial2 = 0.0;
double totalTotalPrice = 0.0;

void calcTotals(InteriorWallItemsScreen widget, emptyCustomList) {
  for (int i = 0; i < widget.description.length; i++) {
    totalLaborHours1 += widget.laborHours1[i];
    totalCustomColumn += emptyCustomList[i];
    totalLaborHours2 += widget.laborHours2[i];
    totalLaborCost += widget.laborCost[i];
    totalMaterial1 += widget.material1[i];
    totalMaterial2 += widget.material2[i];
    totalTotalPrice += widget.totalPrice[i];
  }
}

List<DataColumn> calculationColumnsEng = [
  DataColumn(
    label: Text('Calculation Quantity'),
  ),
  DataColumn(
    label: Text('Hourly Rate - Construction/Remodeling'),
  ),
  DataColumn(
    label: Text('Unit'),
  ),
];

List<DataColumn> calculationColumnsNorw = [
  DataColumn(
    label: Text('Mengde'),
  ),
  DataColumn(
    label: Text('Time pris. Ny bygg og ombygging.'),
  ),
  DataColumn(
    label: Text('Enhet'),
  ),
];

DataRow totalSumRowEng = DataRow(
  cells: [
    DataCell(
      Container(
        width: 200,
        child: Text('Total Sum'), // child: Text('Sum (eks. mva):'),
      ),
    ),
    DataCell(
      Container(
        width: 100,
        child: Text(''),
      ),
    ),
    DataCell(
      Container(
        width: 100,
        child: Text(''),
      ),
    ),
    DataCell(
      Container(
        width: 150,
        child: Text(''),
      ),
    ),
    DataCell(
      Container(
        width: 100,
        child: Text(totalLaborHours1.toStringAsFixed(2)),
      ),
    ),
    DataCell(
      Container(
        width: 100,
        child: Text(totalCustomColumn.toStringAsFixed(2)),
      ),
    ),
    DataCell(
      Container(
        width: 100,
        child: Text(totalLaborHours2.toStringAsFixed(2)),
      ),
    ),
    DataCell(
      Container(
        width: 100,
        child: Text(totalLaborCost.toStringAsFixed(2)),
      ),
    ),
    DataCell(
      Container(
        width: 100,
        child: Text(totalMaterial1.toStringAsFixed(2)),
      ),
    ),
    DataCell(
      Container(
        width: 100,
        child: Text(totalMaterial2.toStringAsFixed(2)),
      ),
    ),
    DataCell(
      Container(
        width: 100,
        child: Text(totalTotalPrice.toStringAsFixed(2)),
      ),
    ),
  ],
);
