import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:flutter/material.dart';
import 'package:cost_calculator/constants/budget_constants.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';

class BudgetScreen extends StatefulWidget {
  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  final ScrollController _scrollController = ScrollController();

  double sumMaterialCosts =
      totalMaterialCosts.reduce((value, element) => value + element);
  double sumLaborCosts =
      totalLaborCosts.reduce((value, element) => value + element);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Screen'),
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
                                ? totalHours
                                    .reduce((value, element) => value + element)
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
                                : totalMaterialCosts[index].toStringAsFixed(2),
                          ),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: 100,
                          child: Text(
                            index == calculatedNamesOrder.length - 1
                                ? budgetSums
                                    .reduce((value, element) => value + element)
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
                          "Time factor",
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
                          "Materials markup %",
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
                          "Site setup and operation %",
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
                          (costs * sumLaborCosts).toStringAsFixed(2),
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
                        Text(sumMaterialCosts.toStringAsFixed(2)),
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
                        Text("-"),
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
                          (sumMaterialCosts * 0.05).toStringAsFixed(2),
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
                              .toStringAsFixed(2),
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
                              .toStringAsFixed(2),
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