import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/item_screen/home_page.dart';
import 'package:cost_calculator/pages/shared/inner_door_screen.dart';
import 'package:cost_calculator/pages/shared/options.dart';
import 'package:cost_calculator/pages/shared/parquet_laminate_screen.dart';
import 'package:cost_calculator/pages/shared/privacy_policy.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/shared/budget_screen.dart';
import '../pages/shared/exterior_wall_screen.dart';
import '../pages/shared/interior_wall_screen.dart';
import 'package:flutter/material.dart';

import '../pages/shared/norw_budget_screen.dart';
import '../pages/shared/windows_exterior_door_screen.dart';

class CustomDrawer extends StatelessWidget {
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
                  ? Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Container(
                              width: 35,
                              height: 35,
                              color: Colors.white,
                              child: FlutterLogo(),
                            ),
                          ),
                          Text(
                            'Carpentry calculation',
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: FaIcon(FontAwesomeIcons.arrowDown),
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  : Container(
                      child: Text('Tømrerarbeid  kalkyle'),
                    ),
            ),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.houseChimney,
              color: Colors.blue,
            ),
            title:
                languageEnglish == true ? Text('Home page') : Text('Huvedmeny'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return homePage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.book,
              color: Colors.blue,
            ),
            title: languageEnglish == true
                ? Text('Documents')
                : Text('Bygningsdeler'),
            onTap: () {},
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.gear,
              color: Colors.blue,
            ),
            title: languageEnglish == true
                ? Text('Options')
                : Text('Innstillinger'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return optionsScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.dollarSign,
              color: Colors.blue,
            ),
            title: languageEnglish == true ? Text('Budget') : Text('Budsjett'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return languageEnglish
                        ? BudgetScreen()
                        : NorwBudgetScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.fileShield,
              color: Colors.blue,
            ),
            title: languageEnglish == true
                ? Text('Privacy policy')
                : Text('Personvernerklæring'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return privacyPolicy();
                  },
                ),
              );
            },
          ),
//////// old
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
        ],
      ),
    );
  }
}
