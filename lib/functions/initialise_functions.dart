import 'package:cost_calculator/pages/item_screen/interior_wall_items_screen.dart';
import 'package:flutter/material.dart';

//used in Sparkling strimmel, flekksp.1, skjøtsp. 2, helsp.1, grunning. 2 strøk maling
double calculateCostPainting(
    int index, InteriorWallItemsScreen widget, hourlyRatePainting) {
  double laborCost = widget.laborHours2[index];
  return laborCost * hourlyRatePainting;
}

double calculateMaterialQuantity(
    int index, List<double> widgetQuantity, calculationQuantity) {
  double quantity = widgetQuantity[index];
  return quantity * calculationQuantity;
}

double calculateWorkHours2(int index, customColumn, emptyCustomList,
    List<double> widgetLaborHours1, calculationQuantity) {
  if (customColumn) {
    double laborHours1 = emptyCustomList[index];
    return laborHours1 * calculationQuantity;
  } else {
    double laborHours1 = widgetLaborHours1[index];
    return laborHours1 * calculationQuantity;
  }
}

double calculateJobCost(int index, List<double> widgetLaborHours2,
    hourlyRateConstructionRemodeling) {
  double laborHours2 = widgetLaborHours2[index];
  return laborHours2 * hourlyRateConstructionRemodeling;
}

double calculateMaterialCost(int index, List<double> widgetMaterial1,
    calculationQuantity, customColumn, emptyCustomList) {
  double material1 = widgetMaterial1[index];
  return material1 * calculationQuantity;
}

double calculateTotalPrice(int index, List<double> widgetLaborCost,
    List<double> widgetMaterial1, calculationQuantity) {
  double jobCost = widgetLaborCost[index];
  return jobCost + widgetMaterial1[index] * calculationQuantity;
}

Widget buildCustomColumnLabel(
    String label, double width, bool customColumn, VoidCallback onPressed) {
  if (!customColumn) {
    return SizedBox(
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text("$label"),
      ),
    );
  } else {
    return SizedBox(
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text("$label"),
      ),
    );
  }
}

DataCell dataCellDisplay(List<String> text, int i) {
  return DataCell(
    Container(
      width: 200, // Set the width as needed
      child: Text(
        text[i],
        maxLines: 3, // Set the maximum number of lines
        overflow: TextOverflow.ellipsis, // Allow text to overflow and wrap
      ),
    ),
  );
}

DataCell dataCellDisplaySingle(String text, double width, Color color) {
  return DataCell(
    Container(
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
    List<TextEditingController> controller, int i) {
  return DataCell(
    TextField(
      readOnly: true,
      controller: controller[i],
    ),
  );
}

DataCell dataCellDoSingle(
    TextEditingController controller, Function f, Color color, bool readOnly) {
  return DataCell(
    TextField(
      readOnly: readOnly,
      controller: controller,
      onChanged: (value) => f(value),
      decoration: InputDecoration(fillColor: color, filled: true),
      keyboardType:
          readOnly ? null : TextInputType.numberWithOptions(decimal: true),
    ),
  );
}

DataCell dataCellDo(List<TextEditingController> controller, int i, Function f,
    Color color, bool readOnly) {
  return DataCell(
    TextField(
      readOnly: readOnly,
      controller: controller[i],
      onChanged: (value) => f(value),
      decoration: InputDecoration(fillColor: color, filled: true),
      keyboardType:
          readOnly ? null : TextInputType.numberWithOptions(decimal: true),
    ),
  );
}

DataColumn createDataColumn(
    String label, double width, bool customColumn, VoidCallback onPressed) {
  return DataColumn(
    label: buildCustomColumnLabel(label, width, customColumn, onPressed),
  );
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

DataRow totalSumRowNorw(
    double totalLaborHours1,
    double totalCustomColumn,
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
}

DataRow totalSumRowEng(
    double totalLaborHours1,
    double totalCustomColumn,
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
}
