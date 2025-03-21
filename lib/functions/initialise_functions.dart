import 'package:cost_calculator/pages/item_screen/interior_wall_items_screen.dart';
import 'package:flutter/material.dart';

//used in Sparkling strimmel, flekksp.1, skjøtsp. 2, helsp.1, grunning. 2 strøk maling
double calculateCostPainting(
    int index, InteriorWallItemsScreen widget, hourlyRatePainting) {
  double laborCost = widget.laborHours2[index];
  return laborCost * hourlyRatePainting;
}

double calculateWorkHours2(
    int index, List<double> widgetLaborHours1, hourlyWorkRate) {
  double laborHours1 = widgetLaborHours1[index];
  return laborHours1 * hourlyWorkRate;
}

double calculateJobCost(int index, List<double> widgetLaborHours2, hourlyRate) {
  return widgetLaborHours2[index] * hourlyRate;
}

double calculateMaterialCost(
    int index, List<double> widgetMaterial1, calculationQuantity) {
  double material1 = widgetMaterial1[index];
  return material1 * calculationQuantity;
}

double calculateTotalPrice(
    int index, List<double> widgetLaborCost, List<double> widgetMaterial2) {
  return widgetLaborCost[index] + widgetMaterial2[index];
}

Widget buildCustomColumnLabel(
    String label, double width, VoidCallback onPressed) {
  return SizedBox(
    width: width,
    child: TextButton(
      onPressed: onPressed,
      child: Text("$label"),
    ),
  );
}

DataCell dataCellDisplay(List<String> text, int i, double width, bool visible,
    {double? optionalPadding}) {
  return DataCell(
    Container(
      width: width, // Set the width as needed
      child: Padding(
        padding: optionalPadding != null
            ? EdgeInsets.only(left: optionalPadding)
            : EdgeInsets.zero,
        child: Visibility(
          visible: visible,
          child: Text(
            text[i],
            maxLines: 5, // Set the maximum number of lines
            overflow: TextOverflow.ellipsis, // Allow text to overflow and wrap
          ),
        ),
      ),
    ),
  );
}

DataCell dataCellDisplaySingleBoldText(
    String text, double width, Color color, bool visible,
    {double? optionalPadding}) {
  return DataCell(
    Container(
      padding: optionalPadding != null
          ? EdgeInsets.only(left: optionalPadding)
          : EdgeInsets.zero,
      width: width,
      child: Visibility(
        visible: visible,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

DataCell dataCellDisplaySingle(String text, double width, Color color,
    {double? optionalPadding}) {
  return DataCell(
    Container(
      padding: optionalPadding != null
          ? EdgeInsets.only(left: optionalPadding)
          : EdgeInsets.zero,
      width: width, // Set the width as needed
      child: Text(
        text,
      ),
      decoration: BoxDecoration(
        color: color,
      ),
    ),
  );
}

DataCell dataCellDisplayController(
    List<TextEditingController> controller, int i, bool visible) {
  return DataCell(
    Container(
      width: 55,
      child: Visibility(
        visible: visible,
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 12),
          ),
          readOnly: true,
          controller: controller[i],
        ),
      ),
    ),
  );
}

DataCell dataCellDoSingleWithBoldText(
  TextEditingController controller,
  Function f,
  Color color,
  bool readOnly,
  double width,
  bool visible,
) {
  return DataCell(
    SizedBox(
      width: width,
      child: Visibility(
        visible: visible,
        child: TextField(
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          readOnly: readOnly,
          controller: controller,
          onChanged: (value) => f(value),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 8),
          ),
          keyboardType:
              readOnly ? null : TextInputType.numberWithOptions(decimal: true),
        ),
      ),
    ),
  );
}

DataCell dataCellDoSingle(TextEditingController controller, Function f,
    Color color, bool readOnly, double width) {
  return DataCell(
    SizedBox(
      width: width,
      child: TextField(
        readOnly: readOnly,
        controller: controller,
        onChanged: (value) => f(value),
        decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: color,
            filled: true,
            contentPadding: EdgeInsets.only(left: 8)),
        keyboardType:
            readOnly ? null : TextInputType.numberWithOptions(decimal: true),
      ),
    ),
  );
}

DataCell dataCellDo(List<TextEditingController> controller, int i, Function f,
    Color color, bool readOnly, bool visible,
    {double? optionalWidth}) {
  return DataCell(
    SizedBox(
      width: optionalWidth != null ? optionalWidth : 60,
      child: Visibility(
        visible: visible,
        child: TextField(
          readOnly: readOnly,
          controller: controller[i],
          onChanged: (value) => f(value),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            contentPadding: EdgeInsets.only(left: 8),
            fillColor: color,
            filled: true,
          ),
          keyboardType:
              readOnly ? null : TextInputType.numberWithOptions(decimal: true),
        ),
      ),
    ),
  );
}

Widget buildCustomDisappearingColumnLabel(
    String label, double width, VoidCallback onPressed, bool visible) {
  return SizedBox(
    width: width,
    child: Visibility(
      visible: visible,
      child: TextButton(
        onPressed: onPressed,
        child: Text("$label"),
      ),
    ),
  );
}

DataColumn createDisappearingDataColumn(
    String label, double width, VoidCallback onPressed, visible) {
  return DataColumn(
    label: buildCustomDisappearingColumnLabel(label, width, onPressed, visible),
  );
}

DataColumn createDataColumn(
    String label, double width, VoidCallback onPressed) {
  return DataColumn(
    label: buildCustomColumnLabel(label, width, onPressed),
  );
}

DataRow totalSumRowNorw(
    double totalLaborHours1,
    double totalLaborHours2,
    double totalLaborCost,
    double totalMaterial1,
    double totalMaterial2,
    double totalTotalPrice) {
  return DataRow(
    cells: [
      DataCell(
        Container(
          width: 200,
          child: Text('Sum (eks. mva):'),
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
}

DataRow totalSumRowLit(
    double totalLaborHours1,
    double totalLaborHours2,
    double totalLaborCost,
    double totalMaterial1,
    double totalMaterial2,
    double totalTotalPrice) {
  return DataRow(
    cells: [
      DataCell(
        Container(
          width: 200,
          child: Text('Galutinė suma'), // child: Text('Sum (eks. mva):'),
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
}

DataRow totalSumRowEng(
    double totalLaborHours1,
    double totalLaborHours2,
    double totalLaborCost,
    double totalMaterial1,
    double totalMaterial2,
    double totalTotalPrice) {
  return DataRow(
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
}

DataRow totalSumRowPol(
    double totalLaborHours1,
    double totalLaborHours2,
    double totalLaborCost,
    double totalMaterial1,
    double totalMaterial2,
    double totalTotalPrice) {
  return DataRow(
    cells: [
      DataCell(
        Container(
          width: 200,
          child: Text('Suma całkowita'), // child: Text('Sum (eks. mva):'),
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
}
