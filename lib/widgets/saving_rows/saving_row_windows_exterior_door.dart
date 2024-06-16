// ignore_for_file: must_be_immutable

import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/models/windows_exterior_doors_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SavingRowWindowExteriorDoor extends StatefulWidget {
  String name;

  SavingRowWindowExteriorDoor(
    this.name,
  );
  @override
  State<SavingRowWindowExteriorDoor> createState() =>
      _SavingRowWindowExteriorDoor();
}

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

class _SavingRowWindowExteriorDoor extends State<SavingRowWindowExteriorDoor> {
  TextEditingController savingController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.name),
        TextButton(
          child: Text("Save"),
          onPressed: () async {
            final name = await openDialog();
            //if name to file wasnt given
            if (name == null || name.isEmpty) {
              return;
            }
            WindowsAndExteriorDoorsModel WindowExteriorDoorModel;
            for (var i = 0; i < windowsExteriorDoors.length; i++) {
              WindowExteriorDoorModel = WindowsAndExteriorDoorsModel(
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
              writeJson(WindowExteriorDoorModel, name);
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Data has been saved as $name.json'),
              ),
            );
          },
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
