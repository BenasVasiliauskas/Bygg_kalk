// ignore_for_file: must_be_immutable

import 'package:cost_calculator/constants/budget_constants.dart';
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/functions/initialise_functions.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:flutter/material.dart';

class InnerStairsItemScreen extends StatefulWidget {
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

  InnerStairsItemScreen(
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
  State<InnerStairsItemScreen> createState() => _InnerStairsItemScreenState();
}

class _InnerStairsItemScreenState extends State<InnerStairsItemScreen> {
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
//

  //

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
    DataRow totalSumRow = totalSumRowEng(totalLaborHours1, totalLaborHours2,
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

  void _resetLaborHours() {
    if (!mounted) return; // Ensure the widget is still mounted

    for (int i = 0; i < innerDoor.length; i++) {
      if (innerDoor[i].name == widget.name) {
        setState(() {
          for (int j = 0; j < innerDoor[i].laborHours1.length; j++) {
            widget.laborHours1[j] = innerDoor[i].laborHours1[j];
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
          title: const Text("Do you want to save?"),
          content: const Text(
              "Are you sure you want to leave the page without saving?"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Save and leave'),
              onPressed: () {
                markAsClean();
                Navigator.pop(context, true);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Leave'),
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
      createDataColumn("Description", 98, () {}),
      createDataColumn("Unit", 55, () {}),
      createDataColumn("Quantity", 80, () {}),
      createDataColumn("Hours", 65, () {
        updateTotalSum();
        rebuildDataTable();
      }),
      createDataColumn("Total hours", 75, () {}),
      createDataColumn("Job Cost", 55, () {}),
      createDataColumn("Materials", 85, () {}),
      createDataColumn("Material cost", 85, () {}),
      createDataColumn("Total price", 75, () {}),
    ];

    List<DataRow> rows = [];

    for (int i = 0; i < widget.description.length; i++) {
      rows.add(
        DataRow(
          cells: [
            dataCellDisplay(widget.description, i, 120),
            dataCellDisplay(widget.unit, i, 45, optionalPadding: 12),
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
            ),
            dataCellDo(laborHours2Controllers, i, (value) {
              // Handle changes to labor hours 2
              double parsedValue = double.parse(value);
              widget.laborHours2[i] =
                  double.parse(parsedValue.toStringAsFixed(2));
              // Recalculate the labor cost when labor hours 2 changes
              double updatedLaborCost = calculateJobCost(
                i,
                widget.laborHours2,
                widget.calculationQuantity,
              ); // Calculate the labor cost
              widget.laborCost[i] =
                  double.parse(updatedLaborCost.toStringAsFixed(2));
            }, Theme.of(context).colorScheme.surface, true, optionalWidth: 45),
            dataCellDo(laborCostControllers, i, (value) {
              widget.laborCost[i] = double.parse(value);
            }, Theme.of(context).colorScheme.surface, true, optionalWidth: 65),
            dataCellDo(material1Controllers, i, (value) {
              // Handle changes to material 1
              double parsedValue = double.parse(value);
              widget.material1[i] = double.parse(
                  parsedValue.toStringAsFixed(2)); // Format to 2 decimal places

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
            }, Color.fromARGB(255, 218, 128, 122), false, optionalWidth: 75),
            dataCellDo(material2Controllers, i, (value) {
              widget.material2[i] = double.parse(value);
              material2Controllers[i].text =
                  widget.material2[i].toStringAsFixed(2);
            }, Theme.of(context).colorScheme.surface, true, optionalWidth: 75),
            dataCellDo(totalPriceControllers, i, (value) {
              widget.totalPrice[i] = double.parse(value);
              totalPriceControllers[i].text =
                  widget.totalPrice[i].toStringAsFixed(2);
            }, Color.fromARGB(255, 153, 240, 131), true, optionalWidth: 75),
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
        dataCellDisplaySingleBoldText(
          "Total sum",
          115,
          Theme.of(context).colorScheme.surface,
        ),
        dataCellDisplaySingleBoldText(
          "",
          55,
          Theme.of(context).colorScheme.surface,
        ),
        dataCellDisplaySingleBoldText(
          "",
          45,
          Theme.of(context).colorScheme.surface,
        ),
        DataCell(
          SizedBox(
            width: 55,
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 8),
                filled: true,
              ),
              controller: TextEditingController(
                text: totalLaborHours1.toStringAsFixed(2),
              ),
              readOnly: true,
            ),
          ),
        ),
        dataCellDisplaySingleBoldText(
          totalLaborHours2.toStringAsFixed(2),
          80,
          Theme.of(context).colorScheme.surface,
        ),
        dataCellDisplaySingleBoldText(
          totalLaborCost.toStringAsFixed(2),
          55,
          Theme.of(context).colorScheme.surface,
        ),
        DataCell(
          SizedBox(
            width: 75,
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 8),
                filled: true,
              ),
              controller: TextEditingController(
                text: totalMaterial1.toStringAsFixed(2),
              ),
              readOnly: true,
            ),
          ),
        ),
        dataCellDisplaySingleBoldText(
          totalMaterial2.toStringAsFixed(2),
          75,
          Theme.of(context).colorScheme.surface,
        ),
        dataCellDoSingleWithBoldText(
          TextEditingController(text: totalTotalPrice.toStringAsFixed(2)),
          (value) {},
          Color.fromARGB(255, 153, 240, 131),
          true,
          75,
        ),
      ],
    );

    rows.add(totalSumRow);
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
          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical, // Enable vertical scrolling
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
        ),
      ),
    );
  }
}
