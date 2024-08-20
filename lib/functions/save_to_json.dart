import 'dart:convert';
import 'dart:io';
import 'package:cost_calculator/constants/language.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get localPath async {
  final directory;
  if (Platform.isIOS) {
    directory = await getApplicationDocumentsDirectory();
  } else if (Platform.isAndroid) {
    directory = Directory('/storage/emulated/0/Download');
  } else if (Platform.isWindows) {
    return Directory.current.path;
  } else {
    directory = await getApplicationDocumentsDirectory();
  }
  return directory.path;
}

Future<File> localFile(String name) async {
  final path = await localPath;

  return File('$path/${name}.json');
}

Future<File> localDartFile(String name) async {
  final path = await localPath;

  return File('$path/${name}.dart');
}

Future<void> fileDeleteIfExists(String name) async {
  final file = await localFile(name);
  if (await file.exists()) {
    await file.delete();
  }
}

Future<File> writeJsonArrayStart(String name) async {
  final file = await localFile(name);
  await file.writeAsString(
    mode: FileMode.writeOnlyAppend,
    "[",
  );

  return file;
}

Future<File> writeJsonComma(String name) async {
  final file = await localFile(name);
  await file.writeAsString(
    mode: FileMode.writeOnlyAppend,
    ",",
  );

  return file;
}

Future<File> writeJsonArrayEnd(String name) async {
  final file = await localFile(name);
  await file.writeAsString(
    mode: FileMode.writeOnlyAppend,
    "]",
  );

  return file;
}

Future<File> writeProjectToJson(var name, int lengthOfModel) async {
  final file = await readJsonFile(name);

  // for (int i = 0; i < lengthOfModel; i++) {
  //   print(exteriorWallData[i].name);
  // }

  return file;
}

Future<File> writeJson(BuildContext context, var model, String name) async {
  final file = await localFile(name);
  if (await file.exists()) {
    // Show a dialog to ask the user if they want to overwrite the file
    bool shouldOverwrite = await _showOverwriteDialog(context, name);

    if (!shouldOverwrite) {
      languageEnglish
          ? ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Data saving has been canceled')))
          : languageNorwegian
              ? ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Lagring av data har blitt avbrutt')))
              : languagePolish
                  ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Zapisywanie danych zostało anulowane')))
                  : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Duomenų saugojimas buvo atšauktas')));
      // User chose to cancel, so return early and do not overwrite the file
      return file;
    }
  }
  // Convert list of objects to a list of maps
  Map<String, dynamic> jsonData = model.toJson();
  // Write the JSON string to the file
  await file.writeAsString(
    mode: FileMode.writeOnlyAppend,
    jsonEncode(jsonData),
  );
  languageEnglish
      ? ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data has been saved as $name.json')))
      : languageNorwegian
          ? ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Dataene er lagret som $name.json')))
          : languagePolish
              ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Dane zostały zapisane jako $name.json')))
              : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Duomenys išsaugoti kaip $name.json')));
  return file;
}

Future<bool> _showOverwriteDialog(BuildContext context, String fileName) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(languageEnglish
              ? "File Already Exists"
              : languageNorwegian
                  ? "Fil eksisterer allerede"
                  : languagePolish
                      ? "Plik już istnieje"
                      : "Failas jau egzistuoja"),
          content: Text(
            languageEnglish
                ? "A file named '$fileName.json' already exists. Do you want to overwrite it?"
                : languageNorwegian
                    ? "En fil med navnet '$fileName.json' eksisterer allerede. Vil du overskrive den?"
                    : languagePolish
                        ? "Plik o nazwie '$fileName.json' już istnieje. Czy chcesz go nadpisać?"
                        : "Failas pavadinimu '$fileName.json' jau egzistuoja. Ar norite jį perrašyti?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(languageEnglish
                  ? "Cancel"
                  : languageNorwegian
                      ? "Avbryt"
                      : languagePolish
                          ? "Anuluj"
                          : "Atšaukti"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(languageEnglish
                  ? "Overwrite"
                  : languageNorwegian
                      ? "Overskriv"
                      : languagePolish
                          ? "Nadpisać"
                          : "Perrašyti"),
            ),
          ],
        ),
      ) ??
      false; // Default to false if the dialog is dismissed
}

Future<File> writeJsonOriginal(var model, String name) async {
  final file = await localFile(name);
  // Convert list of objects to a list of maps
  Map<String, dynamic> jsonData = model.toJson();
  // Write the JSON string to the file
  await file.writeAsString(
    mode: FileMode.writeOnlyAppend,
    jsonEncode(jsonData),
  );

  return file;
}

Future<File> _jsonFile(String fileName) async {
  final path = await localPath;

  return File('$path/${fileName}.json');
}

Future<File> _jsonFileSelected(String fileName) async {
  final path = await localPath;

  return File('$path/${fileName}');
}

Future readJsonFileSelected(String fileName) async {
  String jsonContent = "";
  File file = await _jsonFileSelected(fileName);
  try {
    jsonContent = await file.readAsString();
    return json.decode(jsonContent);
  } catch (e) {
    print("Error reading from file: $e");
  }
  return null;
}

Future readJsonFile(String fileName) async {
  String jsonContent = "";
  File file = await _jsonFile(fileName);
  try {
    jsonContent = await file.readAsString();
    return json.decode(jsonContent);
  } catch (e) {
    print("Error reading from file: $e");
  }
  return null;
}
