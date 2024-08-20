import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/item_screen/file_picker.dart';
import 'package:cost_calculator/pages/item_screen/budget_screen.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_budget_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_budget_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_budget_screen.dart';
import 'package:cost_calculator/pages/shared/help_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/options.dart';
import 'package:cost_calculator/pages/shared/privacy_policy.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bygg Kalk'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
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
                                  return buildingComponentsScreen();
                                },
                              ),
                            );
                          },
                          icon: FaIcon(FontAwesomeIcons.houseChimney),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          languageEnglish
                              ? "Building components"
                              : languageNorwegian
                                  ? "Byggdeler"
                                  : languageLithuanian
                                      ? "Statybinės dalys"
                                      : "Komponenty budynku",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
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
                                    return FilePickerScreen();
                                  },
                                ),
                              );
                            },
                            icon: FaIcon(FontAwesomeIcons.book)),
                        Text(
                          textAlign: TextAlign.center,
                          languageEnglish
                              ? "Documents"
                              : languageNorwegian
                                  ? "Dokumenter"
                                  : languageLithuanian
                                      ? "Dokumentai"
                                      : "Dokumenty",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
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
                                    return optionsScreen();
                                  },
                                ),
                              );
                            },
                            icon: FaIcon(FontAwesomeIcons.gear)),
                        Text(
                          textAlign: TextAlign.center,
                          languageEnglish
                              ? "Options"
                              : languageNorwegian
                                  ? "Alternativer"
                                  : languageLithuanian
                                      ? "Nustatymai"
                                      : "Ustawienia",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
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
                              languageEnglish
                                  ? Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              BudgetScreen())))
                                  : languageNorwegian
                                      ? Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  NorwBudgetScreen())))
                                      : languagePolish
                                          ? Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      PolBudgetScreen())))
                                          : Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      LitBudgetScreen())));
                            },
                            icon: FaIcon(FontAwesomeIcons.dollarSign)),
                        Text(
                          textAlign: TextAlign.center,
                          languageEnglish
                              ? "Budget"
                              : languageNorwegian
                                  ? "Budsjett"
                                  : languageLithuanian
                                      ? "Biudžetas"
                                      : "Budżet",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //

          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    height: 120.0,
                    width: 120.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(FontAwesomeIcons.fileShield),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return privacyPolicy();
                              }));
                            }),
                        Text(
                          textAlign: TextAlign.center,
                          languageEnglish
                              ? 'Privacy policy'
                              : languageNorwegian
                                  ? 'Personvernerklæring'
                                  : languageLithuanian
                                      ? "Privatumo politika"
                                      : "Polityka prywatności",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    height: 120.0,
                    width: 120.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(FontAwesomeIcons.question),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return helpPage();
                              }));
                            }),
                        Text(
                          textAlign: TextAlign.center,
                          languageEnglish
                              ? 'Need help?'
                              : languageNorwegian
                                  ? 'Trenger du hjelp?'
                                  : languageLithuanian
                                      ? "Ar reikia pagalbos"
                                      : "Potrzebujesz pomocy?",
                          style: TextStyle(color: Colors.white),
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
    );
  }
}
