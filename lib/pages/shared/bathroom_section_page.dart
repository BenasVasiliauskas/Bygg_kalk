import 'package:cost_calculator/pages/shared/item_screens/bathroom_building_components_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';

class BathroomSectionPage extends StatefulWidget {
  const BathroomSectionPage({super.key});

  @override
  _BathroomSectionPageState createState() => _BathroomSectionPageState();
}

class _BathroomSectionPageState extends State<BathroomSectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bathroom Section'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      height: 120.0,
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const BuildingComponentsScreen(); // Navigate to BuildingComponentsScreen
                                  },
                                ),
                              );
                            },
                            icon: const FaIcon(FontAwesomeIcons.houseChimney),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: const Text(
                              "Go to Building Components",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
