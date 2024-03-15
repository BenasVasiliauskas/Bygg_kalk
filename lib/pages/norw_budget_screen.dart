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
        title: Text('Budsjettskjermen'),
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
        ),
      ),
    );
  }
}



/*
DataColumn(label: Text('')),
              DataColumn(label: Text('')),
              DataColumn(label: Text('')),
              DataColumn(label: Text('')),
           
              */