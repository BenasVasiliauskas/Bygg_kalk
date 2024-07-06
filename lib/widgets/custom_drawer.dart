import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/item_screen/file_picker.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/options.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/item_screen/budget_screen.dart';
import 'package:flutter/material.dart';

import '../pages/norw_item_screen/norw_budget_screen.dart';

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
                color: Theme.of(context).appBarTheme.backgroundColor,
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
                              child: Image.asset("assets/Icon.png"),
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
            title: languageEnglish
                ? Text('Home page')
                : languageNorwegian
                    ? Text('Huvedmeny')
                    : languageLithuanian
                        ? Text("Pagrindinis meniu")
                        : Text("Strona główna"),
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
            title: languageEnglish
                ? Text('Documents')
                : languageNorwegian
                    ? Text('Bygningsdeler')
                    : languageLithuanian
                        ? Text("Dokumentai")
                        : Text("Dokumenty"),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return FilePickerScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.gear,
              color: Colors.blue,
            ),
            title: languageEnglish
                ? Text('Options')
                : languageNorwegian
                    ? Text('Innstillinger')
                    : languageLithuanian
                        ? Text("Nustatymai")
                        : Text("Opcje"),
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
            title: languageEnglish
                ? Text('Budget')
                : languageNorwegian
                    ? Text('Budsjett')
                    : languageLithuanian
                        ? Text("Biudžetas")
                        : Text("Budżet"),
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
        ],
      ),
    );
  }
}
