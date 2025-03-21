import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/item_screen/file_picker.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_budget_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_budget_screen.dart';
import 'package:cost_calculator/pages/shared/help_page.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/options.dart';
import 'package:cost_calculator/pages/shared/privacy_policy.dart';
import 'package:cost_calculator/pages/shared/secondHomePage.dart';
import 'package:cost_calculator/pages/shared/subscriptions_page.dart';
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
              child: languageEnglish
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
                  : languageNorwegian
                      ? Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  color: Colors.white,
                                  child: Image.asset("assets/Icon.png"),
                                ),
                              ),
                              Text(
                                'Tømrerarbeid  kalkyle',
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
                      : languageLithuanian
                          ? Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      color: Colors.white,
                                      child: Image.asset("assets/Icon.png"),
                                    ),
                                  ),
                                  Text(
                                    'Dailidžių skaičiavimas',
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      color: Colors.white,
                                      child: Image.asset("assets/Icon.png"),
                                    ),
                                  ),
                                  Text(
                                    'Obliczenia ciesielskie',
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
                    ? Text('Dokumenter')
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
                        : languageNorwegian
                            ? NorwBudgetScreen()
                            : languagePolish
                                ? PolBudgetScreen()
                                : LitBudgetScreen();
                  },
                ),
              );
            },
          ),
          //
          ListTile(
            leading: Icon(
              FontAwesomeIcons.fileShield,
              color: Colors.blue,
            ),
            title: Text(
              languageEnglish
                  ? 'Privacy policy'
                  : languageNorwegian
                      ? 'Personvernerklæring'
                      : languageLithuanian
                          ? "Privatumo politika"
                          : "Polityka prywatności",
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return privacyPolicy();
              }));
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.moneyBill1,
              color: Colors.blue,
            ),
            title: Text(
              languageEnglish
                  ? "Your subscriptions"
                  : languageNorwegian
                      ? "Dine abonnementer"
                      : languageLithuanian
                          ? "Jūsų prenumeratos"
                          : "Twoje subskrypcje",
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return SubscriptionsPage();
              }));
            },
          ),

          ListTile(
              leading: FaIcon(
                (FontAwesomeIcons.question),
                color: Colors.blue,
              ),
              title: Text(
                languageEnglish
                    ? 'Need help?'
                    : languageNorwegian
                        ? 'Trenger du hjelp?'
                        : languageLithuanian
                            ? "Ar reikia pagalbos"
                            : "Potrzebujesz pomocy?",
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return HelpPage();
                }));
              }),
        ],
      ),
    );
  }
}
