import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class helpPage extends StatelessWidget {
  const helpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Help page"),
      ),
    );
  }
}
