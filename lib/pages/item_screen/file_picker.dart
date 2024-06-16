import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/models/windows_exterior_doors_model.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:cost_calculator/widgets/saving_rows/saving_row_exteriorwall.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bygg Kalk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SavingRowOuterWall("Exterior walls"),
            Row(
              children: [
                Text("Windows/exterior door"),
                TextButton(
                  onPressed: () async {
                    final fileName = await openDialog();
                    //if name to file wasnt given
                    if (fileName == null || fileName.isEmpty) {
                      return;
                    }
                    WindowsAndExteriorDoorsModel windowsExteriorDoorsModel;
                    await fileDeleteIfExists(fileName);
                    //write a bracket for the start of the array
                    await writeJsonArrayStart(fileName);
                    for (var i = 0; i < windowsExteriorDoors.length; i++) {
                      windowsExteriorDoorsModel = WindowsAndExteriorDoorsModel(
                        name: windowsExteriorDoors[i].name,
                        description: windowsExteriorDoors[i].description,
                        unit: windowsExteriorDoors[i].unit,
                        quantity: windowsExteriorDoors[i].quantity,
                        laborHours1: windowsExteriorDoors[i].laborHours1,
                        laborHours2: windowsExteriorDoors[i].laborHours2,
                        laborCost: windowsExteriorDoors[i].laborCost,
                        material: windowsExteriorDoors[i].material,
                        materials: windowsExteriorDoors[i].materials,
                        totalPrice: windowsExteriorDoors[i].totalPrice,
                      );
                      //write model data
                      await writeJson(windowsExteriorDoorsModel, fileName);
                      //write a comma for the next element, check if the length is over equals 1 and if it isnt the last element
                      if (windowsExteriorDoors.length >= 1 &&
                          i != windowsExteriorDoors.length - 1) {
                        await writeJsonComma(fileName);
                      }
                    }
                    await writeJsonArrayEnd(fileName);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Data has been saved as $fileName.json'),
                      ),
                    );
                  },
                  child: Text("Save"),
                ),
                TextButton(
                  child: Text(
                    languageEnglish
                        ? "Load"
                        : languageLithuanian
                            ? "Užkrauti"
                            : languageNorwegian
                                ? "Load in norwegian"
                                : "Load in polish",
                  ),
                  onPressed: () {
                    choose();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Name the file"),
          content: Column(
            children: [
              TextField(
                controller: savingController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Enter the name of the file",
                ),
              ),
              CheckboxListTile(
                  title: const Text("Save field called: A"),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value;
                    });
                    Navigator.pop(context);
                    openDialog();
                  }),
              CheckboxListTile(
                  title: const Text("Save field called: B"),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value;
                    });
                    Navigator.pop(context);
                    openDialog();
                  }),
              CheckboxListTile(
                  title: const Text("Save field called: C"),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value;
                    });
                    Navigator.pop(context);
                    openDialog();
                  }),
              CheckboxListTile(
                  title: const Text("Save field called: D"),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value;
                    });
                    Navigator.pop(context);
                    openDialog();
                  }),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
                onPressed: () {
                  submit();
                },
                child: Text("Save")),
          ],
        ),
      );
  void submit() {
    Navigator.of(context).pop(savingController.text);
    savingController.clear();
  }
}
