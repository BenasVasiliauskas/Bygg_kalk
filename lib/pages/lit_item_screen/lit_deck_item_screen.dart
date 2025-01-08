import 'package:cost_calculator/constants/lit_budget_constants.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/functions/initialise_functions.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:flutter/material.dart';

class LitDeckItemScreen extends StatefulWidget {
  String name;
  List<String> description;
  List<String> unit;
  List<double> quantity;
  List<double> laborHours1;
  List<double> laborHours2;
  List<double> laborCost;
  List<double> material1;
  List<double> material2;
  List<double> totalPrice;
  String constructionType;
  double calculationQuantity;

  LitDeckItemScreen(
    this.name,
    this.description,
    this.unit,
    this.quantity,
    this.laborHours1,
    this.laborHours2,
    this.laborCost,
    this.material1,
    this.material2,
    this.totalPrice,
    this.constructionType,
    this.calculationQuantity,
  );

  @override
  State<LitDeckItemScreen> createState() => _LitDeckItemScreenState();
}

class _LitDeckItemScreenState extends State<LitDeckItemScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();

  List<DataRow> rows = [];
  List<TextEditingController> descriptionControllers = [];
  List<TextEditingController> unitControllers = [];
  List<TextEditingController> quantityControllers = [];
  List<TextEditingController> laborHours1Controllers = [];
  List<TextEditingController> laborHours2Controllers = [];
  List<TextEditingController> laborCostControllers = [];
  List<TextEditingController> material1Controllers = [];
  List<TextEditingController> material2Controllers = [];
  List<TextEditingController> totalPriceControllers = [];
  late TextEditingController savingController;
  late TextEditingController loadingController;

  // Add a state variable to toggle column visibility
  bool areColumnsVisible = true;

  void rebuildDataTable() {
    List<DataRow> updatedRows = List.from(rows);

    updatedRows.removeWhere((row) {
      if (row.cells.isNotEmpty && row.cells[0].child is Container) {
        return true;
      }
      return false;
    });

    double totalLaborHours1 = 0.0;
    double totalLaborHours2 = 0.0;
    double totalLaborCost = 0.0;
    double totalMaterial1 = 0.0;
    double totalMaterial2 = 0.0;
    double totalTotalPrice = 0.0;

    for (int i = 0; i < widget.description.length; i++) {
      totalLaborHours1 += widget.laborHours1[i];
      totalLaborHours2 += widget.laborHours2[i];
      totalLaborCost += widget.laborCost[i];
      totalMaterial1 += widget.material1[i];
      totalMaterial2 += widget.material2[i];
      totalTotalPrice += widget.totalPrice[i];
    }

    addHours(widget.name, totalLaborHours2);
    addLaborCosts(widget.name, totalLaborCost);
    addMaterialCosts(widget.name, totalMaterial2);
    addBudgetSum(widget.name, totalTotalPrice);

    DataRow totalSumRow = totalSumRowLit(totalLaborHours1, totalLaborHours2,
        totalLaborCost, totalMaterial1, totalMaterial2, totalTotalPrice);

    updatedRows.add(totalSumRow);

    setState(() {
      rows = updatedRows;
    });
  }

  void updateTotalSum() {
    rebuildDataTable(); // Call the method to rebuild the DataTable
  }

  void toggleColumnsVisibility() {
    setState(() {
      areColumnsVisible = !areColumnsVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DataColumn> columns = [
      createDataColumn("Įkainio aprašymas", 98, () {}),
      createDataColumn("Mato vnt.", 60, () {}),
      // New Column to toggle visibility
      DataColumn(
        label: GestureDetector(
          onTap: toggleColumnsVisibility,
          child: Container(
            alignment: Alignment.center,
            width: 20,
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: Text(
              '>',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ),
      ),
      createDataColumn("Kiekis", 80, () {}),
      createDataColumn("Laiko norma", 70, () {
        updateTotalSum();
        rebuildDataTable();
      }),
      createDataColumn("Laikas", 65, () {}),
      createDataColumn("Darbas be PVM", 75, () {}),
      createDataColumn("Medžiagų norma be PVM", 90, () {}),
      createDataColumn("Medžiagos be PVM", 95, () {}),
      createDataColumn("Bendra kaina be PVM ", 85, () {}),
    ];

    List<DataRow> rows = [];

    for (int i = 0; i < widget.description.length; i++) {
      List<DataCell> cells = [
        dataCellDisplay(widget.description, i, 120),
        dataCellDisplay(widget.unit, i, 45, optionalPadding: 12),
        // This cell is now empty but will toggle visibility
        DataCell(
          Container(
            width: 20,
            height: 50,
            color:
                areColumnsVisible ? Colors.transparent : Colors.grey.shade200,
          ),
        ),
        dataCellDisplayController(quantityControllers, i),
      ];

      // Add the columns conditionally based on visibility
      if (areColumnsVisible) {
        cells.add(dataCellDo(
          laborHours1Controllers,
          i,
          (value) {
            // Handle labor hours changes
          },
          Color.fromARGB(255, 218, 128, 122),
          false,
          optionalWidth: 55,
        ));
        cells.add(dataCellDo(laborHours2Controllers, i, (value) {
          // Handle labor hours 2 changes
        }, Theme.of(context).colorScheme.surface, true, optionalWidth: 45));
        cells.add(dataCellDo(laborCostControllers, i, (value) {
          widget.laborCost[i] = double.parse(value);
        }, Theme.of(context).colorScheme.surface, true, optionalWidth: 65));
        cells.add(dataCellDo(material1Controllers, i, (value) {
          // Handle material 1 changes
        }, Color.fromARGB(255, 218, 128, 122), false, optionalWidth: 75));
        cells.add(dataCellDo(material2Controllers, i, (value) {
          widget.material2[i] = double.parse(value);
          material2Controllers[i].text = widget.material2[i].toStringAsFixed(2);
        }, Theme.of(context).colorScheme.surface, true, optionalWidth: 75));
        cells.add(dataCellDo(totalPriceControllers, i, (value) {
          widget.totalPrice[i] = double.parse(value);
          totalPriceControllers[i].text =
              widget.totalPrice[i].toStringAsFixed(2);
        }, Color.fromARGB(255, 153, 240, 131), true, optionalWidth: 75));
      } else {
        // Add placeholders for hidden columns
        cells.add(DataCell(Container()));
        cells.add(DataCell(Container()));
        cells.add(DataCell(Container()));
        cells.add(DataCell(Container()));
        cells.add(DataCell(Container()));
        cells.add(DataCell(Container()));
      }
      rows.add(DataRow(cells: cells));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            border: TableBorder.all(
              color: Theme.of(context).colorScheme.surface,
              width: 2,
            ),
            headingRowHeight: 80,
            horizontalMargin: 15,
            columnSpacing: 0,
            dataRowMaxHeight: double.infinity,
            dataRowMinHeight: 60,
            columns: columns,
            rows: rows,
          ),
        ),
      ),
    );
  }
}
