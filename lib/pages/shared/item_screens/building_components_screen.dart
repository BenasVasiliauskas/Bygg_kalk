import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
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
  final AppLifecycleObserver _observer = AppLifecycleObserver();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    super.dispose();
  }

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
                  Tooltip(
                    message: languageEnglish
                        ? '''View support system Contained elements: 
New building'''
                        : languageLithuanian
                            ? '''Peržiūrėti atraminę sistemą. Sudaryti elementai:
Nauja statyba'''
                            : languageNorwegian
                                ? '''Vis bæresystem. Inneholdte elementer:
Nybygg'''
                                : '''Zobacz system nośny. Elementy uzupełniające:
Nowa konstrukcja''',
                    child: TextButton(
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
                                child: Image.asset("assets/SupportSystem.jpg")),
                          ),
                          Text(languageEnglish
                              ? "Support system"
                              : languageNorwegian
                                  ? "Bæresystemer"
                                  : languagePolish
                                      ? "System nośny"
                                      : "Atraminė sistema"),
                        ],
                      ),
                    ),
                  ),
                  //change back to eng after adding eng data
                  Text(norwSupportSystem.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View exterior walls. Contained elements: 
New building, Reconstruction, Demolition'''
                        : languageLithuanian
                            ? '''Peržiūrėti išorines sienas. Sudaryti elementai:
Nauja statyba, Rekonstrukcija, Griovimas'''
                            : languageNorwegian
                                ? '''Vis yttervegger. Inneholdte elementer:
Nybygg, Ombygging, Riving'''
                                : '''Zobacz ściany zewnętrzne. Elementy uzupełniające:
Nowa konstrukcja, Przebudowa, Wyburzenie''',
                    child: TextButton(
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
                                child: Image.asset("assets/ExteriorWalls.jpg")),
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
                  ),
                  Text(exteriorWallData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View windows and exterior doors. Contained elements:
New building, Demolition'''
                        : languageLithuanian
                            ? '''Peržiūrėti langus ir išorines duris. Sudaryti elementai:
Nauja statyba, Griovimas'''
                            : languageNorwegian
                                ? '''Vis vinduer og ytterdører. Inneholdte elementer:
Nybygg, Riving'''
                                : '''Zobacz okna i drzwi zewnętrzne. Elementy uzupełniające:
Nowa konstrukcja, Wyburzenie''',
                    child: TextButton(
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
                                child: Image.asset(
                                    "assets/WindowExteriorDoor.jpg")),
                          ),
                          Text(languageEnglish
                              ? "Window/exterior door"
                              : languageNorwegian
                                  ? "Vinduer/ytterdører"
                                  : languagePolish
                                      ? "Okno/drzwi zewnętrzne"
                                      : "Langas/išorinė durys"),
                        ],
                      ),
                    ),
                  ),
                  Text(windowsExteriorDoors.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View interior walls. Contained elements:
New building, Reconstruction, Demolition'''
                        : languageLithuanian
                            ? '''Peržiūrėti vidaus sienas. Sudaryti elementai:
Nauja statyba, Rekonstrukcija, Griovimas'''
                            : languageNorwegian
                                ? '''Vis indre vegger. Inneholdte elementer:
Nybygg, Ombygging, Riving'''
                                : '''Zobacz ściany wewnętrzne. Elementy uzupełniające:
Nowa konstrukcja, Przebudowa, Wyburzenie''',
                    child: TextButton(
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
                                child: Image.asset("assets/InnerWall.jpg")),
                          ),
                          Text(languageEnglish
                              ? "Interior walls"
                              : languageNorwegian
                                  ? "Innervegger"
                                  : languagePolish
                                      ? "Ściany wewnętrzne"
                                      : "Vidinės sienos"),
                        ],
                      ),
                    ),
                  ),
                  Text(dataInnerWallData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View interior doors. Contained elements:
New building, Demolition'''
                        : languageLithuanian
                            ? '''Peržiūrėti vidinius duris. Sudaryti elementai:
Nauja statyba, Griovimas'''
                            : languageNorwegian
                                ? '''Vis indre dører. Inneholdte elementer:
Nybygg, Riving'''
                                : '''Zobacz drzwi wewnętrzne. Elementy uzupełniające:
Nowa konstrukcja, Wyburzenie''',
                    child: TextButton(
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
                                child: Image.asset("assets/InnerDoor.jpg")),
                          ),
                          Text(languageEnglish
                              ? "Interior door"
                              : languageNorwegian
                                  ? "Innedører"
                                  : languagePolish
                                      ? "Drzwi wewnętrzne"
                                      : "Vidinės durys"),
                        ],
                      ),
                    ),
                  ),
                  Text(innerDoor.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View Covers. Contained elements:
New building, Reconstruction, Demolition'''
                        : languageLithuanian
                            ? '''Peržiūrėti dangas. Sudaryti elementai:
Nauja statyba, Rekonstrukcija, Griovimas'''
                            : languageNorwegian
                                ? '''Vis dekker. Inneholdte elementer:
Nybygg, Ombygging, Riving'''
                                : '''Zobacz pokrycia. Elementy uzupełniające:
Nowa konstrukcja, Przebudowa, Wyburzenie''',
                    child: TextButton(
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
                                  child: Image.asset("assets/Covers.jpg")),
                            ),
                          ),
                          Text(
                            languageEnglish
                                ? "Covers"
                                : languageLithuanian
                                    ? "Apdanga"
                                    : languageNorwegian
                                        ? "Dekker"
                                        : "Opona",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(deckData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View Flooring. Contained elements:
New building, Demolition'''
                        : languageLithuanian
                            ? '''Peržiūrėti grindis. Sudaryti elementai:
Nauja statyba, Griovimas'''
                            : languageNorwegian
                                ? '''Vis gulvbelegg. Inneholdte elementer:
Nybygg, Riving'''
                                : '''Zobacz podłogę. Elementy uzupełniające:
Nowa konstrukcja, Wyburzenie''',
                    child: TextButton(
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
                                child: Image.asset("assets/Flooring.jpg")),
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
                  ),
                  Text(flooringData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View Exterior roof. Contained elements:
New building, Reconstruction, Demolition'''
                        : languageLithuanian
                            ? '''Peržiūrėti išorinį stogą. Sudaryti elementai:
Nauja statyba, Rekonstrukcija, Griovimas'''
                            : languageNorwegian
                                ? '''Vis yttertak. Inneholdte elementer:
Nybygg, Ombygging, Riving'''
                                : '''Zobacz zewnętrzny dach. Elementy uzupełniające:
Nowa konstrukcja, Przebudowa, Wyburzenie''',
                    child: TextButton(
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
                                child: Image.asset("assets/OuterRoof.jpg")),
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
                  ),
                  Text(outerRoofData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View Terrace/railings. Contained elements:
New building'''
                        : languageLithuanian
                            ? '''Peržiūrėti terasą/laistymo sistemas. Sudaryti elementai:
Nauja statyba'''
                            : languageNorwegian
                                ? '''Vis terrasse/rekkverk. Inneholdte elementer:
Nybygg'''
                                : '''Zobacz taras/barierki. Elementy uzupełniające:
Nowa konstrukcja''',
                    child: TextButton(
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
                                child: Image.asset("assets/Terrace.jpg")),
                          ),
                          Text(languageEnglish
                              ? "Terrace/railings"
                              : languageNorwegian
                                  ? "Terrasser/rekkverk"
                                  : languagePolish
                                      ? "Taras/barierki"
                                      : "Terasa/turėklai"),
                        ],
                      ),
                    ),
                  ),
                  Text(terraceData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View Inner stairs. Contained elements:
New building'''
                        : languageLithuanian
                            ? '''Peržiūrėti vidinius laiptus. Sudaryti elementai:
Nauja statyba'''
                            : languageNorwegian
                                ? '''Vis indre trapper. Inneholdte elementer:
Nybygg'''
                                : '''Zobacz wewnętrzne schody. Elementy uzupełniające:
Nowa konstrukcja''',
                    child: TextButton(
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
                                child: Image.asset("assets/Stairs.jpg")),
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
                  ),
                  Text(innerStairsData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View Hull roofing. Contained elements:
New building'''
                        : languageLithuanian
                            ? '''Peržiūrėti korpuso stogą. Sudaryti elementai:
Nauja statyba'''
                            : languageNorwegian
                                ? '''Vis skrog taktekking. Inneholdte elementer:
Nybygg'''
                                : '''Zobacz pokrycie kadłuba. Elementy uzupełniające:
Nowa konstrukcja''',
                    child: TextButton(
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
                                child: Image.asset("assets/Roofing.jpg")),
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
                  ),
                  Text(hullRoofingData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View Scaffolding. Contained elements:
New building'''
                        : languageLithuanian
                            ? '''Peržiūrėti pastoliai. Sudaryti elementai:
Nauja statyba'''
                            : languageNorwegian
                                ? '''Vis stillas. Inneholdte elementer:
Nybygg'''
                                : '''Zobacz rusztowanie. Elementy uzupełniające:
Nowa konstrukcja''',
                    child: TextButton(
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
                                child: Image.asset("assets/Scaffolding.jpg")),
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
                  ),
                  Text(scaffoldingData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View Waste management. Contained elements:
New building'''
                        : languageLithuanian
                            ? '''Peržiūrėti atliekų tvarkymą. Sudaryti elementai:
Nauja statyba'''
                            : languageNorwegian
                                ? '''Vis avfallshåndtering. Inneholdte elementer:
Nybygg'''
                                : '''Zobacz zarządzanie odpadami. Elementy uzupełniające:
Nowa konstrukcja''',
                    child: TextButton(
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
                                child: Image.asset("assets/Waste.jpg")),
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
                  ),
                  Text(wasteData.length.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
