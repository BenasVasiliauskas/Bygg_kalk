import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class SubscriptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Subscriptions'),
      ),
      body: Center(
        child: Text('This is the Subscriptions Page'),
      ),
    );
  }
}
