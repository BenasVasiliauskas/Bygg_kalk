import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/pages/item_sections/deck_sections.dart';
import 'package:cost_calculator/pages/item_sections/flooring_sections.dart';
import 'package:cost_calculator/pages/item_sections/hull_roofing_sections.dart';
import 'package:cost_calculator/pages/item_sections/inner_stairs.dart';
import 'package:cost_calculator/pages/item_sections/outer_roof_sections.dart';
import 'package:cost_calculator/pages/item_sections/scaffolding_sections.dart';
import 'package:cost_calculator/pages/item_sections/support_system_sections.dart';
import 'package:cost_calculator/pages/item_sections/terrace_sections.dart';
import 'package:cost_calculator/pages/item_sections/waste_sections.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/item_sections/inner_door_sections.dart';
import 'package:cost_calculator/pages/item_sections/inner_wall_sections.dart';
import 'package:cost_calculator/pages/item_sections/outer_wall_sections.dart';
import 'package:cost_calculator/pages/item_sections/parquet_laminate_sections.dart';
import 'package:cost_calculator/pages/item_sections/windows_exterior_door_sections.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class buildingComponentsScreen extends StatefulWidget {
  const buildingComponentsScreen({super.key});

  @override
  State<buildingComponentsScreen> createState() =>
      _buildingComponentsScreenState();
}

class _buildingComponentsScreenState extends State<buildingComponentsScreen> {
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
            return homePage();
          }),
        );
      },
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text(languageEnglish
              ? 'Building components'
              : languageLithuanian
                  ? "Statybos komponentai"
                  : languageNorwegian
                      ? "Bygningskomponenter"
                      : "Komponenty budynku"),
          actions: [
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.houseChimney,
              ),
              tooltip: languageEnglish
                  ? 'Return to main menu'
                  : languageLithuanian
                      ? "Grįžti į pagrindinį meniu"
                      : languageNorwegian
                          ? "Gå tilbake til hovedmenyen"
                          : "Powrót do menu głównego",
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return homePage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return SupportSystemSections();
                        }),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: SizedBox(
                              width: 50,
                              child: Image.asset("assets/SupportSystem.png")),
                        ),
                        Text(languageEnglish
                            ? "Support system"
                            : languageNorwegian
                                ? "Bæresystemet"
                                : languagePolish
                                    ? "System nośny"
                                    : "Transporterio sistema"),
                      ],
                    ),
                  ),
                  Text(supportSystem.length.toString()),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return OuterWallSections();
                        }),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: SizedBox(
                              width: 50,
                              child: Image.asset("assets/ExteriorWalls.png")),
                        ),
                        Text(languageEnglish
                            ? "Exterior walls"
                            : languageNorwegian
                                ? "Yttervegger"
                                : languagePolish
                                    ? "Ściany zewnętrzne"
                                    : "Išorinės sienos"),
                      ],
                    ),
                  ),
                  Text(exteriorWallData.length.toString()),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return WindowsExteriorDoorSections();
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: SizedBox(
                              width: 50,
                              child: Image.asset("assets/Window.png")),
                        ),
                        Text(languageEnglish
                            ? "Window/exterior door"
                            : languageNorwegian
                                ? "Vindu/ytterdør"
                                : languagePolish
                                    ? "Okno/drzwi zewnętrzne"
                                    : "Langas/išorinė durys"),
                      ],
                    ),
                  ),
                  Text(windowsExteriorDoors.length.toString()),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return InnerWallSections();
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: SizedBox(
                              width: 50,
                              child: Image.asset("assets/InnerWall.png")),
                        ),
                        Text(languageEnglish
                            ? "Interior walls"
                            : languageNorwegian
                                ? "Innevegger"
                                : languagePolish
                                    ? "Ściany wewnętrzne"
                                    : "Vidinės sienos"),
                      ],
                    ),
                  ),
                  Text(dataInnerWallData.length.toString()),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return InnerDoorSections();
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: SizedBox(
                              width: 50,
                              child: Image.asset("assets/InnerDoor.png")),
                        ),
                        Text(languageEnglish
                            ? "Interior door"
                            : languageNorwegian
                                ? "Innedør"
                                : languagePolish
                                    ? "Drzwi wewnętrzne"
                                    : "Vidinės durys"),
                      ],
                    ),
                  ),
                  Text(innerDoor.length.toString()),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return DeckSections();
                        }),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: SizedBox(
                                width: 50,
                                child: Image.asset("assets/Deck.png")),
                          ),
                        ),
                        Text(
                          languageEnglish
                              ? "Covers"
                              : languageLithuanian
                                  ? "Padangos"
                                  : languageNorwegian
                                      ? "Dekker"
                                      : "Opona",
                        ),
                      ],
                    ),
                  ),
                  Text(deckData.length.toString()),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return FlooringSections();
                        }),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: SizedBox(
                              width: 50,
                              child: Image.asset("assets/Flooring.png")),
                        ),
                        Text(languageEnglish
                            ? "Flooring"
                            : languageNorwegian
                                ? "Gulvbelegg"
                                : languagePolish
                                    ? "Podłoga"
                                    : "Grindys"),
                      ],
                    ),
                  ),
                  Text(flooringData.length.toString()),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return OuterRoofSections();
                        }),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: SizedBox(
                              width: 50,
                              child: Image.asset("assets/ExteriorRoof.png")),
                        ),
                        Text(languageEnglish
                            ? "Exterior roof"
                            : languageNorwegian
                                ? "Yttertak"
                                : languagePolish
                                    ? "Dach zewnętrzny"
                                    : "Išorinė stogo dalis"),
                      ],
                    ),
                  ),
                  Text(outerRoofData.length.toString()),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return TerraceSections();
                        }),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: SizedBox(
                              width: 50,
                              child: Image.asset("assets/Terrace.png")),
                        ),
                        Text(languageEnglish
                            ? "Terrace/railings"
                            : languageNorwegian
                                ? "Terrasse/rekkverk"
                                : languagePolish
                                    ? "Taras/barierki"
                                    : "Terasa/turėklai"),
                      ],
                    ),
                  ),
                  Text(terraceData.length.toString()),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return InnerStairsSections();
                        }),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: SizedBox(
                              width: 50,
                              child: Image.asset("assets/InnerStairs.png")),
                        ),
                        Text(languageEnglish
                            ? "Inner stairs"
                            : languageNorwegian
                                ? "Trapper"
                                : languagePolish
                                    ? "Schody wewnętrzne"
                                    : "Vidiniai laiptai"),
                      ],
                    ),
                  ),
                  Text(innerStairsData.length.toString()),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return HullRoofingSections();
                        }),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: SizedBox(
                              width: 50,
                              child: Image.asset("assets/HullRoofing.png")),
                        ),
                        Text(languageEnglish
                            ? "Hull roofing"
                            : languageNorwegian
                                ? "Hulltaking"
                                : languagePolish
                                    ? "Pokrycie kadłuba"
                                    : "Korpuso stogas"),
                      ],
                    ),
                  ),
                  Text(hullRoofingData.length.toString()),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return ScaffoldingSections();
                        }),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: SizedBox(
                              width: 50,
                              child: Image.asset("assets/Scaffold.png")),
                        ),
                        Text(languageEnglish
                            ? "Scaffolding"
                            : languageNorwegian
                                ? "Stillas"
                                : languagePolish
                                    ? "Rusztowanie"
                                    : "Pastoliai"),
                      ],
                    ),
                  ),
                  Text(scaffoldingData.length.toString()),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return WasteSections();
                        }),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: SizedBox(
                              width: 50,
                              child: Image.asset("assets/Waste.png")),
                        ),
                        Text(languageEnglish
                            ? "Waste management"
                            : languageNorwegian
                                ? "Avfall"
                                : languagePolish
                                    ? "Zarządzanie odpadami"
                                    : "Atliekų tvarkymas"),
                      ],
                    ),
                  ),
                  Text(wasteData.length.toString()),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return ParquetLaminateSections();
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: SizedBox(
                              width: 50,
                              child: Image.asset("assets/Parquet.png")),
                        ),
                        Text(languageEnglish
                            ? "Parquet and laminate"
                            : languageNorwegian
                                ? "Parquet og laminat"
                                : languagePolish
                                    ? "Parkiet i laminat"
                                    : "Parketas ir laminatas"),
                      ],
                    ),
                  ),
                  Text(parquetAndLaminate.length.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
