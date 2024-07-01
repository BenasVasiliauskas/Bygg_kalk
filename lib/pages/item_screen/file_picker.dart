import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
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
                      //reading like this is fine, so we can just write 50 mllion save calls?
                      var dataInnerWall = dataInnerWallData;
                      var dataDeckData = deckData;
                      var dataInnerDoor = innerDoor;
                      var dataParquetAndLaminate = parquetAndLaminate;
                      var dataWindowsExteriorDoors = windowsExteriorDoors;
                      var dataSupportSystem = supportSystem;
                      var dataFlooringData = flooringData;
                      var dataTerraceData = terraceData;
                      var dataOuterRoofData = outerRoofData;
                      var dataExteriorWallData = exteriorWallData;
                      var dataHullRoofingData = hullRoofingData;
                      var dataScaffoldingData = scaffoldingData;
                      var dataInnerStairsData = innerStairsData;
                      var dataWasteData = wasteData;

                      await writeJsonArrayStart(fileName!);
                      await saveProject(fileName, dataInnerWall);
                      await saveProject(fileName, dataDeckData);
                      await saveProject(fileName, dataInnerDoor);
                      await saveProject(fileName, dataParquetAndLaminate);
                      await saveProject(fileName, dataWindowsExteriorDoors);
                      await saveProject(fileName, dataSupportSystem);
                      await saveProject(fileName, dataFlooringData);
                      await saveProject(fileName, dataTerraceData);
                      await saveProject(fileName, dataOuterRoofData);
                      await saveProject(fileName, dataExteriorWallData);
                      await saveProject(fileName, dataHullRoofingData);
                      await saveProject(fileName, dataScaffoldingData);
                      await saveProject(fileName, dataInnerStairsData);
                      await saveProject(fileName, dataWasteData);

                      await writeJsonArrayEnd(fileName);
                    },
                    child: Text("Save project"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
