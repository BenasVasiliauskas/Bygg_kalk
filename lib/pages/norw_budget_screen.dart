import 'package:flutter/material.dart';
import 'package:cost_calculator/constants/norw_budget_constants.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';

import '../constants/language.dart';

class NorwBudgetScreen extends StatefulWidget {
  @override
  State<NorwBudgetScreen> createState() => _NorwBudgetScreenState();
}

class _NorwBudgetScreenState extends State<NorwBudgetScreen> {
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
            columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Totalt antall timer')),
              DataColumn(label: Text('Arbeidskostnader')),
              DataColumn(label: Text('Materialkostnade')),
              DataColumn(label: Text('Budsjettsum')),
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
        ),
      ),
    );
  }
}
