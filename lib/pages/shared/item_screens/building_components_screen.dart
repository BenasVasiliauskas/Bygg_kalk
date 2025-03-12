import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/lithuanian_data_folder/lith_data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
import 'package:cost_calculator/data/polish_data_folder/polish_data_original.dart';
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
      onPopInvokedWithResult: (bool didPop, Object? result) async {
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
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View support system Contained elements: 
New building'''
                        : languageLithuanian
                            ? '''Peržiūrėti laikančiają konstrukciją. Sudaryti elementai:
Nauja statyba'''
                            : languageNorwegian
                                ? '''Vis bæresystem. Inneholdte elementer:
Nybygg'''
                                : '''Zobacz konstrukcje nośne. Elementy uzupełniające:
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
                              ? "Load-bearing system"
                              : languageNorwegian
                                  ? "Bæresystemer"
                                  : languagePolish
                                      ? "Konstrukcje nośne"
                                      : "Laikančiosios konstrukcijos"),
                        ],
                      ),
                    ),
                  ),
                  Text(languageNorwegian
                      ? norwSupportSystem.length.toString()
                      : languageLithuanian
                          ? litSupportSystem.length.toString()
                          : languageEnglish
                              ? supportSystem.length.toString()
                              : polSupportSystem.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View externall walls. Contained elements: 
New building, Reconstruction, Demolition'''
                        : languageLithuanian
                            ? '''Peržiūrėti lauko sienas. Sudaryti elementai:
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
                              ? "External walls"
                              : languageNorwegian
                                  ? "Yttervegger"
                                  : languagePolish
                                      ? "Ściany zewnętrzne"
                                      : "Lauko sienos"),
                        ],
                      ),
                    ),
                  ),
                  Text(languageNorwegian
                      ? norwExteriorWallData.length.toString()
                      : languageLithuanian
                          ? litExteriorWallData.length.toString()
                          : languageEnglish
                              ? exteriorWallData.length.toString()
                              : polExteriorWallData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View windows and exterior doors. Contained elements:
New building, Demolition'''
                        : languageLithuanian
                            ? '''Peržiūrėti langus ir lauko duris. Sudaryti elementai:
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
                              ? "Windows, doors"
                              : languageNorwegian
                                  ? "Vinduer og ytterdører"
                                  : languagePolish
                                      ? "Okna i drzwi"
                                      : "Langai ir lauko durys"),
                        ],
                      ),
                    ),
                  ),
                  Text(languageNorwegian
                      ? norwWindowsExteriorDoors.length.toString()
                      : languageLithuanian
                          ? litWindowsExteriorDoors.length.toString()
                          : languageEnglish
                              ? windowsExteriorDoors.length.toString()
                              : polWindowsExteriorDoors.length.toString()),
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
                              ? "Internal walls"
                              : languageNorwegian
                                  ? "Innervegger"
                                  : languagePolish
                                      ? "Ściany wewnętrzne"
                                      : "Vidinės sienos"),
                        ],
                      ),
                    ),
                  ),
                  Text(languageNorwegian
                      ? norwInnerWallData.length.toString()
                      : languageLithuanian
                          ? litInnerWallData.length.toString()
                          : languageEnglish
                              ? dataInnerWallData.length.toString()
                              : polInnerWallData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View interior doors. Contained elements:
New building, Demolition'''
                        : languageLithuanian
                            ? '''Peržiūrėti vidaus duris. Sudaryti elementai:
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
                              ? "Internal doors"
                              : languageNorwegian
                                  ? "Innedører"
                                  : languagePolish
                                      ? "Drzwi wewnętrzne"
                                      : "Vidaus durys"),
                        ],
                      ),
                    ),
                  ),
                  Text(languageNorwegian
                      ? norwInnerDoor.length.toString()
                      : languageLithuanian
                          ? litInnerDoor.length.toString()
                          : languageEnglish
                              ? innerDoor.length.toString()
                              : polInnerDoor.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View Floor structure. Contained elements:
New building, Reconstruction, Demolition'''
                        : languageLithuanian
                            ? '''Peržiūrėti perdanga. Sudaryti elementai:
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
                            child: SizedBox(
                                width: 50,
                                child: Image.asset("assets/Covers.jpg")),
                          ),
                          Text(
                            languageEnglish
                                ? "Floor structure"
                                : languageLithuanian
                                    ? "Perdangos"
                                    : languageNorwegian
                                        ? "Dekker"
                                        : "Stropy",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(languageNorwegian
                      ? norwDeckData.length.toString()
                      : languageLithuanian
                          ? litDeckData.length.toString()
                          : languageEnglish
                              ? deckData.length.toString()
                              : polDeckData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View Flooring. Contained elements:
New building, Demolition'''
                        : languageLithuanian
                            ? '''Peržiūrėti grindų dangą. Sudaryti elementai:
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
                                      ? "Wiercenie otworów."
                                      : "Grindų danga"),
                        ],
                      ),
                    ),
                  ),
                  Text(languageNorwegian
                      ? norwFlooringData.length.toString()
                      : languageLithuanian
                          ? litFlooringData.length.toString()
                          : languageEnglish
                              ? flooringData.length.toString()
                              : polFlooringData.length.toString()),
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
                              ? "Roof"
                              : languageNorwegian
                                  ? "Yttertak"
                                  : languagePolish
                                      ? "Dach"
                                      : "Stogas"),
                        ],
                      ),
                    ),
                  ),
                  Text(languageNorwegian
                      ? outerRoofData.length.toString()
                      : languageLithuanian
                          ? litOuterRoofData.length.toString()
                          : languageEnglish
                              ? outerRoofData.length.toString()
                              : polOuterRoofData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View Terrace/railings. Contained elements:
New building'''
                        : languageLithuanian
                            ? '''Peržiūrėti terasas, turėklus. Sudaryti elementai:
Nauja statyba'''
                            : languageNorwegian
                                ? '''Vis terrasser,rekkverk.. Inneholdte elementer:
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
                              ? "Terrace, railings"
                              : languageNorwegian
                                  ? "Terrasser, rekkverk"
                                  : languagePolish
                                      ? "Tarasy, balustrady."
                                      : "Terosos, turėklai"),
                        ],
                      ),
                    ),
                  ),
                  Text(languageNorwegian
                      ? terraceData.length.toString()
                      : languageLithuanian
                          ? litTerraceData.length.toString()
                          : languageEnglish
                              ? terraceData.length.toString()
                              : polTerraceData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View Inner stairs. Contained elements:
New building'''
                        : languageLithuanian
                            ? '''Peržiūrėti vidaus laiptus. Sudaryti elementai:
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
                              ? "Indoor stairs"
                              : languageNorwegian
                                  ? "Innvendige trapper"
                                  : languagePolish
                                      ? "Schody wewnętrzne"
                                      : "Vidaus laiptai"),
                        ],
                      ),
                    ),
                  ),
                  Text(languageNorwegian
                      ? innerStairsData.length.toString()
                      : languageLithuanian
                          ? litInnerStairsData.length.toString()
                          : languageEnglish
                              ? innerStairsData.length.toString()
                              : polInnerStairsData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View Hull roofing. Contained elements:
New building'''
                        : languageLithuanian
                            ? '''Peržiūrėti angų gręžimą. Sudaryti elementai:
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
                              ? "Holes"
                              : languageNorwegian
                                  ? "Hulltaking"
                                  : languagePolish
                                      ? "Wiercenie otworów."
                                      : "Angų gręžimas"),
                        ],
                      ),
                    ),
                  ),
                  Text(languageNorwegian
                      ? hullRoofingData.length.toString()
                      : languageLithuanian
                          ? litHullRoofingData.length.toString()
                          : languageEnglish
                              ? hullRoofingData.length.toString()
                              : polHullRoofingData.length.toString()),
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
                  Text(languageNorwegian
                      ? scaffoldingData.length.toString()
                      : languageLithuanian
                          ? litScaffoldingData.length.toString()
                          : languageEnglish
                              ? scaffoldingData.length.toString()
                              : polScaffoldingData.length.toString()),
                ],
              ),
              Row(
                children: [
                  Tooltip(
                    message: languageEnglish
                        ? '''View Waste management. Contained elements:
New building'''
                        : languageLithuanian
                            ? '''Peržiūrėti atliekų išvežimą. Sudaryti elementai:
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
                              ? "Waste"
                              : languageNorwegian
                                  ? "Avfall"
                                  : languagePolish
                                      ? "Wywóz odpadów."
                                      : "Atliekų išvežimas"),
                        ],
                      ),
                    ),
                  ),
                  Text(languageNorwegian
                      ? wasteData.length.toString()
                      : languageLithuanian
                          ? litWasteData.length.toString()
                          : languageEnglish
                              ? wasteData.length.toString()
                              : polWasteData.length.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
