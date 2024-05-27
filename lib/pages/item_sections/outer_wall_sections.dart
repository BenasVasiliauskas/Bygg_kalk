import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/exterior_wall_screen.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class OuterWallSections extends StatefulWidget {
  const OuterWallSections({super.key});

  @override
  State<OuterWallSections> createState() => _OuterWallSectionsState();
}

class _OuterWallSectionsState extends State<OuterWallSections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          languageEnglish
              ? "Outer wall"
              : languageLithuanian
                  ? "Išorinės sienos"
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
                    return ExteriorWallScreen();
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
                    return ExteriorWallScreen();
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
                    return ExteriorWallScreen();
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
