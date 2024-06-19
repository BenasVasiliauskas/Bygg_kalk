import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:flutter/material.dart';
import 'package:cost_calculator/constants/norw_budget_constants.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';

class NorwBudgetScreen extends StatefulWidget {
  @override
  State<NorwBudgetScreen> createState() => _NorwBudgetScreenState();
}

class _NorwBudgetScreenState extends State<NorwBudgetScreen> {
  final ScrollController _scrollController = ScrollController();

  double sumMaterialCosts =
      totalMaterialCosts.reduce((value, element) => value + element);
  double sumLaborCosts =
      totalLaborCosts.reduce((value, element) => value + element);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budsjettskjermen'),
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
                        'Name',
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
                            totalHours[index].toStringAsFixed(2),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: 70,
                          child: Text(
                            totalLaborCosts[index].toStringAsFixed(2),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: 70,
                          child: Text(
                            totalMaterialCosts[index].toStringAsFixed(2),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: 100,
                          child: Text(
                            budgetSums[index].toStringAsFixed(2),
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
                          "Tidsfaktor",
                        ),
                      ),
                      DataCell(
                        Text(
                          "",
                        ),
                      ),
                      DataCell(
                        Text(timeCoefficient.toString()),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          "Material påslag %",
                        ),
                      ),
                      DataCell(
                        Text(
                          "",
                        ),
                      ),
                      DataCell(
                        Text(
                          markup.toString(),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          "Rigg og drift av byggeplass %",
                        ),
                      ),
                      DataCell(
                        Text(
                          "",
                        ),
                      ),
                      DataCell(
                        Text(
                          costs.toString(),
                        ),
                      ),
                    ],
                  ),
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
    );
  }
}
