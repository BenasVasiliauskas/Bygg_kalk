import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class BathroomSectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Bathroom Section'),
      ),
      body: Center(
        child: Text('Welcome to the Bathroom Section!'),
      ),
    );
  }
}
