import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/budget_screen.dart';
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
        drawer: CustomDrawer(
          languageEnglish: languageEnglish,
          onLanguageChanged: (value) {
            setState(() {
              languageEnglish = value;
            });
          },
        ),
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
                      color: Colors.lightBlue,
                      height: 120.0,
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.houseChimney)),
                          Text(
                            "Items",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      color: Colors.lightBlue,
                      height: 120.0,
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.book)),
                          Text(
                            "Documents",
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
                      color: Colors.lightBlue,
                      height: 120.0,
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.gear)),
                          Text(
                            "Options",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      color: Colors.lightBlue,
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
                            "Budget",
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
