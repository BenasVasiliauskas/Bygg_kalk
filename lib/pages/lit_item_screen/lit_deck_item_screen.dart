import 'package:cost_calculator/constants/lit_budget_constants.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/functions/initialise_functions.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
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

//
class _LitDeckItemScreenState extends State<LitDeckItemScreen> {
  bool visible = false;

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
    DataRow totalSumRow = totalSumRowLit(totalLaborHours1, totalLaborHours2,
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
    for (int i = 0; i < litInnerDoor.length; i++) {
      if (litInnerDoor[i].name == widget.name) {
        setState(() {
          for (int j = 0; j < litInnerDoor[i].laborHours1.length; j++) {
            widget.laborHours1[j] = litInnerDoor[i].laborHours1[j];
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
          title: const Text("Ar norite išsaugoti?"),
          content:
              const Text("Ar tikrai norite palikti puslapį jo neišsaugoję?"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Išsaugoti ir išeiti'),
              onPressed: () {
                markAsClean();
                Navigator.pop(context, true);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Palikti'),
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
        hourlyRate,
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
        widget.material2,
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
      createDataColumn("Įkainio aprašymas", 98, () {}),
      createDataColumn("Mato vnt.", 60, () {}),
      createDataColumn(visible ? "<" : ">", 55, () {
        setState(() {
          visible = !visible;
        });
      }),
      createDisappearingDataColumn("Kiekis", 80, () {}, visible),
      createDisappearingDataColumn("Laiko norma", 70, () {
        updateTotalSum();
        rebuildDataTable();
      }, visible),
      createDisappearingDataColumn("Laikas", 65, () {}, visible),
      createDisappearingDataColumn("Darbas be PVM", 75, () {}, visible),
      createDisappearingDataColumn("Medžiagų norma be PVM", 90, () {}, visible),
      createDisappearingDataColumn("Medžiagos be PVM", 95, () {}, visible),
      createDisappearingDataColumn("Bendra kaina be PVM ", 85, () {}, visible),
    ];

    List<DataRow> rows = [];

    for (int i = 0; i < widget.description.length; i++) {
      rows.add(
        DataRow(
          cells: [
            dataCellDisplay(widget.description, i, 120, true),
            dataCellDisplay(widget.unit, i, 45, true, optionalPadding: 12),
            DataCell(
              Container(
                width: 55, // match column width
                child: const Text(""), // or a TextField, or anything you want
              ),
            ),
            dataCellDisplayController(quantityControllers, i, visible),
            dataCellDo(laborHours1Controllers, i, (value) {
              isDirty = true;
              //
              double parsedValue = double.parse(value);
              widget.laborHours1[i] = double.parse(
                parsedValue.toStringAsFixed(2),
              );
              //
              widget.laborHours2[i] = calculateWorkHours2(
                i,
                widget.laborHours1,
                widget.calculationQuantity,
              );
              laborHours2Controllers[i].text = calculateWorkHours2(
                i,
                widget.laborHours1,
                widget.calculationQuantity,
              ).toStringAsFixed(2);
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
              widget.totalPrice[i] = calculateTotalPrice(
                i,
                widget.laborCost,
                widget.material2,
              );
              totalPriceControllers[i].text = calculateTotalPrice(
                i,
                widget.laborCost,
                widget.material2,
              ).toStringAsFixed(2);
              rebuildDataTable();
            },
                Color.fromARGB(255, 218, 128, 122),
                false,
                optionalWidth: 55,
                visible),
            dataCellDo(laborHours2Controllers, i, (value) {
              // Handle changes to labor hours 2
              double parsedValue = double.parse(value);
              widget.laborHours2[i] =
                  double.parse(parsedValue.toStringAsFixed(2));
              // Recalculate the labor cost when labor hours 2 changes
              double updatedLaborCost = calculateJobCost(
                i,
                widget.laborHours2,
                hourlyRate,
              ); // Calculate the labor cost
              widget.laborCost[i] =
                  double.parse(updatedLaborCost.toStringAsFixed(2));
            }, Theme.of(context).colorScheme.surface, true, visible,
                optionalWidth: 45),
            dataCellDo(laborCostControllers, i, (value) {
              widget.laborCost[i] = double.parse(value);
            }, Theme.of(context).colorScheme.surface, true, visible,
                optionalWidth: 65),
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
                widget.material2,
              );
              ;
              widget.totalPrice[i] = updatedTotalPrice;
              totalPriceControllers[i].text =
                  updatedTotalPrice.toStringAsFixed(2);
              // Format to 2 decimal places
              rebuildDataTable();
            }, Color.fromARGB(255, 218, 128, 122), false, visible,
                optionalWidth: 75),
            dataCellDo(material2Controllers, i, (value) {
              widget.material2[i] = double.parse(value);
              material2Controllers[i].text =
                  widget.material2[i].toStringAsFixed(2);
            }, Theme.of(context).colorScheme.surface, true, visible,
                optionalWidth: 75),
            dataCellDo(totalPriceControllers, i, (value) {
              widget.totalPrice[i] = double.parse(value);
              totalPriceControllers[i].text =
                  widget.totalPrice[i].toStringAsFixed(2);
            }, Color.fromARGB(255, 153, 240, 131), true, visible,
                optionalWidth: 75),
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
          "Iš viso (be PVM)",
          115,
          Theme.of(context).colorScheme.surface,
          true,
        ),
        dataCellDisplaySingleBoldText(
            "", 55, Theme.of(context).colorScheme.surface, true),
        dataCellDisplaySingleBoldText(
            "", 55, Theme.of(context).colorScheme.surface, true),
        dataCellDisplaySingleBoldText(
            "", 55, Theme.of(context).colorScheme.surface, true),
        DataCell(
          Visibility(
            visible: visible,
            child: SizedBox(
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
                    text: totalLaborHours1.toStringAsFixed(2)),
                readOnly: true,
              ),
            ),
          ),
        ),
        dataCellDisplaySingleBoldText(
          totalLaborHours2.toStringAsFixed(2),
          80,
          Theme.of(context).colorScheme.surface,
          visible,
          optionalPadding: 8,
        ),
        dataCellDisplaySingleBoldText(totalLaborCost.toStringAsFixed(2), 55,
            Theme.of(context).colorScheme.surface, visible,
            optionalPadding: 8),
        dataCellDisplaySingleBoldText(totalMaterial1.toStringAsFixed(2), 75,
            Theme.of(context).colorScheme.surface, visible),
        dataCellDisplaySingleBoldText(totalMaterial2.toStringAsFixed(2), 75,
            Theme.of(context).colorScheme.surface, visible,
            optionalPadding: 8),
        dataCellDoSingleWithBoldText(
          TextEditingController(text: totalTotalPrice.toStringAsFixed(2)),
          (value) {},
          Theme.of(context).colorScheme.surface,
          true,
          75,
          visible,
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
      ),
    );
  }
}
