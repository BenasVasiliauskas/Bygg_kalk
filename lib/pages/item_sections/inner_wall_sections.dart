import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/interior_wall_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class InnerWallSections extends StatefulWidget {
  const InnerWallSections({super.key});

  @override
  State<InnerWallSections> createState() => _InnerWallSectionsState();
}

class _InnerWallSectionsState extends State<InnerWallSections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          languageEnglish
              ? "Inner walls"
              : languageLithuanian
                  ? "Vidinės sienos"
                  : languageNorwegian
                      ? "Innvendige vegger"
                      : "Ściany wewnętrzne",
        ),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return InnerWallScreen();
                  },
                ),
              );
            },
            child: Text(
              languageEnglish
                  ? "New building"
                  : languageLithuanian
                      ? "Naujas pastatas"
                      : languageNorwegian
                          ? "Ny bygning"
                          : "ŚNowy budynek",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return InnerWallScreen();
                  },
                ),
              );
            },
            child: Text(
              languageEnglish
                  ? "Reconstruction"
                  : languageLithuanian
                      ? "Rekonstrukcija"
                      : languageNorwegian
                          ? "Rekonstruksjon"
                          : "Rekonstrukcja",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return InnerWallScreen();
                  },
                ),
              );
            },
            child: Text(
              languageEnglish
                  ? "Demolition"
                  : languageLithuanian
                      ? "Griovimas"
                      : languageNorwegian
                          ? "Riving"
                          : "Rozbiórka",
            ),
          ),
        ],
      ),
    );
  }
}
