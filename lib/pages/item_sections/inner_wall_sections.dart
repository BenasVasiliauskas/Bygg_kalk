import 'package:cost_calculator/pages/shared/interior_wall_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class InnerWallSections extends StatefulWidget {
  const InnerWallSections({super.key});

  @override
  State<InnerWallSections> createState() => _InnerWallSectionsState();
}

class _InnerWallSectionsState extends State<InnerWallSections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Inner wall"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return InnerWallScreen();
                  },
                ),
              );
            },
            child: Text("New building"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return InnerWallScreen();
                  },
                ),
              );
            },
            child: Text("Reconstruction"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return InnerWallScreen();
                  },
                ),
              );
            },
            child: Text("Demolition"),
          ),
        ],
      ),
    );
  }
}
