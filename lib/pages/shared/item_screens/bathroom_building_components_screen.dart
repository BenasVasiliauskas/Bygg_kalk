import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildingComponentsScreen extends StatefulWidget {
  const BuildingComponentsScreen({super.key});

  @override
  State<BuildingComponentsScreen> createState() =>
      _BuildingComponentsScreenState();
}

class _BuildingComponentsScreenState extends State<BuildingComponentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Building Components'),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.houseChimney),
            tooltip: 'Return to main menu',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    // Add your home page navigation here
                    return const SizedBox(); // Placeholder for home page
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Tooltip(
                  message: 'View windows and exterior doors.',
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            // Navigate to the Windows/Exterior Doors page here
                            return SizedBox(); // Placeholder
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: SizedBox(
                            width: 50,
                            child: Image.asset("assets/WindowExteriorDoor.jpg"),
                          ),
                        ),
                        Text("Windows, doors"),
                      ],
                    ),
                  ),
                ),
                // Add the number of windows data here
                Text("0"), // Replace "0" with the actual data
              ],
            ),
          ],
        ),
      ),
    );
  }
}
