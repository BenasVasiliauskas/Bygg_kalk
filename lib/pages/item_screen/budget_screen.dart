import 'dart:io';

import 'package:cost_calculator/constants/empty_models.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/functions/load_project_from_json.dart';
import 'package:cost_calculator/functions/save_project_to_json.dart';
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
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
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
                    padding: const EdgeInsets.all(12.0),
                    child: TextButton(
                      onPressed: () async {
                        if (File("a.json").existsSync()) {
                          File("a.json").deleteSync();
                        }
                        await writeJsonArrayStart("a");
                        await saveEngProjectToJSON("a");
                        await writeJsonArrayEnd("a");
                      },
                      child: Text("Save project"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ["json"],
                        );
                        if (result != null) {
                          PlatformFile file = result.files.first;
                          final fileName = file.name;
                          var data = await readJsonFileSelected(fileName);
                          await loadProject(fileName, data, emptyDeckModel);
                          await loadProject(fileName, data, emptyFlooringModel);
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
                          await loadProject(fileName, data, emptyTerraceModel);
                          await loadProject(
                              fileName, data, emptyWindowsExteriorDoorsModel);
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Text("Load a project"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DataTable(
                  columnSpacing: 10,
                  columns: [
                    DataColumn(
                      label: SizedBox(
                        width: 70,
                        child: Text(
                          'Cost type',
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 50,
                        child: Text(
                          'Total Hours',
                          softWrap: true,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 50,
                        child: Text(
                          'Labor Costs',
                          softWrap: true,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 55,
                        child: Text(
                          'Material Costs',
                          softWrap: true,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 50,
                        child: Text(
                          'Budget Sum',
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                  rows: List.generate(calculatedNamesOrder.length, (index) {
                    return DataRow(
                      cells: [
                        DataCell(
                          SizedBox(
                            width: 100,
                            child: Text(
                              calculatedNamesOrder[index],
                            ),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: 70,
                            child: Text(
                              index == calculatedNamesOrder.length - 1
                                  ? (totalHours.reduce((value, element) =>
                                              value + element) *
                                          timeCoefficient)
                                      .toStringAsFixed(2)
                                  : totalHours[index].toStringAsFixed(2),
                            ),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: 70,
                            child: Text(
                              index == calculatedNamesOrder.length - 1
                                  ? sumLaborCosts.toStringAsFixed(2)
                                  : totalLaborCosts[index].toStringAsFixed(2),
                            ),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: 70,
                            child: Text(
                              index == calculatedNamesOrder.length - 1
                                  ? sumMaterialCosts.toStringAsFixed(2)
                                  : totalMaterialCosts[index]
                                      .toStringAsFixed(2),
                            ),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: 100,
                            child: Text(
                              index == calculatedNamesOrder.length - 1
                                  ? budgetSums
                                      .reduce(
                                          (value, element) => value + element)
                                      .toStringAsFixed(2)
                                  : budgetSums[index].toStringAsFixed(2),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                DataTable(
                  columnSpacing: 10,
                  columns: [
                    DataColumn(
                      label: SizedBox(
                        width: 70,
                        child: Text(
                          '',
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 210,
                        child: Text(
                          '',
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 70,
                        child: Text(
                          '',
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Site setup and operation",
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
                        DataCell(
                          Text(
                            (costs * sumLaborCosts).toStringAsFixed(2) + "\$",
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Total material cost",
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
                        DataCell(
                          Text(sumMaterialCosts.toStringAsFixed(2) + "\$"),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Waste removal",
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
                        DataCell(
                          Text((sumWasteRemoval + sumWasteRemoval * costs)
                                  .toStringAsFixed(2) +
                              "\$"),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Materials transport",
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
                        DataCell(
                          Text(
                            (sumMaterialCosts * 0.05).toStringAsFixed(2) + "\$",
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Total costs (excluding VAT)",
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
                        DataCell(
                          Text(
                            (sumLaborCosts +
                                        sumMaterialCosts +
                                        (costs * sumLaborCosts))
                                    .toStringAsFixed(2) +
                                "\$",
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "VAT",
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
                        DataCell(
                          Text(
                            (((sumLaborCosts +
                                                sumMaterialCosts +
                                                (costs * sumLaborCosts)) *
                                            1.25) -
                                        (sumLaborCosts +
                                            sumMaterialCosts +
                                            (costs * sumLaborCosts)))
                                    .toStringAsFixed(2) +
                                "\$",
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Total costs (including VAT)",
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
                        DataCell(
                          Text(
                            ((sumLaborCosts +
                                            sumMaterialCosts +
                                            (costs * sumLaborCosts)) *
                                        1.25)
                                    .toStringAsFixed(2) +
                                "\$",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
