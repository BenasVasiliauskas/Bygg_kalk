import 'package:cost_calculator/constants/empty_models.dart';
import 'package:cost_calculator/data/lithuanian%20data%20folder/lith_data.dart';
import 'package:cost_calculator/functions/lit_load_project_from_json.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cost_calculator/constants/lit_budget_constants.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';

class LitBudgetScreen extends StatefulWidget {
  @override
  State<LitBudgetScreen> createState() => _LitBudgetScreenState();
}

class _LitBudgetScreenState extends State<LitBudgetScreen> {
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

  double sumWasteRemoval = calculateTotalWaste(litWasteData);

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
              Text('Biudžeto ekranas'),
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

                      await litLoadProject(fileName, data, emptyDeckModel);
                      await litLoadProject(fileName, data, emptyFlooringModel);
                      await litLoadProject(fileName, data, emptyInnerDoorModel);
                      await litLoadProject(
                          fileName, data, emptyInnerStairsModel);
                      await litLoadProject(fileName, data, emptyInnerWallModel);
                      await litLoadProject(fileName, data, emptyOuterRoofModel);
                      await litLoadProject(fileName, data, emptyOuterWallModel);
                      await litLoadProject(
                          fileName, data, emptyScaffoldingModel);
                      await litLoadProject(
                          fileName, data, emptySupportSystemModel);
                      await litLoadProject(fileName, data, emptyTerraceModel);
                      await litLoadProject(
                          fileName, data, emptyWindowsExteriorDoorsModel);
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Text("Įkelti projektą"),
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
                  columnSpacing: 56,
                  columns: [
                    DataColumn(
                      label: SizedBox(
                        width: 70,
                        child: Text(
                          'Išlaidų tipas',
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 80,
                        child: Text(
                          'Bendras valandų skaičius',
                          softWrap: true,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 80,
                        child: Text(
                          'Darbo sąnaudos',
                          softWrap: true,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 80,
                        child: Text(
                          'Medžiagų sąnaudos',
                          softWrap: true,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 85,
                        child: Text(
                          'Biudžeto suma',
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
                                  ? (sumTotalHours * timeCoefficient)
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
                                  ? (sumLaborCosts * timeCoefficient)
                                      .toStringAsFixed(2)
                                  : totalLaborCosts[index].toStringAsFixed(2),
                            ),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: 70,
                            child: Text(
                              index == calculatedNamesOrder.length - 1
                                  ? (sumMaterialCosts * markup)
                                      .toStringAsFixed(2)
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
                                  ? (sumTotalHours * timeCoefficient +
                                          sumLaborCosts * timeCoefficient +
                                          sumMaterialCosts * markup)
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
                            "Tvirtinimo darbai ir darbai statybvietėje",
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
                        DataCell(
                          Text(
                            (costs * sumLaborCosts).toStringAsFixed(2) + "kr.",
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Bendra medžiagų kaina",
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
                        DataCell(
                          Text(sumMaterialCosts.toStringAsFixed(2) + "kr."),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Atliekų išvežimas",
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
                              "kr."),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Medžiagų gabenimas",
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
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
                            "Iš viso išlaidų (be PVM)",
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
                                "kr.",
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "PVM",
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
                                "kr.",
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Iš viso išlaidų (su PVM)",
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
                                "kr.",
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
