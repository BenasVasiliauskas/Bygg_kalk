import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/inner_door_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class InnerDoorSections extends StatefulWidget {
  const InnerDoorSections({super.key});

  @override
  State<InnerDoorSections> createState() => _InnerDoorSectionsState();
}

class _InnerDoorSectionsState extends State<InnerDoorSections> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return buildingComponentsScreen();
          }),
        );
      },
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text(
            languageEnglish
                ? "Inner doors"
                : languageLithuanian
                    ? "Vidinės durys"
                    : languageNorwegian
                        ? "Innvendige dører"
                        : "Drzwi wewnętrzne",
          ),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return InnerDoorScreen();
                    },
                  ),
                );
              },
              child: Text(
                languageEnglish
                    ? "Inner doors"
                    : languageLithuanian
                        ? "Vidinės durys"
                        : languageNorwegian
                            ? "Innvendige dører"
                            : "Drzwi wewnętrzne",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
