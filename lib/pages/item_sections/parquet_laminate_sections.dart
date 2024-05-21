import 'package:cost_calculator/pages/shared/parquet_laminate_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class ParquetLaminateSections extends StatefulWidget {
  const ParquetLaminateSections({super.key});

  @override
  State<ParquetLaminateSections> createState() =>
      _ParquetLaminateSectionsState();
}

class _ParquetLaminateSectionsState extends State<ParquetLaminateSections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Parquet and laminate"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return ParquetLaminateScreen();
                    },
                  ),
                );
              },
              child: Text("Parquet and laminate"))
        ],
      ),
    );
  }
}
