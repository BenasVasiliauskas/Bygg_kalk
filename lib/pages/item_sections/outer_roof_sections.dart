import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/outer_roof_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class OuterRoofSections extends StatefulWidget {
  const OuterRoofSections({super.key});

  @override
  State<OuterRoofSections> createState() => _OuterRoofSectionsState();
}

class _OuterRoofSectionsState extends State<OuterRoofSections> {
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
                ? "Outer roof"
                : languageLithuanian
                    ? "Išorinis stogas"
                    : languageNorwegian
                        ? "Yttertak"
                        : "Dach zewnętrzny",
          ),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return OuterRoofScreen();
                    },
                  ),
                );
              },
              child: Text(
                languageEnglish
                    ? "Outer roof"
                    : languageLithuanian
                        ? "Išorinis stogas"
                        : languageNorwegian
                            ? "Yttertak"
                            : "Dach zewnętrzny",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
