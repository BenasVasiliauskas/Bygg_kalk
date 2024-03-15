import 'package:flutter/material.dart';
import 'package:cost_calculator/constants/budget_constants.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';

import '../constants/language.dart';

class BudgetScreen extends StatefulWidget {
  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Screen'),
      ),
      drawer: CustomDrawer(
        languageEnglish: languageEnglish,
        onLanguageChanged: (value) {
          setState(() {
            languageEnglish = value;
          });
        },
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
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
        ),
      ),
    );
  }
}
