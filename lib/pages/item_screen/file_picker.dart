import 'package:cost_calculator/constants/empty_models.dart';
import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/functions/load_project_from_json.dart';
import 'package:cost_calculator/functions/save_project_to_json.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:cost_calculator/widgets/saving_rows/saving_row_exteriorwall.dart';
import 'package:cost_calculator/widgets/saving_rows/saving_row_inner_door.dart';
import 'package:cost_calculator/widgets/saving_rows/saving_row_inner_wall.dart';
import 'package:cost_calculator/widgets/saving_rows/saving_row_parquet_laminate.dart';
import 'package:cost_calculator/widgets/saving_rows/saving_row_windows_exterior_door.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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

Future<void> choose() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    PlatformFile file = result.files.first;

    print(file.name);
    print(file.bytes);
    print(file.size);
    print(file.extension);
    print(file.path);
  } else {
    // User canceled the picker
  }
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  TextEditingController savingController = TextEditingController(text: "");
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        drawer: CustomDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Bygg Kalk'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SavingRowOuterWall("Exterior walls"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        SavingRowWindowExteriorDoor("Windows/exterior doors"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SavingRowInnerWall("Interior walls"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SavingRowInnerDoor("Interior door"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SavingRowParquetLaminate("Parquet and laminate"),
                  ),
                  TextButton(
                    onPressed: () async {
                      final fileName = await openDialog();

                      await writeJsonArrayStart(fileName!);

                      await saveProject(fileName, dataInnerWallData);
                      await saveProject(fileName, deckData);
                      await saveProject(fileName, innerDoor);
                      await saveProject(fileName, parquetAndLaminate);
                      await saveProject(fileName, windowsExteriorDoors);
                      await saveProject(fileName, supportSystem);
                      await saveProject(fileName, flooringData);
                      await saveProject(fileName, terraceData);
                      await saveProject(fileName, outerRoofData);
                      await saveProject(fileName, exteriorWallData);
                      await saveProject(fileName, hullRoofingData);
                      await saveProject(fileName, scaffoldingData);
                      await saveProject(fileName, innerStairsData);
                      await saveProject(fileName, wasteData);

                      await writeJsonArrayEnd(fileName);
                    },
                    child: Text("Save project"),
                  ),
                  TextButton(
                    onPressed: () async {
                      final fileName = await openLoadingDialog();

                      var data = await readJsonFile(fileName!);
                      await loadProject(fileName, data, emptyDeckModel);
                      await loadProject(fileName, data, emptyFlooringModel);
                      await loadProject(fileName, data, emptyInnerDoorModel);
                      await loadProject(fileName, data, emptyInnerStairsModel);
                      await loadProject(fileName, data, emptyInnerWallModel);
                      await loadProject(fileName, data, emptyOuterRoofModel);
                      await loadProject(fileName, data, emptyOuterWallModel);
                      await loadProject(
                          fileName, data, emptyParquetAndLaminateModel);
                      await loadProject(fileName, data, emptyScaffoldingModel);
                      await loadProject(
                          fileName, data, emptySupportSystemModel);
                      await loadProject(fileName, data, emptyTerraceModel);
                      await loadProject(
                          fileName, data, emptyWindowsExteriorDoorsModel);
                    },
                    child: Text("Load a project"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> openLoadingDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Name of the file you want to load"),
          content: TextField(
            controller: loadingController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Enter the name of the file",
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  submitLoading();
                },
                child: Text("Load")),
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
          title: Text(languageEnglish ? "Name the file" : "Gi filen et navn"),
          content: Column(
            children: [
              TextField(
                controller: savingController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: languageEnglish
                      ? "Enter the name of the file"
                      : "Skriv inn navnet på filen",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(languageEnglish ? "Cancel" : "Avbryt"),
            ),
            TextButton(
                onPressed: () {
                  submit();
                },
                child: Text(languageEnglish
                    ? "Save"
                    : languageNorwegian
                        ? "Lagre"
                        : "SaveOtherLang")),
          ],
        ),
      );
  void submit() {
    Navigator.of(context).pop(savingController.text);
    savingController.clear();
  }
}
