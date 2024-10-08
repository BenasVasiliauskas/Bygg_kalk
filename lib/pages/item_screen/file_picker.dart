import 'dart:io';

import 'package:cost_calculator/constants/empty_models.dart';
import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/functions/lit_load_project_from_json.dart';
import 'package:cost_calculator/functions/load_project_from_json.dart';
import 'package:cost_calculator/functions/norw_load_project_from_json.dart';
import 'package:cost_calculator/functions/pol_load_project_from_json.dart';
import 'package:cost_calculator/functions/save_project_to_json.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/observer/app_life_cycle_observer.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart' as path;
import 'package:share_plus/share_plus.dart'; // Import the share_plus package

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

TextEditingController loadingController = TextEditingController();
TextEditingController savingController = TextEditingController();

bool? isDescriptionChecked = false;
bool? isUnitsChecked = false;
bool? isChecked = false;
bool? isQuantityChecked = false;
bool? isMaterialQuantityChecked = false;
bool? isHoursChecked = false;
bool? isTotalHoursChecked = false;
bool? isJobCostChecked = false;
bool? isMaterialChecked = false;
bool? isTotalMaterialsCostChecked = false;
bool? isTotalPriceChecked = false;

class _FilePickerScreenState extends State<FilePickerScreen> {
  final AppLifecycleObserver _observer = AppLifecycleObserver();
  TextEditingController savingController = TextEditingController(text: "");
  List<io.FileSystemEntity> files = [];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_observer);
    super.initState();
    _listofFiles(); // List files at the beginning
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        drawer: CustomDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Bygg Kalk'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: files.isNotEmpty
                    ? ListView.builder(
                        itemCount: files.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: Key(files[index].path),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (direction) {
                              _deleteFile(files[index].path);
                              setState(() {
                                files.removeAt(index);
                              });
                            },
                            background: Container(
                              color: Colors.redAccent,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                            child: _buildFileCard(files[index]),
                          );
                        },
                      )
                    : Center(
                        child: Text(languageEnglish
                            ? "No files found."
                            : languageNorwegian
                                ? "Ingen filer funnet."
                                : languagePolish
                                    ? "Nie znaleziono plików."
                                    : "Failų nerasta.")),
              ),
              TextButton(
                onPressed: () async {
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
                child: Text(
                  languageEnglish
                      ? "Save project"
                      : languageNorwegian
                          ? "Lagre prosjekt"
                          : languageLithuanian
                              ? "Išsaugoti projektą"
                              : "Zapisz projekt",
                ),
              ),
              TextButton(
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                          type: FileType.custom, allowedExtensions: ["json"]);

                  if (result != null) {
                    PlatformFile file = result.files.first;
                    final fileName = file.name;
                    var data = await readJsonFileSelected(fileName);

                    if (languageEnglish) {
                      await loadProject(fileName, data, emptyDeckModel);
                      await loadProject(fileName, data, emptyFlooringModel);
                      await loadProject(fileName, data, emptyInnerDoorModel);
                      await loadProject(fileName, data, emptyInnerStairsModel);
                      await loadProject(fileName, data, emptyInnerWallModel);
                      await loadProject(fileName, data, emptyOuterRoofModel);
                      await loadProject(fileName, data, emptyOuterWallModel);
                      await loadProject(fileName, data, emptyScaffoldingModel);
                      await loadProject(
                          fileName, data, emptySupportSystemModel);
                      await loadProject(fileName, data, emptyTerraceModel);
                      await loadProject(
                          fileName, data, emptyWindowsExteriorDoorsModel);
                    } else if (languageNorwegian) {
                      await norwLoadProject(fileName, data, emptyDeckModel);
                      await norwLoadProject(fileName, data, emptyFlooringModel);
                      await norwLoadProject(
                          fileName, data, emptyInnerDoorModel);
                      await norwLoadProject(
                          fileName, data, emptyInnerStairsModel);
                      await norwLoadProject(
                          fileName, data, emptyInnerWallModel);
                      await norwLoadProject(
                          fileName, data, emptyOuterRoofModel);
                      await norwLoadProject(
                          fileName, data, emptyOuterWallModel);
                      await norwLoadProject(
                          fileName, data, emptyScaffoldingModel);
                      await norwLoadProject(
                          fileName, data, emptySupportSystemModel);
                      await norwLoadProject(fileName, data, emptyTerraceModel);
                      await norwLoadProject(
                          fileName, data, emptyWindowsExteriorDoorsModel);
                    } else if (languagePolish) {
                      await polLoadProject(fileName, data, emptyDeckModel);
                      await polLoadProject(fileName, data, emptyFlooringModel);
                      await polLoadProject(fileName, data, emptyInnerDoorModel);
                      await polLoadProject(
                          fileName, data, emptyInnerStairsModel);
                      await polLoadProject(fileName, data, emptyInnerWallModel);
                      await polLoadProject(fileName, data, emptyOuterRoofModel);
                      await polLoadProject(fileName, data, emptyOuterWallModel);
                      await polLoadProject(
                          fileName, data, emptyScaffoldingModel);
                      await polLoadProject(
                          fileName, data, emptySupportSystemModel);
                      await polLoadProject(fileName, data, emptyTerraceModel);
                      await polLoadProject(
                          fileName, data, emptyWindowsExteriorDoorsModel);
                    } else if (languageLithuanian) {
                      await litLoadProject(fileName, data, emptyDeckModel);
                      await litLoadProject(fileName, data, emptyFlooringModel);
                      await litLoadProject(fileName, data, emptyInnerDoorModel);
                      await litLoadProject(
                          fileName, data, emptyInnerStairsModel);
                      await litLoadProject(fileName, data, emptyInnerWallModel);
                      await litLoadProject(fileName, data, emptyOuterRoofModel);
                      await litLoadProject(fileName, data, emptyOuterWallModel);
                      await litLoadProject(
                          fileName, data, emptyScaffoldingModel);
                      await litLoadProject(
                          fileName, data, emptySupportSystemModel);
                      await litLoadProject(fileName, data, emptyTerraceModel);
                      await litLoadProject(
                          fileName, data, emptyWindowsExteriorDoorsModel);
                    }
                  }
                },
                child: Text(
                  languageEnglish
                      ? "Load a project"
                      : languageNorwegian
                          ? "Last inn et prosjekt"
                          : languageLithuanian
                              ? "Užkrauti projektą"
                              : "Załaduj projekt",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFileCard(io.FileSystemEntity file) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      elevation: 5, // Shadow effect
      child: ListTile(
        leading: Icon(Icons.insert_drive_file, color: Colors.blueAccent),
        title: Text(
          prettifyFileName(path.basename(file.path)), // Use prettified name
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onPressed: () {
                // Perform an action when the arrow is tapped
                _openFile(file.path);
              },
            ),
            IconButton(
              icon: Icon(Icons.share, color: Colors.grey),
              onPressed: () {
                _shareFile(file.path); // Share the file
              },
            ),
          ],
        ),
      ),
    );
  }

  String prettifyFileName(String fileName) {
    String nameWithoutExtension = fileName.replaceAll('.json', '');
    String nameWithSpaces = nameWithoutExtension.replaceAll('_', ' ');
    return nameWithSpaces.split(' ').map((word) {
      return word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '';
    }).join(' ');
  }

  Future<void> _shareFile(String filePath) async {
    final file = XFile(filePath);
    Share.shareXFiles([file],
        text: languageEnglish
            ? 'Sharing JSON file via Gmail'
            : languageNorwegian
                ? 'Deling av JSON-fil via Gmail'
                : languagePolish
                    ? 'Udostępnianie pliku JSON za pośrednictwem Gmaila'
                    : 'Bendrinimas JSON failo naudojant Gmailą');
  }

  Future<void> _deleteFile(String filePath) async {
    try {
      final file = io.File(filePath);
      if (await file.exists()) {
        await file.delete(); // Delete the file
      }
    } catch (e) {
      print('Error deleting file: $e');
    }
  }

  void _openFile(String filePath) {
    // Open or handle the selected file here
    print("Opening file: $filePath");
  }

  Future<void> _listofFiles() async {
    final directory = await localPath;
    final jsonFiles = io.Directory(directory)
        .listSync()
        .where((file) => file.path.endsWith('.json'))
        .toList();

    setState(() {
      files = jsonFiles;
    });
  }

  Future<String?> openLoadingDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(languageEnglish
              ? "Name of the file you want to load"
              : languageNorwegian
                  ? "Navnet på filen du vil laste inn"
                  : languagePolish
                      ? "Nazwa pliku, który chcesz załadować"
                      : "Failo pavadinimas, kurį norite įkelti"),
          content: TextField(
            controller: loadingController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: languageEnglish
                  ? "Enter the name of the file"
                  : languageNorwegian
                      ? "Skriv inn navnet på filen"
                      : languagePolish
                          ? "Wprowadź nazwę pliku"
                          : "Įveskite",
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  submitLoading();
                },
                child: Text(languageEnglish
                    ? "Load"
                    : languageNorwegian
                        ? "Last inn"
                        : languagePolish
                            ? "Załaduj"
                            : "Įkelti")),
          ],
        ),
      );

  void submitLoading() {
    Navigator.of(context).pop(loadingController.text);
    loadingController.clear();
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
                Navigator.of(context).pop();
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
}
