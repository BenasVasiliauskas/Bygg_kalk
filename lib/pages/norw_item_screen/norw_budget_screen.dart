import 'package:cost_calculator/constants/empty_models.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/functions/norw_load_project_from_json.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cost_calculator/constants/norw_budget_constants.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';

class NorwBudgetScreen extends StatefulWidget {
  @override
  State<NorwBudgetScreen> createState() => _NorwBudgetScreenState();
}

class _NorwBudgetScreenState extends State<NorwBudgetScreen> {
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

  double sumWasteRemoval = calculateTotalWaste(norwWasteData);
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
              Text('Budsjettskjermen'),
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
                        final data = await readJsonFileSelected(fileName);

                        await norwLoadProject(fileName, data, emptyDeckModel);
                        await norwLoadProject(
                            fileName, data, emptyFlooringModel);
                        await norwLoadProject(
                            fileName, data, emptyInnerDoorModel);
                        await norwLoadProject(
                            fileName, data, emptyInnerStairsModel);
                        await norwLoadProject(
                            fileName, data, emptyInnerWallModel);
                        await norwLoadProject(
                            fileName, data, emptyOuterRoofModel);
                        await norwLoadProject(
                            fileName, data, emptyOuterWallModel);
                        await norwLoadProject(
                            fileName, data, emptyScaffoldingModel);
                        await norwLoadProject(
                            fileName, data, emptySupportSystemModel);
                        await norwLoadProject(
                            fileName, data, emptyTerraceModel);
                        await norwLoadProject(
                            fileName, data, emptyWindowsExteriorDoorsModel);
                      } else {
                        // User canceled the picker
                      }
                    },
                    child: Text(
                      "Last inn et prosjekt",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: CustomDrawer(),

        // 1) A vertical scroll for the entire content:
        body: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // flush-left
            children: [
              // ────────────────────────────────────────────────────────────────
              // 2) First DataTable (horizontal scroll)
              // ────────────────────────────────────────────────────────────────
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                child: DataTable(
                  columnSpacing: 0,
                  horizontalMargin: 0,
                  columns: [
                    DataColumn(
                      label: SizedBox(
                        width: 70,
                        child: Text('Kostnadsart'),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 80,
                        child: Text(
                          'Totalt antall timer',
                          softWrap: true,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 80,
                        child: Text(
                          'Arbeidskostnader',
                          softWrap: true,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 80,
                        child: Text(
                          'Materialkostnade',
                          softWrap: true,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 85,
                        child: Text(
                          'Budsjettsum',
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                  rows: List.generate(calculatedNamesOrder.length, (index) {
                    final bool isLastRow =
                        index == calculatedNamesOrder.length - 1;

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
              // 3) Second DataTable (horizontal scroll)
              // ────────────────────────────────────────────────────────────────
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                child: DataTable(
                  columnSpacing: 0,
                  horizontalMargin: 0,
                  columns: [
                    DataColumn(
                      label: SizedBox(
                        width: 70,
                        child: Text(''),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 210,
                        child: Text(''),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 70,
                        child: Text(''),
                      ),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Rigg og drift av byggeplass",
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
                            "Sum materialkostnad",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(Text("")),
                        DataCell(
                          Text(sumMaterialCosts.toStringAsFixed(2) + "\kr"),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Avfall flytting",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(Text("")),
                        DataCell(
                          Text(
                            (sumWasteRemoval + sumWasteRemoval * costs)
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
                            "Materialer frakt",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(Text("")),
                        DataCell(
                          Text(
                            (sumMaterialCosts * 0.05).toStringAsFixed(2) +
                                "\kr",
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Totale kostnader, (eksl. mva)",
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
                        DataCell(Text("Mva")),
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
                            "Totale kostnader, (inkl. mva)",
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
