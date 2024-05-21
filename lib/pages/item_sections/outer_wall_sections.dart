import 'package:cost_calculator/pages/shared/exterior_wall_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class OuterWallSections extends StatefulWidget {
  const OuterWallSections({super.key});

  @override
  State<OuterWallSections> createState() => _OuterWallSectionsState();
}

class _OuterWallSectionsState extends State<OuterWallSections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Outer wall"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return ExteriorWallScreen();
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
                    return ExteriorWallScreen();
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
                    return ExteriorWallScreen();
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
