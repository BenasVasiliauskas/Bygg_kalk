import 'package:cost_calculator/constants/empty_models.dart';
import 'package:cost_calculator/functions/norw_load_project_from_json.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cost_calculator/constants/norw_budget_constants.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';

class PolBudgetScreen extends StatefulWidget {
  @override
  State<PolBudgetScreen> createState() => _PolBudgetScreenState();
}

class _PolBudgetScreenState extends State<PolBudgetScreen> {
  final ScrollController _scrollController = ScrollController();

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
              Text('Budsjettskjermen'),
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

                      await norwLoadProject(fileName, data, emptyDeckModel);
                      await norwLoadProject(fileName, data, emptyFlooringModel);
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
                          fileName, data, emptyParquetAndLaminateModel);
                      await norwLoadProject(
                          fileName, data, emptyScaffoldingModel);
                      await norwLoadProject(
                          fileName, data, emptySupportSystemModel);
                      await norwLoadProject(fileName, data, emptyTerraceModel);
                      await norwLoadProject(
                          fileName, data, emptyWindowsExteriorDoorsModel);
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Text("Last inn et prosjekt"),
                ),
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
                          'Kostnadsart',
                        ),
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
                                  ? totalHours
                                      .reduce(
                                          (value, element) => value + element)
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
                            "Rigg og drift av byggeplass",
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
                        DataCell(
                          Text(
                            (costs * sumLaborCosts).toStringAsFixed(2),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Sum materialkostnad",
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
                        DataCell(
                          Text(sumMaterialCosts.toStringAsFixed(2)),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Avfall flytting",
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
                        DataCell(
                          Text("-"),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Materialer frakt",
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
                        DataCell(
                          Text(
                            (sumMaterialCosts * 0.05).toStringAsFixed(2),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Totale kostnader, (eksl. mva)",
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
                                .toStringAsFixed(2),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Mva",
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
                                .toStringAsFixed(2),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Totale kostnader, (inkl. mva)",
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
                                .toStringAsFixed(2),
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
