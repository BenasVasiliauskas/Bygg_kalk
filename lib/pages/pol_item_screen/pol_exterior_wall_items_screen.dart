// ignore_for_file: must_be_immutable

import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/functions/initialise_functions.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:flutter/material.dart';
import 'package:cost_calculator/constants/pol_budget_constants.dart';

class PolExteriorWallItemsScreen extends StatefulWidget {
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

  PolExteriorWallItemsScreen(
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
  _PolExteriorWallItemsScreenState createState() =>
      _PolExteriorWallItemsScreenState();
}

class _PolExteriorWallItemsScreenState
    extends State<PolExteriorWallItemsScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();
  List<DataRow> rows = [];
  List<TextEditingController> descriptionControllers = [];
  List<TextEditingController> unitControllers = [];
  List<TextEditingController> quantityControllers = [];
  List<TextEditingController> materialQuantityControllers = [];
  List<TextEditingController> laborHours1Controllers = [];
  List<TextEditingController> laborHours2Controllers = [];
  List<TextEditingController> laborCostControllers = [];
  List<TextEditingController> material1Controllers = [];
  List<TextEditingController> material2Controllers = [];
  List<TextEditingController> totalPriceControllers = [];
  late TextEditingController savingController;
  late TextEditingController loadingController;

  //

  void calculateCalculationQuantity() {
    double mat2Total = widget.material2
        .fold(0, (previousValue, element) => previousValue + element);
    double mat1Total = widget.material1
        .fold(0, (previousValue, element) => previousValue + element);

    calculationQuantity = mat2Total / mat1Total;

    widget.calculationQuantity = calculationQuantity;
  }

  void rebuildDataTable() {
    List<DataRow> updatedRows =
        List.from(rows); // Create a copy of the existing rows

    // Remove the existing "Total Sum" row if it exists
    updatedRows.removeWhere((row) {
      if (row.cells.isNotEmpty && row.cells[0].child is Container) {
        return true;
      }
      return false;
    });

    // Calculate the total sum values
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

    // Create the "Total Sum" row
    DataRow totalSumRow = totalSumRowPol(totalLaborHours1, totalLaborHours2,
        totalLaborCost, totalMaterial1, totalMaterial2, totalTotalPrice);

    // Add the "Total Sum" row to the updated rows
    updatedRows.add(totalSumRow);

    // Set the updated rows in the DataTable
    setState(() {
      rows = updatedRows;
    });
  }

// Update the "Total Sum" row in the updateTotalSum method
  void updateTotalSum() {
    rebuildDataTable(); // Call the method to rebuild the DataTable
  }

  void initialiseStates() {
    for (int i = 0; i < widget.description.length; i++) {
      descriptionControllers.add(
        TextEditingController(
          text: widget.description[i],
        ),
      );
      unitControllers.add(
        TextEditingController(
          text: widget.unit[i],
        ),
      );
      quantityControllers.add(
        TextEditingController(
          text: widget.quantity[i].toStringAsFixed(2),
        ),
      );

      laborHours1Controllers.add(
        TextEditingController(
          text: widget.laborHours1[i].toStringAsFixed(2),
        ),
      );
      laborHours2Controllers.add(
        TextEditingController(
          text: widget.laborHours2[i].toStringAsFixed(2),
        ),
      );
      laborCostControllers.add(
        TextEditingController(
          text: widget.laborCost[i].toStringAsFixed(2),
        ),
      );
      material1Controllers.add(
        TextEditingController(
          text: widget.material1[i].toStringAsFixed(2),
        ),
      );
      material2Controllers.add(
        TextEditingController(
          text: widget.material2[i].toStringAsFixed(2),
        ),
      );
      totalPriceControllers.add(
        TextEditingController(
          text: widget.totalPrice[i].toStringAsFixed(2),
        ),
      );
    }

    savingController = TextEditingController();
    loadingController = TextEditingController();
  }

  void setInitialValues() {
    for (int i = 0; i < widget.description.length; i++) {
      descriptionControllers[i].text = widget.description[i];
      unitControllers[i].text = widget.unit[i];
      quantityControllers[i].text = widget.quantity[i].toStringAsFixed(2);

      laborHours1Controllers[i].text = widget.laborHours1[i].toStringAsFixed(2);
      laborHours2Controllers[i].text = widget.laborHours2[i].toStringAsFixed(2);
      laborCostControllers[i].text = widget.laborCost[i].toStringAsFixed(2);
      material1Controllers[i].text = widget.material1[i].toStringAsFixed(2);
      material2Controllers[i].text = widget.material2[i].toStringAsFixed(2);
      totalPriceControllers[i].text = widget.totalPrice[i].toStringAsFixed(2);
    }

    recalculateValues();
  }

  void _resetLaborHours() {
    if (!mounted) return; // Ensure the widget is still mounted

    for (int i = 0; i < polExteriorWallData.length; i++) {
      if (polExteriorWallData[i].name == widget.name) {
        setState(() {
          for (int j = 0; j < polExteriorWallData[i].laborHours1.length; j++) {
            widget.laborHours1[j] = polExteriorWallData[i].laborHours1[j];
          }
        });
        return;
      }
    }
  }

  Future<bool?> _showBackDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Vil du spare?"),
          content: const Text(
              "Er du sikker på at du vil forlate siden uten å lagre?"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Lagre og gå'),
              onPressed: () {
                markAsClean();
                Navigator.pop(context, true);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Gå'),
              onPressed: () {
                _resetLaborHours();
                markAsClean();
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  void recalculateValues() {
    for (int i = 0; i < widget.description.length; i++) {
      // Recalculate labor hours 2
      widget.laborHours2[i] = calculateWorkHours2(
        i,
        widget.laborHours1,
        widget.calculationQuantity,
      );
      laborHours2Controllers[i].text = widget.laborHours2[i].toStringAsFixed(2);
      // Recalculate labor cost
      widget.laborCost[i] = calculateJobCost(
        i,
        widget.laborHours2,
        widget.calculationQuantity,
      );
      laborCostControllers[i].text = widget.laborCost[i].toStringAsFixed(2);
      // Recalculate material 2
      widget.material2[i] = calculateMaterialCost(
        i,
        widget.material1,
        widget.calculationQuantity,
      );
      material2Controllers[i].text = widget.material2[i].toStringAsFixed(2);
      // Recalculate total price
      widget.totalPrice[i] = calculateTotalPrice(
        i,
        widget.laborCost,
        widget.material1,
        widget.calculationQuantity,
      );
      totalPriceControllers[i].text = widget.totalPrice[i].toStringAsFixed(2);
    }
    // Update the total sum row
    updateTotalSum();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
    // Initialize controllers with empty controllers
    initialiseStates();

    // Set the initial values from widget data to controllers
    setInitialValues();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);

    savingController.dispose();
    loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<DataColumn> columns = [
      createDataColumn("Opis", 98, () {}),
      createDataColumn("Jednostka", 55, () {}),
      createDataColumn("Ilość", 80, () {}),
      createDataColumn("Zwiększ. czas.", 65, () {
        updateTotalSum();
        rebuildDataTable();
      }),
      createDataColumn("Suma czasu.", 75, () {}),
      createDataColumn("Koszt pracy", 55, () {}),
      createDataColumn("Wzmocnienie", 85, () {}),
      createDataColumn("Suma materiałów", 85, () {}),
      createDataColumn("Łączna cena", 75, () {}),
    ];

    List<DataRow> rows = [];

    for (int i = 0; i < widget.description.length; i++) {
      rows.add(
        DataRow(
          cells: [
            dataCellDisplay(widget.description, i, 120),
            dataCellDisplay(widget.unit, i, 40, optionalPadding: 12),
            dataCellDisplayController(quantityControllers, i),

            dataCellDo(
              laborHours1Controllers,
              i,
              (value) {
                isDirty = true;
                //
                double parsedValue = double.parse(value);
                widget.laborHours1[i] = double.parse(
                  parsedValue.toStringAsFixed(2),
                );
                //
                widget.laborHours2[i] = calculateWorkHours2(
                    i, widget.laborHours1, widget.calculationQuantity);
                laborHours2Controllers[i].text = calculateWorkHours2(
                        i, widget.laborHours1, widget.calculationQuantity)
                    .toStringAsFixed(2);
                //
                widget.laborCost[i] = calculateJobCost(
                    i, widget.laborHours1, widget.calculationQuantity);
                laborCostControllers[i].text = calculateJobCost(
                        i, widget.laborHours1, widget.calculationQuantity)
                    .toStringAsFixed(2);
                //
                widget.laborCost[i] = calculateJobCost(
                    i, widget.laborHours2, widget.calculationQuantity);
                laborCostControllers[i].text = calculateJobCost(
                        i, widget.laborHours2, widget.calculationQuantity)
                    .toStringAsFixed(2);

                // Recalculate and update the material 2 when quantity changes
                widget.material2[i] = calculateMaterialCost(
                  i,
                  widget.material1,
                  widget.calculationQuantity,
                );
                material2Controllers[i].text = calculateMaterialCost(
                  i,
                  widget.material1,
                  widget.calculationQuantity,
                ).toStringAsFixed(2);

                // Recalculate and update the total price when quantity changes
                widget.totalPrice[i] = calculateTotalPrice(i, widget.laborCost,
                    widget.material1, widget.calculationQuantity);
                totalPriceControllers[i].text = calculateTotalPrice(
                        i,
                        widget.laborCost,
                        widget.material1,
                        widget.calculationQuantity)
                    .toStringAsFixed(2);
                rebuildDataTable();
              },
              Color.fromARGB(255, 218, 128, 122),
              false,
              optionalWidth: 55,
            ), // custom column cell

            dataCellDo(
              laborHours2Controllers,
              i,
              (value) {
                // Handle changes to labor hours 2
                double parsedValue = double.parse(value);
                widget.laborHours2[i] =
                    double.parse(parsedValue.toStringAsFixed(2));
                // Recalculate the labor cost when labor hours 2 changes
                double updatedLaborCost = calculateJobCost(
                    i,
                    widget.laborHours2,
                    widget.calculationQuantity); // Calculate the labor cost
                widget.laborCost[i] =
                    double.parse(updatedLaborCost.toStringAsFixed(2));
              },
              Theme.of(context).colorScheme.surface,
              true,
              optionalWidth: 55,
            ),
            dataCellDo(
              laborCostControllers,
              i,
              (value) {
                widget.laborCost[i] = double.parse(value);
              },
              Theme.of(context).colorScheme.surface,
              true,
              optionalWidth: 65,
            ),
            dataCellDo(
              material1Controllers,
              i,
              (value) {
                // Handle changes to material 1
                double parsedValue = double.parse(value);
                widget.material1[i] = double.parse(parsedValue
                    .toStringAsFixed(2)); // Format to 2 decimal places

                // Recalculate and update the material 2 when material 1 changes
                double updatedMaterial2 = calculateMaterialCost(
                  i,
                  widget.material1,
                  widget.calculationQuantity,
                );
                widget.material2[i] = updatedMaterial2;
                material2Controllers[i].text =
                    updatedMaterial2.toStringAsFixed(2);

                // Recalculate total price
                double updatedTotalPrice = calculateTotalPrice(
                    i,
                    widget.laborCost,
                    widget.material1,
                    widget.calculationQuantity);
                widget.totalPrice[i] = updatedTotalPrice;
                totalPriceControllers[i].text =
                    updatedTotalPrice.toStringAsFixed(2);
                // Format to 2 decimal places

                rebuildDataTable();
              },
              Color.fromARGB(255, 218, 128, 122),
              false,
              optionalWidth: 75,
            ),
            dataCellDo(
              material2Controllers,
              i,
              (value) {
                widget.material2[i] = double.parse(value);
                material2Controllers[i].text =
                    widget.material2[i].toStringAsFixed(2);
              },
              Theme.of(context).colorScheme.surface,
              true,
              optionalWidth: 75,
            ),
            dataCellDo(
              totalPriceControllers,
              i,
              (value) {
                widget.totalPrice[i] = double.parse(value);
                totalPriceControllers[i].text =
                    widget.totalPrice[i].toStringAsFixed(2);
              },
              Color.fromARGB(255, 153, 240, 131),
              true,
              optionalWidth: 75,
            ),
          ],
        ),
      );
    }

    // Calculate the total sum values for each column

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

// Create the "Total Sum" row
    DataRow totalSumRow = DataRow(
      cells: [
        dataCellDisplaySingle(
          "Total (eks. mva)",
          115,
          Theme.of(context).colorScheme.surface,
        ),
        dataCellDisplaySingle(
          "",
          0,
          Theme.of(context).colorScheme.surface,
        ),
        dataCellDisplaySingle(
          "",
          0,
          Theme.of(context).colorScheme.surface,
        ),
        DataCell(
          SizedBox(
            width: 55,
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 8),
                  fillColor: const Color.fromARGB(255, 218, 128, 122),
                  filled: true),
              controller: TextEditingController(
                  text: totalLaborHours1.toStringAsFixed(2)),
              readOnly: true,
            ),
          ),
        ),
        dataCellDisplaySingle(
          totalLaborHours2.toStringAsFixed(2),
          70,
          Theme.of(context).colorScheme.surface,
          optionalPadding: 8,
        ),
        dataCellDisplaySingle(
          totalLaborCost.toStringAsFixed(2),
          70,
          Theme.of(context).colorScheme.surface,
          optionalPadding: 8,
        ),
        DataCell(
          SizedBox(
            width: 75,
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 8),
                  fillColor: const Color.fromARGB(255, 218, 128, 122),
                  filled: true),
              controller: TextEditingController(
                  text: totalMaterial1.toStringAsFixed(2)),
              readOnly: true,
            ),
          ),
        ),
        dataCellDisplaySingle(totalMaterial2.toStringAsFixed(2), 70,
            Theme.of(context).colorScheme.surface,
            optionalPadding: 8),
        dataCellDoSingle(
            TextEditingController(text: totalTotalPrice.toStringAsFixed(2)),
            (value) {},
            Color.fromARGB(255, 153, 240, 131),
            true,
            75),
      ],
    );

    List<DataRow> totalSumRows = [totalSumRow];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        if (isDirty) {
          final bool shouldPop = await _showBackDialog() ?? false;
          if (context.mounted && shouldPop) {
            Navigator.pop(context);
          }
        } else {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DataTable(
                  border: TableBorder.all(
                    color: Theme.of(context).colorScheme.surface,
                    width: 2,
                  ),
                  horizontalMargin: 15,
                  columnSpacing: 0,
                  dataRowMaxHeight: double.infinity,
                  dataRowMinHeight: 60,
                  columns: columns,
                  rows: rows,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DataTable(
                  horizontalMargin: 15,
                  columnSpacing: 0,
                  dataRowMaxHeight: double.infinity,
                  dataRowMinHeight: 60,
                  headingRowHeight: 0,
                  columns: columns,
                  rows: totalSumRows,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
