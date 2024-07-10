// ignore_for_file: must_be_immutable

import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/functions/create_worksheet.dart';
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

String selectedName = "";
int indexOfName = -1;
bool? isHoursChecked = false;
bool? isTotalHoursChecked = false;
bool? isJobCostChecked = false;
bool? isMaterialChecked = false;
bool? isTotalMaterialsCostChecked = false;
bool? isTotalPriceChecked = false;
var lengthOfArray = languageEnglish
    ? windowsExteriorDoors.length
    : norwWindowsExteriorDoors.length;

class _SavingRowWindowExteriorDoor extends State<SavingRowWindowExteriorDoor> {
  TextEditingController savingController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(languageEnglish ? widget.name : "Vinduer ytterdører"),
        ),
        TextButton(
          child: Text(languageEnglish
              ? "Save"
              : languageNorwegian
                  ? "Lagre"
                  : "SaveOtherLang"),
          onPressed: () async {
            final fileName = await openDialog();
            //if name to file wasnt given
            if (fileName == null || fileName.isEmpty) {
              return;
            }
            await fileDeleteIfExists(fileName);
            //write a bracket for the start of the array
            await writeJsonArrayStart(fileName);
            WindowsAndExteriorDoorsModel WindowExteriorDoorModel;
            for (var i = 0; i < windowsExteriorDoors.length; i++) {
              WindowExteriorDoorModel = WindowsAndExteriorDoorsModel(
                name: languageEnglish
                    ? windowsExteriorDoors[i].name
                    : norwWindowsExteriorDoors[i].name,
                description: languageEnglish
                    ? windowsExteriorDoors[i].description
                    : norwWindowsExteriorDoors[i].description,
                unit: languageEnglish
                    ? windowsExteriorDoors[i].unit
                    : norwWindowsExteriorDoors[i].unit,
                quantity: languageEnglish
                    ? windowsExteriorDoors[i].quantity
                    : norwWindowsExteriorDoors[i].quantity,
                laborHours1: languageEnglish
                    ? windowsExteriorDoors[i].laborHours1
                    : norwWindowsExteriorDoors[i].laborHours1,
                laborHours2: languageEnglish
                    ? windowsExteriorDoors[i].laborHours2
                    : norwWindowsExteriorDoors[i].laborHours2,
                laborCost: languageEnglish
                    ? windowsExteriorDoors[i].laborCost
                    : norwWindowsExteriorDoors[i].laborCost,
                material: languageEnglish
                    ? windowsExteriorDoors[i].material
                    : norwWindowsExteriorDoors[i].material,
                materials: languageEnglish
                    ? windowsExteriorDoors[i].materials
                    : norwWindowsExteriorDoors[i].materials,
                totalPrice: languageEnglish
                    ? windowsExteriorDoors[i].totalPrice
                    : norwWindowsExteriorDoors[i].totalPrice,
              );
              await writeJson(WindowExteriorDoorModel, fileName);
              //write a comma for the next element, check if the length is over equals 1 and if it isnt the last element
              if (windowsExteriorDoors.length >= 1 &&
                  i != windowsExteriorDoors.length - 1) {
                await writeJsonComma(fileName);
              }
            }
            await writeJsonArrayEnd(fileName);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(languageEnglish
                    ? 'Data has been saved as $fileName.json'
                    : "Dataene er lagret som $fileName.json"),
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
                        ? "Last"
                        : "Load in polish",
          ),
          onPressed: () {
            choose();
          },
        ),
        DropdownMenu(
            width: 500,
            onSelected: (value) {
              selectedName = value.toString();
            },
            dropdownMenuEntries: <DropdownMenuEntry<String>>[
              for (int i = 0; i < lengthOfArray; i++)
                DropdownMenuEntry(
                    labelWidget: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(languageEnglish
                          ? windowsExteriorDoors[i].name
                          : norwWindowsExteriorDoors[i].name),
                    ),
                    value: languageEnglish
                        ? windowsExteriorDoors[i].name
                        : norwWindowsExteriorDoors[i].name,
                    label: languageEnglish
                        ? windowsExteriorDoors[i].name
                        : norwWindowsExteriorDoors[i].name),
            ]),
        TextButton(
          onPressed: () {
            openExcelDialog();
          },
          child: Text(languageEnglish ? "Save to excel" : "Lagre i Excel"),
        ),
      ],
    );
  }

  Future<String?> openExcelDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(languageEnglish ? "Name the file" : "Gi filen et navn"),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
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
                  CheckboxListTile(
                      title: Text(languageEnglish
                          ? "Save field called: Hours"
                          : "Lagre felt kalt: Timer"),
                      value: isHoursChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isHoursChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: Text(languageEnglish
                          ? "Save field called: Total hours"
                          : "Lagre felt kalt: Totalt antall timer"),
                      value: isTotalHoursChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isTotalHoursChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: Text(languageEnglish
                          ? "Save field called: Labor cost"
                          : "Lagre felt kalt: Arbeidskostnad"),
                      value: isJobCostChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isJobCostChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: Text(languageEnglish
                          ? "Save field called: Materials"
                          : "Lagre felt kalt: Materialer"),
                      value: isMaterialChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isMaterialChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: Text(languageEnglish
                          ? "Save field called:Total Material cost"
                          : "Lagre felt kalt: Total materialkostnad"),
                      value: isTotalMaterialsCostChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isTotalMaterialsCostChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: Text(languageEnglish
                          ? "Save field called: Total price"
                          : "Lagre felt kalt: Total pris"),
                      value: isTotalPriceChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isTotalPriceChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                ],
              ),
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
                    findIndex();
                    if (indexOfName == -1) {
                      return;
                    }
                    generateWindowsOuterDoorExcelDocument(
                      savingController.text,
                      //
                      windowsExteriorDoors[indexOfName].description,
                      //
                      windowsExteriorDoors[indexOfName].unit,
                      //
                      windowsExteriorDoors[indexOfName].quantity,
                      //
                      isHoursChecked != null && isHoursChecked == true
                          ? windowsExteriorDoors[indexOfName].laborHours1
                          //
                          : generateEmptyList(
                              windowsExteriorDoors[indexOfName].laborHours1),
                      //
                      isTotalHoursChecked != null && isTotalHoursChecked == true
                          ? windowsExteriorDoors[indexOfName].laborHours2
                          //
                          : generateEmptyList(
                              windowsExteriorDoors[indexOfName].laborHours2),
                      //
                      isJobCostChecked != null && isJobCostChecked == true
                          ? windowsExteriorDoors[indexOfName].laborCost
                          //
                          : generateEmptyList(
                              windowsExteriorDoors[indexOfName].laborCost),
                      //
                      isMaterialChecked != null && isMaterialChecked == true
                          ? windowsExteriorDoors[indexOfName].material
                          //
                          : generateEmptyList(
                              windowsExteriorDoors[indexOfName].material),
                      //
                      isTotalMaterialsCostChecked != null &&
                              isTotalMaterialsCostChecked == true
                          ? windowsExteriorDoors[indexOfName].materials
                          //
                          : generateEmptyList(
                              windowsExteriorDoors[indexOfName].materials),
                      //
                      isTotalPriceChecked != null && isTotalPriceChecked == true
                          ? windowsExteriorDoors[indexOfName].totalPrice
                          //
                          : generateEmptyList(
                              windowsExteriorDoors[indexOfName].totalPrice),
                      //
                      widget.name,
                    );
                    Navigator.of(context).pop();
                  },
                  child: Text(languageEnglish
                      ? "Save"
                      : languageNorwegian
                          ? "Lagre"
                          : "SaveOtherLang")),
            ],
          ));

  void findIndex() {
    for (int i = 0; i < lengthOfArray; i++) {
      if (languageEnglish
          ? windowsExteriorDoors[i].name == selectedName
          : norwWindowsExteriorDoors[i].name == selectedName) {
        indexOfName = i;
        return;
      }
    }
  }

  List<String> generateEmptyStringList(originalList) {
    var emptyList = List<String>.filled(originalList.length, "");
    return emptyList;
  }

  List<double> generateEmptyList(originalList) {
    var emptyList = List<double>.filled(originalList.length, 0);
    return emptyList;
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
