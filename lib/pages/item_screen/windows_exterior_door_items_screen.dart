// ignore_for_file: must_be_immutable

import 'package:cost_calculator/functions/initialise_functions.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/models/windows_exterior_doors_model.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import '../../constants/budget_constants.dart';
import '../../constants/innerwall_constants.dart';
import '../../functions/create_worksheet.dart';

class WindowsExteriorDoorItemsScreen extends StatefulWidget {
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

  WindowsExteriorDoorItemsScreen(
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
  );

  @override
  _WindowsExteriorDoorItemsScreen createState() =>
      _WindowsExteriorDoorItemsScreen();
}

List<double> emptyCustomList = [];

class _WindowsExteriorDoorItemsScreen
    extends State<WindowsExteriorDoorItemsScreen> {
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
  TextEditingController quantityCalculationControllers =
      TextEditingController();
  TextEditingController hourlyRateConstructionRemodelingController =
      TextEditingController();
  //
  List<TextEditingController> customColumnControllers = [];
  double calculationQuantity = 1;
  double hourlyRateConstructionRemodeling = 550;
  String name = '';
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
    double totalCustomColumn = 0.0;
    double totalLaborHours2 = 0.0;
    double totalLaborCost = 0.0;
    double totalMaterial1 = 0.0;
    double totalMaterial2 = 0.0;
    double totalTotalPrice = 0.0;

    for (int i = 0; i < widget.description.length; i++) {
      totalLaborHours1 += widget.laborHours1[i];
      totalCustomColumn += emptyCustomList[i];
      totalLaborHours2 += widget.laborHours2[i];
      totalLaborCost += widget.laborCost[i];
      totalMaterial1 += widget.material1[i];
      totalMaterial2 += widget.material2[i];
      totalTotalPrice += widget.totalPrice[i];
    }
    addHours(widget.name, totalLaborHours2);
    addLaborCosts(widget.name, emptyCustomList.sum);
    addMaterialCosts(widget.name, totalMaterial2);
    addBudgetSum(widget.name, totalTotalPrice);

    // Create the "Total Sum" row
    DataRow totalSumRow = totalSumRowEng(
        totalLaborHours1,
        totalCustomColumn,
        totalLaborHours2,
        totalLaborCost,
        totalMaterial1,
        totalMaterial2,
        totalTotalPrice);

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
      descriptionControllers.add(TextEditingController());
      unitControllers.add(TextEditingController());
      quantityControllers.add(TextEditingController());
      materialQuantityControllers.add(TextEditingController());
      laborHours1Controllers.add(TextEditingController());
      laborHours2Controllers.add(TextEditingController());
      laborCostControllers.add(TextEditingController());
      material1Controllers.add(TextEditingController());
      material2Controllers.add(TextEditingController());
      totalPriceControllers.add(TextEditingController());
      customColumnControllers.add(TextEditingController());
    }
    initialiseEmptyList();
    savingController = TextEditingController();
    loadingController = TextEditingController();
  }

  void calculateCalculationQuantity() {
    double mat2Total = widget.material2
        .fold(0, (previousValue, element) => previousValue + element);
    double mat1Total = widget.material1
        .fold(0, (previousValue, element) => previousValue + element);

    calculationQuantity = mat2Total / mat1Total;

    quantityCalculationControllers.text =
        calculationQuantity.toStringAsFixed(2);
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
      customColumnControllers[i].text =
          (widget.laborHours2[i] / calculationQuantity).toStringAsFixed(2);
      emptyCustomList[i] = double.parse(customColumnControllers[i].text);
    }
    quantityCalculationControllers.text =
        calculationQuantity.toStringAsFixed(2);

    hourlyRateConstructionRemodelingController.text =
        hourlyRateConstructionRemodeling.toStringAsFixed(2);
  }

  @override
  void initState() {
    super.initState();
    // Initialize controllers with empty controllers
    initialiseStates();

    // Set the initial values from widget data to controllers
    setInitialValues();
  }

  @override
  void dispose() {
    savingController.dispose();
    loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<DataColumn> calculationColumns = calculationColumnsEng;
    List<DataRow> calculationRows = [
      DataRow(
        cells: [
          dataCellDoSingle(quantityCalculationControllers, (value) {
            calculationQuantity = double.parse(value);
            for (int i = 0; i < widget.description.length; i++) {
              // Recalculate and update the material quantity when quantity changes

              widget.laborHours2[i] = calculateWorkHours2(i, customColumn,
                  emptyCustomList, widget.laborHours1, calculationQuantity);
              laborHours2Controllers[i].text = calculateWorkHours2(
                      i,
                      customColumn,
                      emptyCustomList,
                      widget.laborHours1,
                      calculationQuantity)
                  .toStringAsFixed(2);

              widget.laborCost[i] = calculateJobCost(
                  i, widget.laborHours1, hourlyRateConstructionRemodeling);
              laborCostControllers[i].text = calculateJobCost(
                      i, widget.laborHours1, hourlyRateConstructionRemodeling)
                  .toStringAsFixed(2);

              widget.laborCost[i] = calculateJobCost(
                  i, widget.laborHours2, hourlyRateConstructionRemodeling);
              laborCostControllers[i].text = calculateJobCost(
                      i, widget.laborHours2, hourlyRateConstructionRemodeling)
                  .toStringAsFixed(2);

              // Recalculate and update the material 2 when quantity changes
              widget.material2[i] = calculateMaterialCost(i, widget.material1,
                  calculationQuantity, customColumn, emptyCustomList);
              material2Controllers[i].text = calculateMaterialCost(
                      i,
                      widget.material1,
                      calculationQuantity,
                      customColumn,
                      emptyCustomList)
                  .toStringAsFixed(2);

              // Recalculate and update the total price when quantity changes
              widget.totalPrice[i] = calculateTotalPrice(
                  i, widget.laborCost, widget.material1, calculationQuantity);
              totalPriceControllers[i].text = calculateTotalPrice(i,
                      widget.laborCost, widget.material1, calculationQuantity)
                  .toStringAsFixed(2);
              //Rebuild the data table
              rebuildDataTable();
            }
          }, Color.fromARGB(255, 218, 128, 122), false, 100),
          dataCellDoSingle(hourlyRateConstructionRemodelingController, (value) {
            hourlyRateConstructionRemodeling = double.parse(value);
            for (int i = 0; i < widget.description.length; i++) {
              //
              emptyCustomList[i] =
                  double.parse(customColumnControllers[i].text);
              customColumnControllers[i].text =
                  emptyCustomList[i].toStringAsFixed(2);
              // Recalculate and update the labor cost when hourlyRateConstructionRemodeling changes
              widget.laborCost[i] = calculateJobCost(
                  i, widget.laborHours2, hourlyRateConstructionRemodeling);
              laborCostControllers[i].text = calculateJobCost(
                      i, widget.laborHours2, hourlyRateConstructionRemodeling)
                  .toStringAsFixed(2);

              // Recalculate and update the total price when hourlyRateConstructionRemodeling changes
              widget.totalPrice[i] = calculateTotalPrice(
                  i, widget.laborCost, widget.material1, calculationQuantity);
              totalPriceControllers[i].text = calculateTotalPrice(i,
                      widget.laborCost, widget.material1, calculationQuantity)
                  .toStringAsFixed(2);

              //Rebuild the data table
              rebuildDataTable();
            }
          }, Color.fromARGB(255, 218, 128, 122), false, 100),
          dataCellDisplay(<String>['kr .'], 0, 100)
        ],
      ),
    ];

    List<DataColumn> columns = [
      createDataColumn("Description", 200, customColumn, () {}),
      createDataColumn("Unit", 100, customColumn, () {}),
      createDataColumn("Quantity", 100, customColumn, () {}),
      createDataColumn("Hours", 100, customColumn, () {
        customColumn = !customColumn;
        updateTotalSum();
        rebuildDataTable();
      }),
      createDataColumn("+", 100, customColumn, () {
        customColumn = !customColumn;
        updateTotalSum();
        rebuildDataTable();
      }),
      createDataColumn("Hours2", 100, customColumn, () {}),
      createDataColumn("Job Cost", 100, customColumn, () {}),
      createDataColumn("Materials", 100, customColumn, () {}),
      createDataColumn("Material cost", 100, customColumn, () {}),
      createDataColumn("Total price", 100, customColumn, () {}),
    ];
    List<DataRow> rows = [];

    for (int i = 0; i < widget.description.length; i++) {
      rows.add(
        DataRow(
          cells: [
            dataCellDisplay(widget.description, i, 150),
            dataCellDisplay(widget.unit, i, 100),
            dataCellDisplayController(quantityControllers, i),

            DataCell(
              TextField(
                style:
                    TextStyle(color: customColumn ? Colors.grey : Colors.black),
                readOnly: true,
                controller: laborHours1Controllers[i],
                onChanged: (value) {},
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true), // Allow decimal numbers
              ),
            ), // custom column cell
            DataCell(
              TextField(
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 131, 138, 235),
                    filled: true),
                style:
                    TextStyle(color: customColumn ? Colors.black : Colors.grey),
                readOnly: !customColumn,
                controller: customColumnControllers[i],
                onChanged: (value) {
                  double parsedValue = double.parse(value);
                  emptyCustomList[i] = double.parse(parsedValue
                      .toStringAsFixed(2)); // Format to 2 decimal places
                  // Recalculate and update the labor hours 2 when labor hours 1 changes need changes

                  widget.laborHours2[i] = calculateWorkHours2(i, customColumn,
                      emptyCustomList, widget.laborHours2, calculationQuantity);
                  laborHours2Controllers[i].text = calculateWorkHours2(
                          i,
                          customColumn,
                          emptyCustomList,
                          widget.laborHours1,
                          calculationQuantity)
                      .toStringAsFixed(2);

                  // Recalculate and update the labor cost when labor hours 2 changes
                  widget.laborCost[i] = calculateJobCost(
                      i, widget.laborHours2, hourlyRateConstructionRemodeling);
                  laborCostControllers[i].text = calculateJobCost(i,
                          widget.laborHours2, hourlyRateConstructionRemodeling)
                      .toStringAsFixed(2);

                  // Recalculate and update the total price when labor hours 2 changes
                  widget.totalPrice[i] = calculateTotalPrice(i,
                      widget.laborCost, widget.material1, calculationQuantity);
                  totalPriceControllers[i].text = calculateTotalPrice(
                          i,
                          widget.laborCost,
                          widget.material1,
                          calculationQuantity)
                      .toStringAsFixed(2);

                  //total sum doesnt get updated
                  updateTotalSum();
                },
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true), // Allow decimal numbers
              ),
            ),
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
                    hourlyRateConstructionRemodeling); // Calculate the labor cost
                widget.laborCost[i] =
                    double.parse(updatedLaborCost.toStringAsFixed(2));
              },
              Color.fromARGB(255, 255, 255, 255),
              true,
            ),
            dataCellDo(
              laborCostControllers,
              i,
              (value) {
                widget.laborCost[i] = double.parse(value);
              },
              Color.fromARGB(255, 255, 255, 255),
              true,
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
                    calculationQuantity,
                    customColumn,
                    emptyCustomList);
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
              },
              Color.fromARGB(255, 218, 128, 122),
              false,
            ),
            dataCellDo(
              material2Controllers,
              i,
              (value) {
                widget.material2[i] = double.parse(value);
                material2Controllers[i].text =
                    widget.material2[i].toStringAsFixed(2);
              },
              Color.fromARGB(255, 255, 255, 255),
              true,
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
            "Total sum", 200, Color.fromARGB(255, 255, 255, 255)),
        dataCellDisplaySingle("", 100, Color.fromARGB(255, 255, 255, 255)),
        dataCellDisplaySingle("", 150, Color.fromARGB(255, 255, 255, 255)),
        dataCellDisplaySingle(
            customColumn ? '' : totalLaborHours1.toStringAsFixed(2),
            100,
            Color.fromARGB(255, 255, 255, 255)),
        DataCell(
          Container(
            width: 100,
            child: TextField(
              readOnly: true,
              decoration: customColumn
                  ? InputDecoration(
                      fillColor: Color.fromARGB(255, 131, 138, 235),
                      filled: true)
                  : InputDecoration(),
              // calc custom hours
              controller: TextEditingController(
                  text: customColumn
                      ? emptyCustomList.sum.toStringAsFixed(2)
                      : ''),
              //need to recalc labor cost and use that in total sum if enabled
            ),
          ),
        ),
        dataCellDisplaySingle(totalLaborHours2.toStringAsFixed(2), 100,
            Color.fromARGB(255, 255, 255, 255)),
        dataCellDisplaySingle(totalLaborCost.toStringAsFixed(2), 100,
            Color.fromARGB(255, 255, 255, 255)),
        DataCell(
          TextField(
            decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 218, 128, 122),
                filled: true),
            controller:
                TextEditingController(text: totalMaterial1.toStringAsFixed(2)),
            readOnly: true,
          ),
        ),
        dataCellDisplaySingle(totalMaterial2.toStringAsFixed(2), 100,
            Color.fromARGB(255, 255, 255, 255)),
        dataCellDoSingle(
            TextEditingController(text: totalTotalPrice.toStringAsFixed(2)),
            (value) {},
            Color.fromARGB(255, 153, 240, 131),
            true,
            55),
      ],
    );

// Add the "Total Sum" row to the rows list
    rows.add(totalSumRow);

    return Scaffold(
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
                dataRowMaxHeight: double.infinity,
                dataRowMinHeight: 60,
                columns: columns, // Define your columns here
                rows: rows,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Align(
                child: FloatingActionButton(
                  onPressed: () {
                    generateWindowsOuterDoorExcelDocument(
                      "WindowsExteriorDoor",
                      columns,
                      widget.description,
                      widget.unit,
                      quantityControllers,
                      materialQuantityControllers,
                      laborHours1Controllers,
                      customColumnControllers,
                      laborHours2Controllers,
                      laborCostControllers,
                      material1Controllers,
                      material2Controllers,
                      totalPriceControllers,
                      widget.name,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Excel file has been created in your Downloads folder'),
                      ),
                    );
                  },
                  child: Text("Save"),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            FloatingActionButton(
              onPressed: () async {
                final name = await openDialog();
                if (name == null || name.isEmpty) return;
                setState(() {
                  this.name = name;
                });
                WindowsAndExteriorDoorsModel windowsAndExteriorDoorsModel =
                    WindowsAndExteriorDoorsModel(
                  name: name,
                  description: widget.description,
                  unit: widget.unit,
                  quantity: widget.quantity,
                  laborHours1: widget.laborHours1,
                  laborHours2: widget.laborHours2,
                  laborCost: widget.laborCost,
                  material: widget.material1,
                  materials: widget.material2,
                  totalPrice: widget.totalPrice,
                );
                writeJson(windowsAndExteriorDoorsModel);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Data has been saved as $name.json')));
              },
              child: Text("Save to JSON"),
              heroTag: "btn1",
            ),
            FloatingActionButton(
                child: Text("Load data"),
                heroTag: "btn2",
                onPressed: () {
                  openLoadingDialog().then((value) {
                    if (value == null || value.isEmpty) return;
                    setState(() {
                      this.name = value;
                    });
                    readJsonFile(name).then(
                      (value) {
                        WindowsAndExteriorDoorsModel
                            windowsAndExteriorDoorsModel =
                            WindowsAndExteriorDoorsModel.fromJson(value);
                        setState(() {
                          widget.description =
                              windowsAndExteriorDoorsModel.description;
                          widget.unit = windowsAndExteriorDoorsModel.unit;
                          widget.quantity =
                              windowsAndExteriorDoorsModel.quantity;
                          widget.laborHours1 =
                              windowsAndExteriorDoorsModel.laborHours1;
                          widget.laborHours2 =
                              windowsAndExteriorDoorsModel.laborHours2;
                          widget.laborCost =
                              windowsAndExteriorDoorsModel.laborCost;
                          widget.material1 =
                              windowsAndExteriorDoorsModel.material;
                          widget.material2 =
                              windowsAndExteriorDoorsModel.materials;
                          widget.totalPrice =
                              windowsAndExteriorDoorsModel.totalPrice;
                          calculateCalculationQuantity();
                          setInitialValues();
                          updateTotalSum();
                        });
                      },
                    );
                  });
                }),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                dataRowMaxHeight: double.infinity,
                dataRowMinHeight: 60,
                columns: calculationColumns, // Define your columns here
                rows: calculationRows,
              ),
            )
          ],
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
