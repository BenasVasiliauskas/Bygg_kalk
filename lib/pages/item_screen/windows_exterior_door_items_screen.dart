import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import '../../constants/budget_constants.dart';
import '../../constants/innerwall_constants.dart';
import '../../functions/create_worksheet.dart';

class WindowsExteriorDoorItemsScreen extends StatefulWidget {
  final String name;
  final List<String> description;
  final List<String> unit;
  final List<double> quantity;
  final List<double> laborHours1;
  final List<double> laborHours2;
  final List<double> laborCost;
  final List<double> material1;
  final List<double> material2;
  final List<double> totalPrice;

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

  //
  TextEditingController quantityCalculationControllers =
      TextEditingController();
  TextEditingController hourlyRateConstructionRemodelingController =
      TextEditingController();
  //
  List<TextEditingController> customColumnControllers = [];

  void initialiseEmptyList() {
    emptyCustomList = createList(widget.description.length);
  }

  double calculationQuantity = 1;
  double hourlyRateConstructionRemodeling = 550;
  double hourlyRateDemolition = 550;
  double hourlyRatePainting = 500;
  //used in Sparkling strimmel, flekksp.1, skjøtsp. 2, helsp.1, grunning. 2 strøk maling
  double calculateCostPainting(int index) {
    double laborCost = widget.laborHours2[index];
    return laborCost * hourlyRatePainting;
  }

  double calculateMaterialQuantity(int index) {
    double quantity = widget.quantity[index];
    return quantity * calculationQuantity;
  }

  double calculateWorkHours2(int index) {
    if (customColumn) {
      double laborHours1 = emptyCustomList[index];
      return laborHours1 * calculationQuantity;
    } else {
      double laborHours1 = widget.laborHours1[index];
      return laborHours1 * calculationQuantity;
    }
  }

  double calculateJobCost(int index) {
    double laborHours2 = widget.laborHours2[index];
    return laborHours2 * hourlyRateConstructionRemodeling;
  }

  double calculateMaterialCost(int index) {
    double material1 = widget.material1[index];
    return material1 * calculationQuantity;
  }

  double calculateTotalPrice(int index) {
    double jobCost = widget.laborCost[index];
    return jobCost + widget.material1[index] * calculationQuantity;
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

    // Create the "Total Sum" row
    DataRow totalSumRow = DataRow(
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
          widget.laborHours2[i].toStringAsFixed(2);
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
  Widget build(BuildContext context) {
    List<DataColumn> calculationColumns = [
      DataColumn(
          label: Text(
              'Calculation Quantity')), //DataColumn(label: Text('Mengde')),

      DataColumn(label: Text('Hourly Rate - Construction/Remodeling')),
      //DataColumn(label: Text('Time pris. Ny bygg og ombygging.')),

      DataColumn(label: Text('Unit')),
      //DataColumn(label: Text('Enhet')),
    ];

    List<DataRow> calculationRows = [
      DataRow(
        cells: [
          DataCell(
            TextField(
              controller: quantityCalculationControllers,
              decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 218, 128, 122),
                  filled: true),
              onChanged: (value) {
                // Handle changes to the quantity
                calculationQuantity = double.parse(value);
                //recalculate all fields where calculationQuantity is used e.x materialQuantity ...
                for (int i = 0; i < widget.description.length; i++) {
                  widget.laborHours2[i] = calculateWorkHours2(i);
                  laborHours2Controllers[i].text =
                      calculateWorkHours2(i).toStringAsFixed(2);

                  widget.laborCost[i] = calculateJobCost(i);
                  laborCostControllers[i].text =
                      calculateJobCost(i).toStringAsFixed(2);

                  // Recalculate and update the labor cost when quantity changes
                  if (widget.description[i] ==
                      "Sparkling strimmel, flekksp.1, skjøtsp. 2, helsp.1, grunning. 2 strøk maling") {
                    widget.laborCost[i] = calculateCostPainting(i);
                    laborCostControllers[i].text =
                        calculateCostPainting(i).toStringAsFixed(2);
                  } else {
                    widget.laborCost[i] = calculateJobCost(i);
                    laborCostControllers[i].text =
                        calculateJobCost(i).toStringAsFixed(2);
                  }

                  // Recalculate and update the material 2 when quantity changes
                  widget.material2[i] = calculateMaterialCost(i);
                  material2Controllers[i].text =
                      calculateMaterialCost(i).toStringAsFixed(2);

                  // Recalculate and update the total price when quantity changes
                  widget.totalPrice[i] = calculateTotalPrice(i);
                  totalPriceControllers[i].text =
                      calculateTotalPrice(i).toStringAsFixed(2);

                  //Rebuild the data table
                  rebuildDataTable();
                }
              },
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true), // Allow decimal numbers
            ),
          ),
          DataCell(TextField(
            controller: hourlyRateConstructionRemodelingController,
            onChanged: (value) {
              hourlyRateConstructionRemodeling = double.parse(value);
              for (int i = 0; i < widget.description.length; i++) {
                //
                emptyCustomList[i] =
                    double.parse(customColumnControllers[i].text);
                customColumnControllers[i].text =
                    emptyCustomList[i].toStringAsFixed(2);
                //

                // Recalculate and update the labor cost when hourlyRateConstructionRemodeling changes
                widget.laborCost[i] = calculateJobCost(i);
                laborCostControllers[i].text =
                    calculateJobCost(i).toStringAsFixed(2);

                // Recalculate and update the total price when hourlyRateConstructionRemodeling changes
                widget.totalPrice[i] = calculateTotalPrice(i);
                totalPriceControllers[i].text =
                    calculateTotalPrice(i).toStringAsFixed(2);

                //Rebuild the data table
                rebuildDataTable();
              }
            },
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          )),
          DataCell(
            Container(
              width: 200, // Set a fixed width or use flexible width
              child: Text(
                "kr. ",
              ),
            ),
          ),
        ],
      ),
    ];

    List<DataColumn> columns = [
      DataColumn(
        label: SizedBox(
          width: 200, // Set the width as needed
          child: Text('Description'), //Text('Beskrivelse'),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: 100, // Set the width as needed
          child: Text('Unit'), //child: Text('Enhet'),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: 100, // Set the width as needed
          child: Text('Quantity'), //child: Text('Mengde'),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: 100, // Set the width as needed
          child: Text('Hours', //child: Text('Enh. tid.'),
              style:
                  TextStyle(color: customColumn ? Colors.grey : Colors.black)),
        ),
      ),
      DataColumn(
          label: SizedBox(
        width: customColumn ? 100 : 35, // Set the width as needed
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
          ),
          onPressed: () {
            setState(() {
              customColumn = !customColumn;
              updateTotalSum();
            });
          },
          child: customColumn ? Text("Custom hours") : Text("+"),
        ),
      )),
      DataColumn(
        label: SizedBox(
          width: 100, // Set the width as needed
          child: Text('Hours2'), //child: Text('Sum. tid.'),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: 100, // Set the width as needed
          child: Text('Job cost'), // child: Text('Arb.pris'),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: 100, // Set the width as needed
          child: Text('Material'), //Text('Enh. mater.'),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: 100, // Set the width as needed
          child: Text('Material cost'), // Text('Sum. material'),
        ),
      ),
      DataColumn(
        label: SizedBox(
          width: 100, // Set the width as needed
          child: Text('Total price'), //Text('Total pris'),
        ),
      ),
    ];

    List<DataRow> rows = [];

    for (int i = 0; i < widget.description.length; i++) {
      rows.add(
        DataRow(
          cells: [
            DataCell(
              Container(
                width: 200, // Set the width as needed
                child: Text(
                  widget.description[i],
                  maxLines: 3, // Set the maximum number of lines
                  overflow:
                      TextOverflow.ellipsis, // Allow text to overflow and wrap
                ),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: Text(
                  widget.unit[i],
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataCell(
              TextField(
                readOnly: true,
                controller: quantityControllers[i],
              ),
            ),

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
                style:
                    TextStyle(color: customColumn ? Colors.black : Colors.grey),
                readOnly: !customColumn,
                controller: customColumnControllers[i],
                onChanged: (value) {
                  double parsedValue = double.parse(value);
                  emptyCustomList[i] = double.parse(parsedValue
                      .toStringAsFixed(2)); // Format to 2 decimal places
                  // Recalculate and update the labor hours 2 when labor hours 1 changes need changes

                  widget.laborHours2[i] = calculateWorkHours2(i);
                  laborHours2Controllers[i].text =
                      calculateWorkHours2(i).toStringAsFixed(2);

                  // Recalculate and update the labor cost when labor hours 2 changes
                  widget.laborCost[i] = calculateJobCost(i);
                  laborCostControllers[i].text =
                      calculateJobCost(i).toStringAsFixed(2);

                  // Recalculate and update the total price when labor hours 2 changes
                  widget.totalPrice[i] = calculateTotalPrice(i);
                  totalPriceControllers[i].text =
                      calculateTotalPrice(i).toStringAsFixed(2);

                  //total sum doesnt get updated
                  updateTotalSum();
                },
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true), // Allow decimal numbers
              ),
            ),
            DataCell(
              TextField(
                readOnly: true,
                controller: laborHours2Controllers[i],
                onChanged: (value) {
                  // Handle changes to labor hours 2
                  double parsedValue = double.parse(value);
                  widget.laborHours2[i] = double.parse(parsedValue
                      .toStringAsFixed(2)); // Format to 2 decimal places

                  // Recalculate the labor cost when labor hours 2 changes
                  double updatedLaborCost = calculateJobCost(i);
                  widget.laborCost[i] = double.parse(updatedLaborCost
                      .toStringAsFixed(2)); // Format to 2 decimal places
                },
              ),
            ),
            DataCell(
              TextField(
                controller: laborCostControllers[i],
                readOnly: true,
                onChanged: (value) {
                  // Handle changes to labor cost
                  widget.laborCost[i] = double.parse(value);
                },
              ),
            ),
            DataCell(
              TextField(
                controller: material1Controllers[i],
                onChanged: (value) {
                  // Handle changes to material 1
                  double parsedValue = double.parse(value);
                  widget.material1[i] = double.parse(parsedValue
                      .toStringAsFixed(2)); // Format to 2 decimal places

                  // Recalculate and update the material 2 when material 1 changes
                  double updatedMaterial2 = calculateMaterialCost(i);
                  widget.material2[i] = updatedMaterial2;
                  material2Controllers[i].text =
                      updatedMaterial2.toStringAsFixed(2);

                  // Recalculate total price
                  double updatedTotalPrice = calculateTotalPrice(i);
                  widget.totalPrice[i] = updatedTotalPrice;
                  totalPriceControllers[i].text =
                      updatedTotalPrice.toStringAsFixed(2);
                  // Format to 2 decimal places

                  rebuildDataTable();
                },
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true), // Allow decimal numbers
              ),
            ),
            DataCell(
              TextField(
                readOnly: true,
                controller: material2Controllers[i],
                onChanged: (value) {
                  // Handle changes to material 2
                  widget.material2[i] = double.parse(value);
                  material2Controllers[i].text =
                      widget.material2[i].toStringAsFixed(2);
                },
              ),
            ),
            DataCell(
              TextField(
                controller: totalPriceControllers[i],
                onChanged: (value) {
                  // Handle changes to the total price
                  widget.totalPrice[i] = double.parse(value);
                  totalPriceControllers[i].text =
                      widget.totalPrice[i].toStringAsFixed(2);
                },
                readOnly: true,
              ),
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

    addHours(widget.name, totalLaborHours2);
    addLaborCosts(widget.name, emptyCustomList.sum);
    addMaterialCosts(widget.name, totalMaterial2);
    addBudgetSum(widget.name, totalTotalPrice);

// Create the "Total Sum" row
    DataRow totalSumRow = DataRow(
      cells: [
        DataCell(
          Container(
            width: 200,
            child: Text('Total Sum'),
          ),
        ),
        DataCell(
          Container(
            width: 100,
            child: Text(""),
          ),
        ),
        DataCell(
          Container(
            width: 150,
            child: Text(""),
          ),
        ),
        DataCell(
          Container(
            width: 100,
            child:
                Text(customColumn ? '' : totalLaborHours1.toStringAsFixed(2)),
          ),
        ),
        DataCell(Container(
          width: 100,
          child: Text(
            // calc custom hours
            customColumn ? emptyCustomList.sum.toStringAsFixed(2) : '',
            //need to recalc labor cost and use that in total sum if enabled
          ),
        )),
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
}
