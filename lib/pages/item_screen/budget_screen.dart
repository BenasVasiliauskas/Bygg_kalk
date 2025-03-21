import 'package:cost_calculator/constants/empty_models.dart';
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/functions/load_project_from_json.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cost_calculator/constants/budget_constants.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';

class BudgetScreen extends StatefulWidget {
  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    super.dispose();
  }

  double sumWasteRemoval = calculateTotalWaste(wasteData);
  double sumMaterialCosts =
      totalMaterialCosts.reduce((value, element) => value + element);
  double sumLaborCosts =
      totalLaborCosts.reduce((value, element) => value + element);
  double sumTotalHours = totalHours.reduce((value, element) => value + element);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return homePage();
          }),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text("Budget screen"),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(70.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ["json"],
                          );
                          if (result != null) {
                            final file = result.files.first;
                            final fileName = file.name;
                            var data = await readJsonFileSelected(fileName);

                            await loadProject(fileName, data, emptyDeckModel);
                            await loadProject(
                                fileName, data, emptyFlooringModel);
                            await loadProject(
                                fileName, data, emptyInnerDoorModel);
                            await loadProject(
                                fileName, data, emptyInnerStairsModel);
                            await loadProject(
                                fileName, data, emptyInnerWallModel);
                            await loadProject(
                                fileName, data, emptyOuterRoofModel);
                            await loadProject(
                                fileName, data, emptyOuterWallModel);
                            await loadProject(
                                fileName, data, emptyScaffoldingModel);
                            await loadProject(
                                fileName, data, emptySupportSystemModel);
                            await loadProject(
                                fileName, data, emptyTerraceModel);
                            await loadProject(
                                fileName, data, emptyWindowsExteriorDoorsModel);

                            print("Project loaded");
                            print(exteriorWallData);
                            print(outerRoofData);
                            print(flooringData);
                            print(innerStairsData);
                            print(scaffoldingData);
                            print(terraceData);
                            print(deckData);
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: Text(
                          "Load a project",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        drawer: CustomDrawer(),

        // A vertical scroll for the entire screen content.
        body: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // align flush-left
            children: [
              // ────────────────────────────────────────────────────────────────
              // 1) First DataTable with horizontal scroll
              // ────────────────────────────────────────────────────────────────
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                child: DataTable(
                  // Remove or reduce spacing to keep columns tight
                  columnSpacing: 0,
                  horizontalMargin: 0,
                  columns: [
                    DataColumn(
                      label: SizedBox(
                        width: 70,
                        child: Text('Cost type'),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 50,
                        child: Text('Hours', softWrap: true),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 75,
                        child: Text('Labor Costs (exl. VAT)', softWrap: true),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 75,
                        child:
                            Text('Material Costs (exl. VAT)', softWrap: true),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 75,
                        child: Text('Total price (exl. VAT)', softWrap: true),
                      ),
                    ),
                  ],
                  rows: List.generate(calculatedNamesOrder.length, (index) {
                    bool isLastRow = index == calculatedNamesOrder.length - 1;

                    final double labor = isLastRow
                        ? sumLaborCosts + (sumLaborCosts * timeCoefficient)
                        : totalLaborCosts[index] +
                            (totalLaborCosts[index] * timeCoefficient);

                    final double material = isLastRow
                        ? sumMaterialCosts + (sumMaterialCosts * markup)
                        : totalMaterialCosts[index] +
                            (totalMaterialCosts[index] * markup);

                    final double total = labor + material;

                    return DataRow(
                      cells: [
                        // "Cost type"
                        DataCell(
                          SizedBox(
                            width: 100,
                            child: Text(
                              calculatedNamesOrder[index],
                              style: isLastRow
                                  ? TextStyle(fontWeight: FontWeight.bold)
                                  : null,
                            ),
                          ),
                        ),
                        // "Hours"
                        DataCell(
                          SizedBox(
                            width: 70,
                            child: Text(
                              (isLastRow
                                      ? (sumTotalHours +
                                          (sumTotalHours * timeCoefficient))
                                      : (totalHours[index] +
                                          (totalHours[index] *
                                              timeCoefficient)))
                                  .toStringAsFixed(2),
                              style: isLastRow
                                  ? TextStyle(fontWeight: FontWeight.bold)
                                  : null,
                            ),
                          ),
                        ),
                        // "Labor Costs"
                        DataCell(
                          SizedBox(
                            width: 70,
                            child: Text(
                              labor.toStringAsFixed(2),
                              style: isLastRow
                                  ? TextStyle(fontWeight: FontWeight.bold)
                                  : null,
                            ),
                          ),
                        ),
                        // "Material Costs"
                        DataCell(
                          SizedBox(
                            width: 70,
                            child: Text(
                              material.toStringAsFixed(2),
                              style: isLastRow
                                  ? TextStyle(fontWeight: FontWeight.bold)
                                  : null,
                            ),
                          ),
                        ),
                        // "Total price (exl. VAT)"
                        DataCell(
                          SizedBox(
                            width: 100,
                            child: Text(
                              total.toStringAsFixed(2),
                              style: isLastRow
                                  ? TextStyle(fontWeight: FontWeight.bold)
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),

              SizedBox(height: 16),

              // ────────────────────────────────────────────────────────────────
              // 2) Second DataTable with horizontal scroll
              // ────────────────────────────────────────────────────────────────
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                child: DataTable(
                  columnSpacing: 0,
                  horizontalMargin: 0,
                  columns: [
                    DataColumn(
                      label: SizedBox(width: 70, child: Text('')),
                    ),
                    DataColumn(
                      label: SizedBox(width: 210, child: Text('')),
                    ),
                    DataColumn(
                      label: SizedBox(width: 70, child: Text('')),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Site cost",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(Text("")),
                        DataCell(
                          Text(
                            (costs *
                                        (sumLaborCosts +
                                            (sumLaborCosts * timeCoefficient)))
                                    .toStringAsFixed(2) +
                                "\kr",
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Total material cost (excl. VAT)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(Text("")),
                        DataCell(
                          Text(sumMaterialCosts.toStringAsFixed(2) + "kr."),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Waste removal (excl. VAT)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(Text("")),
                        DataCell(
                          Text(
                            (sumWasteRemoval + sumWasteRemoval * markup)
                                    .toStringAsFixed(2) +
                                "kr.",
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Materials delivery (excl. VAT)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(Text("")),
                        DataCell(
                          Text(
                            (sumMaterialCosts * 0.05).toStringAsFixed(2) +
                                "kr.",
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Total price (excluding VAT)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(Text("")),
                        DataCell(
                          Text(
                            (sumLaborCosts +
                                        (costs * sumLaborCosts) +
                                        sumMaterialCosts +
                                        sumWasteRemoval +
                                        sumMaterialCosts * 0.05)
                                    .toStringAsFixed(2) +
                                "\kr",
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text("VAT")),
                        DataCell(Text("")),
                        DataCell(
                          Text(
                            (((sumLaborCosts +
                                                (costs * sumLaborCosts) +
                                                sumMaterialCosts +
                                                sumWasteRemoval +
                                                sumMaterialCosts * 0.05) *
                                            1.25) -
                                        (sumLaborCosts +
                                            (costs * sumLaborCosts) +
                                            sumMaterialCosts +
                                            sumWasteRemoval +
                                            sumMaterialCosts * 0.05))
                                    .toStringAsFixed(2) +
                                "\kr",
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Total price (including VAT)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(Text("")),
                        DataCell(
                          Text(
                            ((sumLaborCosts +
                                            (costs * sumLaborCosts) +
                                            sumMaterialCosts +
                                            sumWasteRemoval +
                                            sumMaterialCosts * 0.05) *
                                        1.25)
                                    .toStringAsFixed(2) +
                                "\kr",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
