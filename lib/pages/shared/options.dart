import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/pages/shared/globals/calculation_variables.dart';
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
      languageEnglish = newValue;
    });
  }

  //Provider.of<ThemeProvider>(context, listen: false).toggleTheme();

  String _selectedOption = 'English';

  void showGeneralDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bendri'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_selectedOption),
              RadioListTile<String>(
                title: Text('Anglu'),
                value: 'English',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value!;
                    languageChangedToEnglish();
                  });
                  Navigator.of(context).pop(); // Close the dialog
                  showGeneralDialog(
                      context); // Reopen the dialog to reflect the change
                },
              ),
              RadioListTile<String>(
                title: Text('Norvegu'),
                value: 'Norwegian',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value!;
                    languageChangedToNorwegian();
                  });
                  Navigator.of(context).pop(); // Close the dialog
                  showGeneralDialog(
                      context); // Reopen the dialog to reflect the change
                },
              ),
              RadioListTile<String>(
                title: Text('Lietuviu'),
                value: 'Lithuanian',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value!;
                    languageChangedToLithuanian();
                  });
                  Navigator.of(context).pop(); // Close the dialog
                  showGeneralDialog(
                      context); // Reopen the dialog to reflect the change
                },
              ),
              RadioListTile<String>(
                title: Text('Lenku'),
                value: 'Polish',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value!;
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
              child: Text('Close'),
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
          title: Text("Display"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                  child: Text("Change theme"))
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
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
          title: Text("Hourly Rate"),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  onChanged: (value) {},
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
              child: Text('Close'),
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
          title: Text("Time coefficient"),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  onChanged: (value) {},
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
              child: Text('Close'),
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
          title: Text("Markup"),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  onChanged: (value) {},
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
              child: Text('Close'),
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
          title: Text("Costs"),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  onChanged: (value) {},
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
              child: Text('Close'),
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
        title: Text("Options"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [Text("Pirminiai")],
            ),
            Row(
              children: [
                Icon(FontAwesomeIcons.gear),
                TextButton(
                  child: Text("Bendri"),
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
                  child: Text("Rodymas"),
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
                  child: Text("Val. įkainis"),
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
                  child: Text("Antkainis"),
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
                  child: Text("Statybvietės išlaidos"),
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
                  child: Text("Laiko koeficientas"),
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
                  child: languageEnglish == false
                      ? Text('Engelsk')
                      : Text('English'),
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
