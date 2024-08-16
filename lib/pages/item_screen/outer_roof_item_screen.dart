// ignore_for_file: must_be_immutable

import 'package:cost_calculator/data/original_data.dart';
import 'package:cost_calculator/functions/initialise_functions.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/models/outer_roof_model.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:flutter/material.dart';
import '../../constants/budget_constants.dart';
import '../../constants/innerwall_constants.dart';

class OuterRoofItemScreen extends StatefulWidget {
  String name;
  List<String> description;
  List<String> unit;
  List<double> quantity;
  List<double> materialQuantity;
  List<double> laborHours1;
  List<double> laborHours2;
  List<double> laborCost;
  List<double> material1;
  List<double> material2;
  List<double> totalPrice;

  OuterRoofItemScreen(
    this.name,
    this.description,
    this.unit,
    this.quantity,
    this.materialQuantity,
    this.laborHours1,
    this.laborHours2,
    this.laborCost,
    this.material1,
    this.material2,
    this.totalPrice,
  );

  @override
  _OuterRoofItemScreenState createState() => _OuterRoofItemScreenState();
}

TextEditingController outerRoofCalculationControllers =
    TextEditingController(text: calculationQuantity.toStringAsFixed(2));
List<double> emptyCustomList = [];
double calculationQuantity = 0;

class _OuterRoofItemScreenState extends State<OuterRoofItemScreen> {
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

  void initialiseEmptyList() {
    emptyCustomList = createList(widget.description.length);
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
      materialQuantityControllers.add(
        TextEditingController(
          text: widget.materialQuantity[i].toStringAsFixed(2),
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
    initialiseEmptyList();
    savingController = TextEditingController();
    loadingController = TextEditingController();
    if (outerRoofCalculationControllers.text != "")
      calculationQuantity = double.parse(outerRoofCalculationControllers.text);
  }

  void _updateLaborHours() {
    if (!mounted) return; // Ensure the widget is still mounted

    for (int i = 0; i < exteriorWallData.length; i++) {
      if (exteriorWallData[i].name == widget.name) {
        setState(() {
          for (int j = 0; j < exteriorWallData[i].laborHours1.length; j++) {
            widget.laborHours1[j] = exteriorWallData[i].laborHours1[j];
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
                _updateLaborHours();
                markAsClean();
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  void calculateCalculationQuantity() {
    double mat2Total = widget.material2
        .fold(0, (previousValue, element) => previousValue + element);
    double mat1Total = widget.material1
        .fold(0, (previousValue, element) => previousValue + element);

    calculationQuantity = mat2Total / mat1Total;

    outerRoofCalculationControllers.text =
        calculationQuantity.toStringAsFixed(2);
  }

  void setInitialValues() {
    for (int i = 0; i < widget.description.length; i++) {
      descriptionControllers[i].text = widget.description[i];
      unitControllers[i].text = widget.unit[i];
      quantityControllers[i].text = widget.quantity[i].toStringAsFixed(2);
      materialQuantityControllers[i].text =
          widget.materialQuantity[i].toStringAsFixed(2);
      laborHours1Controllers[i].text = widget.laborHours1[i].toStringAsFixed(2);
      laborHours2Controllers[i].text = widget.laborHours2[i].toStringAsFixed(2);
      laborCostControllers[i].text = widget.laborCost[i].toStringAsFixed(2);
      material1Controllers[i].text = widget.material1[i].toStringAsFixed(2);
      material2Controllers[i].text = widget.material2[i].toStringAsFixed(2);
      totalPriceControllers[i].text = widget.totalPrice[i].toStringAsFixed(2);
    }

    calculationQuantity.toStringAsFixed(2);
    recalculateValues();
  }

  void recalculateValues() {
    for (int i = 0; i < widget.description.length; i++) {
      widget.materialQuantity[i] =
          calculateMaterialQuantity(i, widget.quantity, calculationQuantity);
      materialQuantityControllers[i].text =
          widget.materialQuantity[i].toStringAsFixed(2);

      // Recalculate labor hours 2
      widget.laborHours2[i] = calculateWorkHours2(
        i,
        emptyCustomList,
        widget.laborHours1,
        calculationQuantity,
      );
      laborHours2Controllers[i].text = widget.laborHours2[i].toStringAsFixed(2);

      // Recalculate labor cost
      widget.laborCost[i] = calculateJobCost(
        i,
        widget.laborHours2,
        calculationQuantity,
      );
      laborCostControllers[i].text = widget.laborCost[i].toStringAsFixed(2);

      // Recalculate material 2
      widget.material2[i] = calculateMaterialCost(
        i,
        widget.material1,
        calculationQuantity,
        emptyCustomList,
      );
      material2Controllers[i].text = widget.material2[i].toStringAsFixed(2);

      // Recalculate total price
      widget.totalPrice[i] = calculateTotalPrice(
        i,
        widget.laborCost,
        widget.material1,
        calculationQuantity,
      );
      totalPriceControllers[i].text = widget.totalPrice[i].toStringAsFixed(2);
    }

    // Update the total sum row
    updateTotalSum();
  }

  @override
  void initState() {
    super.initState();
    // Initialize controllers with empty controllers
    initialiseStates();

    // Set the initial values from widget data to controllers
    setInitialValues();
    // Initialize variables only once
  }

  @override
  void dispose() {
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
      createDataColumn("Material quantity", 85, () {}),
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
            dataCellDisplay(widget.unit, i, 30, optionalPadding: 12),
            dataCellDisplayController(quantityControllers, i),
            dataCellDo(
              materialQuantityControllers,
              i,
              (value) {
                widget.materialQuantity[i] = double.parse(value);
              },
              Theme.of(context).colorScheme.background,
              true,
              optionalWidth: 45,
            ),
            DataCell(
              SizedBox(
                width: 35,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                  controller: laborHours1Controllers[i],
                  onChanged: (value) {
                    isDirty = true;
                    //
                    double parsedValue = double.parse(value);
                    widget.laborHours1[i] = double.parse(
                      parsedValue.toStringAsFixed(2),
                    );

                    //
                    widget.laborHours2[i] = calculateWorkHours2(
                        i,
                        emptyCustomList,
                        widget.laborHours1,
                        calculationQuantity);
                    laborHours2Controllers[i].text = calculateWorkHours2(
                            i,
                            emptyCustomList,
                            widget.laborHours1,
                            calculationQuantity)
                        .toStringAsFixed(2);
                    //
                    widget.laborCost[i] = calculateJobCost(
                      i,
                      widget.laborHours1,
                      calculationQuantity,
                    );
                    laborCostControllers[i].text = calculateJobCost(
                      i,
                      widget.laborHours1,
                      calculationQuantity,
                    ).toStringAsFixed(2);
                    //
                    widget.laborCost[i] = calculateJobCost(
                      i,
                      widget.laborHours2,
                      calculationQuantity,
                    );
                    laborCostControllers[i].text = calculateJobCost(
                      i,
                      widget.laborHours2,
                      calculationQuantity,
                    ).toStringAsFixed(2);

                    // Recalculate and update the material 2 when quantity changes
                    widget.material2[i] = calculateMaterialCost(i,
                        widget.material1, calculationQuantity, emptyCustomList);
                    material2Controllers[i].text = calculateMaterialCost(
                            i,
                            widget.material1,
                            calculationQuantity,
                            emptyCustomList)
                        .toStringAsFixed(2);

                    // Recalculate and update the total price when quantity changes
                    widget.totalPrice[i] = calculateTotalPrice(
                        i,
                        widget.laborCost,
                        widget.material1,
                        calculationQuantity);
                    totalPriceControllers[i].text = calculateTotalPrice(
                            i,
                            widget.laborCost,
                            widget.material1,
                            calculationQuantity)
                        .toStringAsFixed(2);
                    rebuildDataTable();
                  },
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true), // Allow decimal numbers
                ),
              ),
            ), // custom column cell

            dataCellDo(laborHours2Controllers, i, (value) {
              // Handle changes to labor hours 2
              double parsedValue = double.parse(value);
              widget.laborHours2[i] =
                  double.parse(parsedValue.toStringAsFixed(2));
              // Recalculate the labor cost when labor hours 2 changes
              double updatedLaborCost = calculateJobCost(
                i,
                widget.laborHours2,
                calculationQuantity,
              ); // Calculate the labor cost
              widget.laborCost[i] =
                  double.parse(updatedLaborCost.toStringAsFixed(2));
            }, Theme.of(context).colorScheme.background, true,
                optionalWidth: 45),
            dataCellDo(laborCostControllers, i, (value) {
              widget.laborCost[i] = double.parse(value);
            }, Theme.of(context).colorScheme.background, true,
                optionalWidth: 65),
            dataCellDo(material1Controllers, i, (value) {
              // Handle changes to material 1
              double parsedValue = double.parse(value);
              widget.material1[i] = double.parse(
                  parsedValue.toStringAsFixed(2)); // Format to 2 decimal places

              // Recalculate and update the material 2 when material 1 changes
              double updatedMaterial2 = calculateMaterialCost(
                  i, widget.material1, calculationQuantity, emptyCustomList);
              widget.material2[i] = updatedMaterial2;
              material2Controllers[i].text =
                  updatedMaterial2.toStringAsFixed(2);

              // Recalculate total price
              double updatedTotalPrice = calculateTotalPrice(
                  i, widget.laborCost, widget.material1, calculationQuantity);
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
            }, Theme.of(context).colorScheme.background, true,
                optionalWidth: 75),
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
        dataCellDisplaySingle(
          "Total sum",
          70,
          Theme.of(context).colorScheme.background,
        ),
        dataCellDisplaySingle(
          "",
          0,
          Theme.of(context).colorScheme.background,
        ),
        dataCellDisplaySingle(
          "",
          0,
          Theme.of(context).colorScheme.background,
        ),
        dataCellDisplaySingle(
          "",
          0,
          Theme.of(context).colorScheme.background,
        ),
        dataCellDisplaySingle(
          totalLaborHours1.toStringAsFixed(2),
          65,
          Theme.of(context).colorScheme.background,
        ),
        dataCellDisplaySingle(
          totalLaborHours2.toStringAsFixed(2),
          70,
          Theme.of(context).colorScheme.background,
          optionalPadding: 8,
        ),
        dataCellDisplaySingle(
          totalLaborCost.toStringAsFixed(2),
          60,
          Theme.of(context).colorScheme.background,
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
            Theme.of(context).colorScheme.background,
            optionalPadding: 8),
        dataCellDoSingle(
            TextEditingController(text: totalTotalPrice.toStringAsFixed(2)),
            (value) {},
            Color.fromARGB(255, 153, 240, 131),
            true,
            75),
      ],
    );

// Add the "Total Sum" row to the rows list
    rows.add(totalSumRow);

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder.all(
                      width: 2,
                      color: Theme.of(context).colorScheme.background),
                  horizontalMargin: 15,
                  columnSpacing: 0,
                  dataRowMaxHeight: double.infinity,
                  dataRowMinHeight: 60,
                  columns: columns, // Define your columns here
                  rows: rows,
                ),
              ),
              FloatingActionButton(
                onPressed: () async {
                  final fileName = await openDialog();
                  if (fileName == null || fileName.isEmpty) return;

                  OuterRoofModel outerRoofModel = OuterRoofModel(
                    name: widget.name,
                    description: widget.description,
                    unit: widget.unit,
                    quantity: widget.quantity,
                    materialQuantity: widget.materialQuantity,
                    laborHours1: widget.laborHours1,
                    laborHours2: widget.laborHours2,
                    laborCost: widget.laborCost,
                    material: widget.material1,
                    materials: widget.material2,
                    totalPrice: widget.totalPrice,
                  );
                  writeJson(outerRoofModel, fileName);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Data has been saved as $fileName.json')));
                },
                child: Text("Save to JSON"),
                heroTag: "btn1",
              ),
              FloatingActionButton(
                  child: Text("Load data"),
                  heroTag: "btn2",
                  onPressed: () {
                    openLoadingDialog().then(
                      (fileName) {
                        if (fileName == null || fileName.isEmpty) return;

                        readJsonFile(fileName).then(
                          (value) {
                            for (int i = 0; i < value.length; i++) {
                              OuterRoofModel outerRoofModel =
                                  OuterRoofModel.fromJson(value[i]);
                              if (outerRoofModel.name == widget.name) {
                                setState(() {
                                  widget.description =
                                      outerRoofModel.description;
                                  widget.unit = outerRoofModel.unit;
                                  widget.quantity = outerRoofModel.quantity;
                                  widget.materialQuantity =
                                      outerRoofModel.materialQuantity;
                                  widget.laborHours1 =
                                      outerRoofModel.laborHours1;
                                  widget.laborHours2 =
                                      outerRoofModel.laborHours2;
                                  widget.laborCost = outerRoofModel.laborCost;
                                  widget.material1 = outerRoofModel.material;
                                  widget.material2 = outerRoofModel.materials;
                                  widget.totalPrice = outerRoofModel.totalPrice;
                                  setInitialValues();
                                  calculateCalculationQuantity();
                                  updateTotalSum();
                                });
                              }
                            }
                          },
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> openLoadingDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Name of the file you want to load"),
          content: TextField(
            controller: loadingController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Enter the name of the file",
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  submitLoading();
                },
                child: Text("Load")),
          ],
        ),
      );

  void submitLoading() {
    Navigator.of(context).pop(loadingController.text);
    loadingController.clear();
  }

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Name the file"),
          content: TextField(
            controller: savingController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Enter the name of the file",
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  submit();
                },
                child: Text("Save")),
          ],
        ),
      );
  void submit() {
    Navigator.of(context).pop(savingController.text);
    savingController.clear();
  }
}
