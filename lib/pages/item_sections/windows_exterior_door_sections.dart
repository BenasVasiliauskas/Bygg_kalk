import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/windows_exterior_door_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class WindowsExteriorDoorSections extends StatefulWidget {
  const WindowsExteriorDoorSections({super.key});

  @override
  State<WindowsExteriorDoorSections> createState() =>
      _WindowsExteriorDoorSectionsState();
}

class _WindowsExteriorDoorSectionsState
    extends State<WindowsExteriorDoorSections> {
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
                ? "Windows and exterior doors"
                : languageLithuanian
                    ? "Langai ir išorinės durys"
                    : languageNorwegian
                        ? "Vinduer og ytterdører"
                        : "Okna i drzwi zewnętrzne",
          ),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return WindowsExteriorDoorScreen();
                    },
                  ),
                );
              },
              child: Text(
                languageEnglish
                    ? "Windows and exterior doors"
                    : languageLithuanian
                        ? "Langai ir išorinės durys"
                        : languageNorwegian
                            ? "Vinduer og ytterdører"
                            : "Okna i drzwi zewnętrzne",
              ),
            )
          ],
        ),
      ),
    );
  }
}
