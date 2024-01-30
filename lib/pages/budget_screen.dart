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
          child: Row(
            children: [
              DataTable(
                columns: [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Total Hours')),
                  DataColumn(label: Text('Labor Costs')),
                  DataColumn(label: Text('Material Costs')),
                  DataColumn(label: Text('Budget Sum')),
                ],
                rows: List.generate(calculatedNamesOrder.length, (index) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(calculatedNamesOrder[index]),
                        ),
                      ),
                      DataCell(
                        Text(
                          totalHours[index].toStringAsFixed(2),
                        ),
                      ),
                      DataCell(
                        Text(
                          totalLaborCosts[index].toStringAsFixed(2),
                        ),
                      ),
                      DataCell(
                        Text(
                          totalMaterialCosts[index].toStringAsFixed(2),
                        ),
                      ),
                      DataCell(
                        Text(
                          budgetSums[index].toStringAsFixed(2),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
