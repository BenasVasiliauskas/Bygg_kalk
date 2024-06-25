import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/item_screens/deck_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class DeckSections extends StatefulWidget {
  const DeckSections({super.key});

  @override
  State<DeckSections> createState() => _DeckSectionsState();
}

class _DeckSectionsState extends State<DeckSections> {
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
                ? "Deck"
                : languageLithuanian
                    ? "Denis"
                    : languageNorwegian
                        ? "Dekk"
                        : "Pokład",
          ),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return DeckScreen();
                    },
                  ),
                );
              },
              child: Text(
                languageEnglish
                    ? "Deck"
                    : languageLithuanian
                        ? "Denis"
                        : languageNorwegian
                            ? "Dekk"
                            : "Pokład",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
