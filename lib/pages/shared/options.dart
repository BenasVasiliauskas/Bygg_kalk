import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
import 'package:cost_calculator/pages/shared/globals/selected_language.dart';
import 'package:cost_calculator/pages/shared/theme/theme_provider.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class optionsScreen extends StatefulWidget {
  const optionsScreen({super.key});

  @override
  State<optionsScreen> createState() => _optionsScreenState();
}

class _optionsScreenState extends State<optionsScreen> {
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
        return AlertDialog(
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
              ? Text("Time coefficient")
              : languageNorwegian
                  ? Text('Tidskoeffisient')
                  : languageLithuanian
                      ? Text("Laiko koeficientas")
                      : Text("Współczynnik czasu"),
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
              ? Text("Surcharge")
              : languageNorwegian
                  ? Text('Påslag')
                  : languageLithuanian
                      ? Text("Priemoka")
                      : Text("Dopłata"),
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
              ? Text("Costs")
              : languageNorwegian
                  ? Text('Kostnader')
                  : languageLithuanian
                      ? Text("Išlaidos")
                      : Text("Koszty"),
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
    return Scaffold(
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
            ),
            Row(
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
            Row(
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
            Row(
              children: [
                Icon(FontAwesomeIcons.barcode),
                TextButton(
                  child: languageEnglish
                      ? Text("Surcharge")
                      : languageNorwegian
                          ? Text('Påslag')
                          : languageLithuanian
                              ? Text("Antkainis")
                              : Text("Dopłata"),
                  onPressed: () {
                    showMarkupDialog(context);
                  },
                )
              ],
            ),
            Row(
              children: [
                Icon(FontAwesomeIcons.fileExcel),
                TextButton(
                  child: languageEnglish
                      ? Text("Site costs")
                      : languageNorwegian
                          ? Text('Rigg og Drift')
                          : languageLithuanian
                              ? Text("Statybvietes išlaidos")
                              : Text("Koszty witryny"),
                  onPressed: () {
                    showCostsDialog(context);
                  },
                )
              ],
            ),
            Row(
              children: [
                Icon(FontAwesomeIcons.tag),
                TextButton(
                  child: languageEnglish
                      ? Text("Time coefficient")
                      : languageNorwegian
                          ? Text('Tidskoeffisient')
                          : languageLithuanian
                              ? Text("Laiko koeficientas")
                              : Text("Współczynnik czasu"),
                  onPressed: () {
                    showTimeCoefficientDialog(context);
                  },
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: languageEnglish == false
                      ? Text('Norsk')
                      : Text('Norwegian'),
                ),
                Switch(
                  value: languageEnglish,
                  onChanged: onLanguageChanged,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: languageEnglish == true
                      ? Text('English')
                      : Text('Engelsk'),
                ),
              ],
            ),
          ],
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
    });
  }

  void languageChangedToNorwegian() {
    setState(() {
      languageEnglish = false;
      languageNorwegian = true;
      languagePolish = false;
      languageLithuanian = false;
    });
  }

  void languageChangedToPolish() {
    setState(() {
      languageEnglish = false;
      languageNorwegian = false;
      languagePolish = true;
      languageLithuanian = false;
    });
  }

  void languageChangedToLithuanian() {
    setState(() {
      languageEnglish = false;
      languageNorwegian = false;
      languagePolish = false;
      languageLithuanian = true;
    });
  }
}
