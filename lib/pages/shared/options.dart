import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/globals/selected_language.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/pages/shared/theme/theme_provider.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:cost_calculator/constants/shared_prefs.dart';

class optionsScreen extends StatefulWidget {
  const optionsScreen({super.key});

  @override
  State<optionsScreen> createState() => _optionsScreenState();
}

class _optionsScreenState extends State<optionsScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    String? language = await SharedPrefs.getLanguage();
    setState(() {
      if (language == 'English') {
        languageChangedToEnglish();
      } else if (language == 'Norwegian') {
        languageChangedToNorwegian();
      } else if (language == 'Lithuanian') {
        languageChangedToLithuanian();
      } else if (language == 'Polish') {
        languageChangedToPolish();
      }
    });
  }

  void onLanguageChanged(bool newValue) {
    setState(() {
      if (languageEnglish) {
        languageChangedToNorwegian();
      } else
        languageChangedToEnglish();
    });
  }

  //Provider.of<ThemeProvider>(context, listen: false).toggleTheme();

  void showGeneralDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AlertDialog(
            title: languageEnglish
                ? Text("General")
                : languageNorwegian
                    ? Text("Generell")
                    : languageLithuanian
                        ? Text("Bendri")
                        : Text("Ogólny"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(selectedOption),
                RadioListTile<String>(
                  title: languageEnglish
                      ? Text("English")
                      : languageNorwegian
                          ? Text("Engelsk")
                          : languageLithuanian
                              ? Text("Anglų")
                              : Text("Angielski"),
                  value: 'English',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value!;
                      languageChangedToEnglish();
                    });
                    Navigator.of(context).pop(); // Close the dialog
                    showGeneralDialog(
                        context); // Reopen the dialog to reflect the change
                  },
                ),
                RadioListTile<String>(
                  title: languageEnglish
                      ? Text("Norwegian")
                      : languageNorwegian
                          ? Text("Norsk")
                          : languageLithuanian
                              ? Text("Norwegų")
                              : Text("Norweski"),
                  value: 'Norwegian',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value!;
                      languageChangedToNorwegian();
                    });
                    Navigator.of(context).pop(); // Close the dialog
                    showGeneralDialog(
                        context); // Reopen the dialog to reflect the change
                  },
                ),
                RadioListTile<String>(
                  title: languageEnglish
                      ? Text("Lithuanian")
                      : languageNorwegian
                          ? Text("Litauisk")
                          : languageLithuanian
                              ? Text("Lietuvių")
                              : Text("Litewski"),
                  value: 'Lithuanian',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value!;
                      languageChangedToLithuanian();
                    });
                    Navigator.of(context).pop(); // Close the dialog
                    showGeneralDialog(
                        context); // Reopen the dialog to reflect the change
                  },
                ),
                RadioListTile<String>(
                  title: languageEnglish
                      ? Text("Polish")
                      : languageNorwegian
                          ? Text("Polsk")
                          : languageLithuanian
                              ? Text("Lenkų")
                              : Text("Polski"),
                  value: 'Polish',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value!;
                      languageChangedToPolish();
                    });
                    Navigator.of(context).pop(); // Close the dialog
                    showGeneralDialog(
                        context); // Reopen the dialog to reflect the change
                  },
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: languageEnglish
                    ? Text("Close")
                    : languageNorwegian
                        ? Text('Lukk')
                        : languageLithuanian
                            ? Text("Uždaryti")
                            : Text("Zamknij"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showDisplayDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: languageEnglish
              ? Text("Display settings")
              : languageNorwegian
                  ? Text('Skjerminnstillinger')
                  : languageLithuanian
                      ? Text("Ekrano nustatymai")
                      : Text("Ustawienia wyświetlacza"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
                child: languageEnglish
                    ? Text("Toggle theme")
                    : languageNorwegian
                        ? Text('Bytt tema')
                        : languageLithuanian
                            ? Text("Perjungti temą")
                            : Text("Przełączanie motywu"),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: languageEnglish
                  ? Text("Close")
                  : languageNorwegian
                      ? Text('Lukk')
                      : languageLithuanian
                          ? Text("Uždaryti")
                          : Text("Zamknij"),
            )
          ],
        );
      },
    );
  }

  void showHourlyRateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: languageEnglish
              ? Text("Hourly Rate")
              : languageNorwegian
                  ? Text('Timepris')
                  : languageLithuanian
                      ? Text("Valandinis įkainis")
                      : Text("Stawka godzinowa"),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  onChanged: (value) {
                    hourlyRate = double.parse(value);
                  },
                  controller: hourlyRateTextEditingController, //change
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("nok"),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: languageEnglish
                  ? Text("Close")
                  : languageNorwegian
                      ? Text('Lukk')
                      : languageLithuanian
                          ? Text("Uždaryti")
                          : Text("Zamknij"),
            )
          ],
        );
      },
    );
  }

  void showTimeCoefficientDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: languageEnglish
              ? Text("Time factor")
              : languageNorwegian
                  ? Text('Tidsfaktor')
                  : languageLithuanian
                      ? Text("Laiko veiksnys")
                      : Text("Czynnik czasu"),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  onChanged: (value) {
                    timeCoefficient = double.parse(value);
                  },
                  controller: timeCoefficientTextEditingController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("%"),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: languageEnglish
                  ? Text("Close")
                  : languageNorwegian
                      ? Text('Lukk')
                      : languageLithuanian
                          ? Text("Uždaryti")
                          : Text("Zamknij"),
            )
          ],
        );
      },
    );
  }

  void showMarkupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: languageEnglish
              ? Text("Markup")
              : languageNorwegian
                  ? Text('Påslag')
                  : languageLithuanian
                      ? Text("Antkainis")
                      : Text("Narzut"),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  onChanged: (value) {
                    markup = double.parse(value);
                  },
                  controller: markupTexteditingController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("%"),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: languageEnglish
                  ? Text("Close")
                  : languageNorwegian
                      ? Text('Lukk')
                      : languageLithuanian
                          ? Text("Uždaryti")
                          : Text("Zamknij"),
            )
          ],
        );
      },
    );
  }

  void showCostsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: languageEnglish
              ? Text("Site costs")
              : languageNorwegian
                  ? Text('Rigg og Drift')
                  : languageLithuanian
                      ? Text("Statybvietės išlaidos")
                      : Text("Koszty budowy"),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  onChanged: (value) {
                    costs = double.parse(value);
                  },
                  controller: costsTextEditingController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("%"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: languageEnglish
                  ? Text("Close")
                  : languageNorwegian
                      ? Text('Lukk')
                      : languageLithuanian
                          ? Text("Uždaryti")
                          : Text("Zamknij"),
            )
          ],
        );
      },
    );
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
        resizeToAvoidBottomInset: false,
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: languageEnglish
              ? Text("Settings")
              : languageNorwegian
                  ? Text('Innstillinger')
                  : languageLithuanian
                      ? Text("Nustatymai")
                      : Text("Ustawienia"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    languageEnglish
                        ? Text("Primary")
                        : languageNorwegian
                            ? Text('Primær')
                            : languageLithuanian
                                ? Text("Pirminiai")
                                : Text("Podstawowy"),
                  ],
                ),
                Row(
                  children: [
                    Tooltip(
                        message: languageEnglish
                            ? "Change language"
                            : languageNorwegian
                                ? "Endre språk"
                                : languageLithuanian
                                    ? "Pakeisti kalbą"
                                    : "Zmień język",
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.gear),
                            TextButton(
                              child: languageEnglish
                                  ? Text("General")
                                  : languageNorwegian
                                      ? Text('Generelt')
                                      : languageLithuanian
                                          ? Text("Bendri")
                                          : Text("Ogólne"),
                              onPressed: () {
                                showGeneralDialog(context);
                              },
                            )
                          ],
                        )),
                  ],
                ),
                Row(
                  children: [
                    Tooltip(
                      message: languageEnglish
                          ? "Change the apps theme (dark/light)"
                          : languageNorwegian
                              ? "Endre appens tema (mørk/lys)"
                              : languageLithuanian
                                  ? "Pakeisti programos temą (tamsią/šviesią)"
                                  : "Zmień motyw aplikacji (ciemny/jasny)",
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.folderPlus),
                          TextButton(
                            child: languageEnglish
                                ? Text("Display")
                                : languageNorwegian
                                    ? Text('Visning')
                                    : languageLithuanian
                                        ? Text("Ekrano")
                                        : Text("Wyświetlacz"),
                            onPressed: () {
                              showDisplayDialog(context);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Tooltip(
                      message: languageEnglish
                          ? "Change the hourly rate"
                          : languageNorwegian
                              ? "Endre timepris"
                              : languageLithuanian
                                  ? "Pakeisti valandinį įkainį"
                                  : "Zmień stawkę godzinową",
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.boxArchive),
                          TextButton(
                            child: languageEnglish
                                ? Text("Hourly rate")
                                : languageNorwegian
                                    ? Text('Time pris')
                                    : languageLithuanian
                                        ? Text("Val. įkainis")
                                        : Text("Stawka godzinowa"),
                            onPressed: () {
                              showHourlyRateDialog(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Tooltip(
                      message: languageEnglish
                          ? "Markup in the construction sector is an additional charge added to the material cost to cover indirect expenses or profit. It typically ranges from 5% to 20%, depending on the project."
                          : languageNorwegian
                              ? "Påslag i byggebransjen er et tillegg som legges til materialkostnaden for å dekke indirekte kostnader eller fortjeneste. Det utgjør vanligvis 5% til 20%, avhengig av prosjektet."
                              : languageLithuanian
                                  ? "Antkainis statybos sektoriuje yra papildomas mokestis, pridedamas prie medžiagų kainos, siekiant padengti netiesiogines išlaidas ar pelną. Paprastai tai sudaro 5%–20%, priklausomai nuo projekto."
                                  : "Narzut w sektorze budowlanym to dodatkowa opłata doliczana do ceny materiałów, mająca na celu pokrycie kosztów pośrednich lub osiągnięcie zysku. Zwykle wynosi od 5% do 20%, w zależności od projektu.",
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.barcode),
                          TextButton(
                            child: languageEnglish
                                ? Text("Markup")
                                : languageNorwegian
                                    ? Text('Påslag')
                                    : languageLithuanian
                                        ? Text("Antkainis")
                                        : Text("Narzut"),
                            onPressed: () {
                              showMarkupDialog(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Tooltip(
                      message: languageEnglish
                          ? "Site costs in the construction sector usually account for 5–15% of additional costs added to labor costs, depending on the size and complexity of the project."
                          : languageNorwegian
                              ? "Rigg og Drift i byggebransjen utgjør vanligvis 5–15% av tilleggskostnader lagt til arbeidskostnader, avhengig av prosjektets størrelse og kompleksitet."
                              : languageLithuanian
                                  ? "Statybvietės išlaidos statybos sektoriuje dažniausiai sudaro 5–15% papildomų išlaidų, pridėtų prie darbo kaštų, priklausomai nuo projekto dydžio ir sudėtingumo."
                                  : "Koszty budowy w sektorze budowlanym zazwyczaj stanowią 5–15% dodatkowych kosztów, doliczanych do kosztów pracy, w zależności od wielkości i złożoności projektu",
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.fileExcel),
                          TextButton(
                            child: languageEnglish
                                ? Text("Site costs")
                                : languageNorwegian
                                    ? Text('Rigg og Drift')
                                    : languageLithuanian
                                        ? Text("Statybvietės išlaidos")
                                        : Text("Koszty witryny"),
                            onPressed: () {
                              showCostsDialog(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Tooltip(
                      message: languageEnglish
                          ? "Time factor in the construction sector usually adds 10–20% additional time to the initial work time estimate, depending on project complexity, work efficiency, and other conditions."
                          : languageNorwegian
                              ? "Tidsfaktor i byggebransjen legger vanligvis til 10–20% ekstra tid til den opprinnelige arbeidsvurderingen, avhengig av prosjektets kompleksitet, arbeidsytelse og andre forhold."
                              : languageLithuanian
                                  ? "Laiko veiksnys statybos sektoriuje paprastai prideda 10–20% papildomo laiko prie pradinio darbo laiko įvertinimo, atsižvelgiant į projekto sudėtingumą, darbo našumą ir kitas sąlygas."
                                  : "Czynnik czasu w sektorze budowlanym zazwyczaj dodaje 10–20% dodatkowego czasu do wstępnej oceny czasu pracy, w zależności od złożoności projektu, wydajności pracy i innych warunków.",
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.tag),
                          TextButton(
                            child: languageEnglish
                                ? Text("Time factor")
                                : languageNorwegian
                                    ? Text('Tidsfaktor')
                                    : languageLithuanian
                                        ? Text("Laiko veiksnys")
                                        : Text("Współczynnik czasu"),
                            onPressed: () {
                              showTimeCoefficientDialog(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void languageChangedToEnglish() {
    setState(() {
      languageEnglish = true;
      languageNorwegian = false;
      languagePolish = false;
      languageLithuanian = false;
      SharedPrefs.setLanguage('English');
    });
  }

  void languageChangedToNorwegian() {
    setState(() {
      languageEnglish = false;
      languageNorwegian = true;
      languagePolish = false;
      languageLithuanian = false;
      SharedPrefs.setLanguage('Norwegian');
    });
  }

  void languageChangedToPolish() {
    setState(() {
      languageEnglish = false;
      languageNorwegian = false;
      languagePolish = true;
      languageLithuanian = false;
      SharedPrefs.setLanguage('Polish');
    });
  }

  void languageChangedToLithuanian() {
    setState(() {
      languageEnglish = false;
      languageNorwegian = false;
      languagePolish = false;
      languageLithuanian = true;
      SharedPrefs.setLanguage('Lithuanian');
    });
  }
}
