import 'package:cost_calculator/pages/inner_door_screen.dart';
import 'package:cost_calculator/pages/kitchen_screen.dart';
import 'package:cost_calculator/pages/parquet_laminate_screen.dart';

import '../pages/budget_screen.dart';
import '../pages/exterior_wall_screen.dart';
import '../pages/interior_wall_screen.dart';
import 'package:flutter/material.dart';

import '../pages/norw_budget_screen.dart';
import '../pages/windows_exterior_door_screen.dart';

class CustomDrawer extends StatelessWidget {
  final bool languageEnglish;
  final Function(bool) onLanguageChanged;

  CustomDrawer(
      {required this.languageEnglish, required this.onLanguageChanged});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 96,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: languageEnglish == true
                  ? Text('Category navigation')
                  : Text('Kategori navigering'),
            ),
          ),
          ListTile(
            title: languageEnglish == true
                ? Text('Interior walls')
                : Text('Innvendige vegger'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return InnerWallScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: languageEnglish == true
                ? Text('Exterior walls')
                : Text('Yttervegger'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return ExteriorWallScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: languageEnglish == true
                ? Text('Windows and exterior doors')
                : Text('Vinduer og ytterdører'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return WindowsExteriorDoorScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: languageEnglish == true
                ? Text('Interior doors')
                : Text('Innerdører'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return InnerDoorScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: languageEnglish == true
                ? Text('Parquet and laminate')
                : Text('Parkett og laminat'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return ParquetLaminateScreen();
                  },
                ),
              );
            },
          ),

          // removed kitchen from the drawer
          // ListTile(
          //   title: languageEnglish == true ? Text('Kitchen') : Text('Kjøkken'),
          //   onTap: () {
          //     Navigator.of(context).pushReplacement(
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return KitchenScreen();
          //         },
          //       ),
          //     );
          //   },
          // ),
          ListTile(
            title: languageEnglish == true ? Text('Budget') : Text('Budsjett'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    if (languageEnglish == false)
                      return NorwBudgetScreen();
                    else
                      return BudgetScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: languageEnglish == true
                ? Text('Language options')
                : Text('Språkvalg'),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                      child: languageEnglish == false
                          ? Text('Norsk')
                          : Text('Norwegian'),
                    ),
                    Switch(
                      value: languageEnglish,
                      onChanged: onLanguageChanged,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                      child: languageEnglish == false
                          ? Text('Engelsk')
                          : Text('English'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
