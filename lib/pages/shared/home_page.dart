import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/item_screen/file_picker.dart';
import 'package:cost_calculator/pages/item_screen/budget_screen.dart';
import 'package:cost_calculator/pages/shared/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/options.dart';
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
                            languageEnglish
                                ? "Items"
                                : languageNorwegian
                                    ? "Varer"
                                    : languageLithuanian
                                        ? "Prekės"
                                        : "Towary",
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
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            BudgetScreen())));
                              },
                              icon: FaIcon(FontAwesomeIcons.dollarSign)),
                          Text(
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
          ],
        ));
  }
}
