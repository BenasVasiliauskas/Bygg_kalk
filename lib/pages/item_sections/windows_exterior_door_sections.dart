import 'package:cost_calculator/pages/shared/windows_exterior_door_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class WindowsExteriorDoorSections extends StatefulWidget {
  const WindowsExteriorDoorSections({super.key});

  @override
  State<WindowsExteriorDoorSections> createState() =>
      _WindowsExteriorDoorSectionsState();
}

class _WindowsExteriorDoorSectionsState
    extends State<WindowsExteriorDoorSections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Windows and exterior doors"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return WindowsExteriorDoorScreen();
                    },
                  ),
                );
              },
              child: Text("Windows and exterior doors"))
        ],
      ),
    );
  }
}
