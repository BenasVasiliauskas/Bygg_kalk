import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/functions/save_project_to_json.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/item_screen/file_picker.dart';
import 'package:cost_calculator/pages/item_screen/budget_screen.dart';
import 'package:cost_calculator/pages/lit_item_screen/lit_budget_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_budget_screen.dart';
import 'package:cost_calculator/pages/pol_item_screen/pol_budget_screen.dart';
import 'package:cost_calculator/pages/shared/help_page.dart';
import 'package:cost_calculator/pages/shared/item_screens/building_components_screen.dart';
import 'package:cost_calculator/pages/shared/options.dart';
import 'package:cost_calculator/pages/shared/privacy_policy.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
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
        final fileName = await openDialog();
        await fileDeleteIfExists(fileName!);
        await writeJsonArrayStart(fileName);
        if (languageEnglish) {
          await saveEngProjectToJSON(fileName);
        } else if (languageNorwegian) {
          await saveNorwProjectToJson(fileName);
        }

        await writeJsonArrayEnd(fileName);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        drawer: CustomDrawer(),
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
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      height: 120.0,
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return buildingComponentsScreen();
                                  },
                                ),
                              );
                            },
                            icon: FaIcon(FontAwesomeIcons.houseChimney),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            languageEnglish
                                ? "Building components"
                                : languageNorwegian
                                    ? "Byggdeler"
                                    : languageLithuanian
                                        ? "Statybinės dalys"
                                        : "Komponenty budynku",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            //change back to eng after adding eng data
                            (dataInnerWallData.length +
                                    deckData.length +
                                    innerDoor.length +
                                    windowsExteriorDoors.length +
                                    norwSupportSystem.length +
                                    flooringData.length +
                                    terraceData.length +
                                    outerRoofData.length +
                                    norwExteriorWallData.length +
                                    hullRoofingData.length +
                                    scaffoldingData.length +
                                    innerStairsData.length +
                                    wasteData.length)
                                .toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      height: 120.0,
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return FilePickerScreen();
                                    },
                                  ),
                                );
                              },
                              icon: FaIcon(FontAwesomeIcons.book)),
                          Text(
                            textAlign: TextAlign.center,
                            languageEnglish
                                ? "Documents"
                                : languageNorwegian
                                    ? "Dokumenter"
                                    : languageLithuanian
                                        ? "Dokumentai"
                                        : "Dokumenty",
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
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      height: 120.0,
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return optionsScreen();
                                    },
                                  ),
                                );
                              },
                              icon: FaIcon(FontAwesomeIcons.gear)),
                          Text(
                            textAlign: TextAlign.center,
                            languageEnglish
                                ? "Options"
                                : languageNorwegian
                                    ? "Alternativer"
                                    : languageLithuanian
                                        ? "Nustatymai"
                                        : "Ustawienia",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      height: 120.0,
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              color: Colors.white,
                              onPressed: () {
                                languageEnglish
                                    ? Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                BudgetScreen())))
                                    : languageNorwegian
                                        ? Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    NorwBudgetScreen())))
                                        : languagePolish
                                            ? Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        PolBudgetScreen())))
                                            : Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        LitBudgetScreen())));
                              },
                              icon: FaIcon(FontAwesomeIcons.dollarSign)),
                          Text(
                            textAlign: TextAlign.center,
                            languageEnglish
                                ? "Budget"
                                : languageNorwegian
                                    ? "Budsjett"
                                    : languageLithuanian
                                        ? "Biudžetas"
                                        : "Budżet",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //

            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      height: 120.0,
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: Icon(FontAwesomeIcons.fileShield),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return privacyPolicy();
                                }));
                              }),
                          Text(
                            textAlign: TextAlign.center,
                            languageEnglish
                                ? 'Privacy policy'
                                : languageNorwegian
                                    ? 'Personvernerklæring'
                                    : languageLithuanian
                                        ? "Privatumo politika"
                                        : "Polityka prywatności",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      height: 120.0,
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: Icon(FontAwesomeIcons.question),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return HelpPage();
                                }));
                              }),
                          Text(
                            textAlign: TextAlign.center,
                            languageEnglish
                                ? 'Need help?'
                                : languageNorwegian
                                    ? 'Trenger du hjelp?'
                                    : languageLithuanian
                                        ? "Ar reikia pagalbos"
                                        : "Potrzebujesz pomocy?",
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
        ),
      ),
    );
  }

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(languageEnglish
              ? "Name the file"
              : languageNorwegian
                  ? "Gi filen et navn"
                  : languagePolish
                      ? "Nadaj plikowi nazwę"
                      : "Suteikite failo pavadinimą"),
          content: Column(
            children: [
              TextField(
                controller: savingController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: languageEnglish
                      ? "Enter the name of the file"
                      : languageNorwegian
                          ? "Skriv inn navnet på filen"
                          : languagePolish
                              ? "Wprowadź nazwę pliku"
                              : "Įveskite failo pavadinimą",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Text(languageEnglish
                  ? "Exit"
                  : languageNorwegian
                      ? "Utgang"
                      : languagePolish
                          ? "Wyjście"
                          : "Išeiti"),
            ),
            TextButton(
              onPressed: () {
                submit();
              },
              child: Text(languageEnglish
                  ? "Save"
                  : languageNorwegian
                      ? "Lagre"
                      : languagePolish
                          ? "Zapisz"
                          : "Išsaugoti"),
            ),
          ],
        ),
      );
  void submit() {
    Navigator.of(context).pop(savingController.text);
    savingController.clear();
  }
}
