import 'package:cost_calculator/constants/empty_models.dart';
import 'package:cost_calculator/constants/pol_budget_constants.dart';
import 'package:cost_calculator/data/polish_data_folder/polish_data.dart';
import 'package:cost_calculator/functions/pol_load_project_from_json.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';

class PolBudgetScreen extends StatefulWidget {
  @override
  State<PolBudgetScreen> createState() => _PolBudgetScreenState();
}

class _PolBudgetScreenState extends State<PolBudgetScreen> {
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

  double sumWasteRemoval = calculateTotalWaste(polWasteData);

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
              Text('Ekran budżetu'),
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

                      await polLoadProject(fileName, data, emptyDeckModel);
                      await polLoadProject(fileName, data, emptyFlooringModel);
                      await polLoadProject(fileName, data, emptyInnerDoorModel);
                      await polLoadProject(
                          fileName, data, emptyInnerStairsModel);
                      await polLoadProject(fileName, data, emptyInnerWallModel);
                      await polLoadProject(fileName, data, emptyOuterRoofModel);
                      await polLoadProject(fileName, data, emptyOuterWallModel);
                      await polLoadProject(
                          fileName, data, emptyScaffoldingModel);
                      await polLoadProject(
                          fileName, data, emptySupportSystemModel);
                      await polLoadProject(fileName, data, emptyTerraceModel);
                      await polLoadProject(
                          fileName, data, emptyWindowsExteriorDoorsModel);
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Text("Załaduj projekt"),
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
                  columnSpacing: 40,
                  columns: [
                    DataColumn(
                      label: SizedBox(
                        width: 70,
                        child: Text(
                          'Rodzaj kosztu',
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 80,
                        child: Text(
                          'Całkowita liczba godzin',
                          softWrap: true,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 80,
                        child: Text(
                          'Koszty pracy',
                          softWrap: true,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 80,
                        child: Text(
                          'Koszty materiałów',
                          softWrap: true,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: SizedBox(
                        width: 85,
                        child: Text(
                          'Suma budżetu',
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                  rows: List.generate(calculatedNamesOrder.length, (index) {
                    bool isLastRow = index == calculatedNamesOrder.length - 1;

                    final double labor =
                        (index == calculatedNamesOrder.length - 1)
                            ? sumLaborCosts + (sumLaborCosts * timeCoefficient)
                            : totalLaborCosts[index] +
                                (totalLaborCosts[index] * timeCoefficient);

                    final double material =
                        (index == calculatedNamesOrder.length - 1)
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
                              (index == calculatedNamesOrder.length - 1
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
                            "Olinowanie i operacje na miejscu",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(
                          Text(
                            "",
                          ),
                        ),
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
                            "Całkowity koszt materiałów",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                            "Usuwanie odpadów",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                            "Wysyłka materiałów",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                            "Koszty całkowite (bez VAT)",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                            "Koszty całkowite (z VAT)",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
