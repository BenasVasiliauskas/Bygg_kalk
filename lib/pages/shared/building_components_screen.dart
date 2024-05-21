import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/item_screen/home_page.dart';
import 'package:cost_calculator/pages/item_sections/inner_door_sections.dart';
import 'package:cost_calculator/pages/item_sections/inner_wall_sections.dart';
import 'package:cost_calculator/pages/item_sections/outer_wall_sections.dart';
import 'package:cost_calculator/pages/item_sections/parquet_laminate_sections.dart';
import 'package:cost_calculator/pages/item_sections/windows_exterior_door_sections.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class buildingComponentsScreen extends StatefulWidget {
  const buildingComponentsScreen({super.key});

  @override
  State<buildingComponentsScreen> createState() =>
      _buildingComponentsScreenState();
}

class _buildingComponentsScreenState extends State<buildingComponentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Building components'),
        actions: [
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.houseChimney,
            ),
            tooltip: 'Return to home',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return homePage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(FontAwesomeIcons.folder),
                      ),
                      Text(languageEnglish ? "Carrier system" : "Bæresystemet"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) {
                        return OuterWallSections();
                      }),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(FontAwesomeIcons.folder),
                      ),
                      Text(languageEnglish ? "Exterior walls" : "Yttervegger"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return WindowsExteriorDoorSections();
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(FontAwesomeIcons.folder),
                      ),
                      Text(languageEnglish
                          ? "Window/exterior door"
                          : "Vindu/ytterdør"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return InnerWallSections();
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(FontAwesomeIcons.folder),
                      ),
                      Text(languageEnglish ? "Interior walls" : "Innevegger"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return InnerDoorSections();
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(FontAwesomeIcons.folder),
                      ),
                      Text(languageEnglish ? "Interior door" : "Innedør"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(FontAwesomeIcons.folder),
                      ),
                      Text(languageEnglish ? "Deck" : "Dekke"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(FontAwesomeIcons.folder),
                      ),
                      Text(languageEnglish ? "Flooring" : "Gulvbelegg"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(FontAwesomeIcons.folder),
                      ),
                      Text(languageEnglish ? "Exterior roof" : "Yttertak"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(FontAwesomeIcons.folder),
                      ),
                      Text(languageEnglish
                          ? "Terrace/railings"
                          : "Terrasse/rekkverk"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(FontAwesomeIcons.folder),
                      ),
                      Text(languageEnglish ? "Trapper" : "Trapper"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(FontAwesomeIcons.folder),
                      ),
                      Text(languageEnglish ? "Hull roofing" : "Hulltaking"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(FontAwesomeIcons.folder),
                      ),
                      Text(languageEnglish ? "Scaffolding" : "Stillas"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(FontAwesomeIcons.folder),
                      ),
                      Text(languageEnglish ? "Waste management" : "Avfall"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return ParquetLaminateSections();
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Icon(FontAwesomeIcons.folder),
                      ),
                      Text(languageEnglish
                          ? "Parquet and laminate"
                          : "Parquet og laminat"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
