import 'package:cost_calculator/pages/norw_item_screen/norw_windows_exterior_door_items_screen.dart';
import 'package:flutter/material.dart';

class MainDataTable extends StatelessWidget {
  final NorwWindowsExteriorDoorItemsScreen widget;

  MainDataTable(this.widget);

  @override
  Widget build(BuildContext context) {
    List<DataColumn> columns = [
      DataColumn(
        label: Text("Item"),
      ),

      // Define your columns here
    ];

    List<DataRow> rows = [];
    // Populate rows

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        dataRowMaxHeight: double.infinity,
        dataRowMinHeight: 60,
        columns: columns,
        rows: rows,
      ),
    );
  }
}
