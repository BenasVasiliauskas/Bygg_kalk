import 'package:cost_calculator/bathroom_data/eng_data.dart';
import 'package:cost_calculator/bathroom_pages/item_screen/windows_doors_screen.dart';
import 'package:cost_calculator/pages/shared/bathroom_section_page.dart';
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
                MaterialPageRoute(builder: (context) {
                  return BathroomSectionPage();
                }),
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
                            return BathroomWindowsScreen();
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
                        Text("Windows"),
                      ],
                    ),
                  ),
                ),
                Text(bathroomWindowsData.length.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
