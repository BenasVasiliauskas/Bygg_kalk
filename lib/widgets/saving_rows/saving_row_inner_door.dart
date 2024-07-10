// ignore_for_file: must_be_immutable

import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/functions/create_worksheet.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/models/inner_door_data_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SavingRowInnerDoor extends StatefulWidget {
  String name;

  SavingRowInnerDoor(
    this.name,
  );
  @override
  State<SavingRowInnerDoor> createState() => _SavingRowInnerDoor();
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
var lengthOfArray = languageEnglish ? innerDoor.length : norwInnerDoor.length;

class _SavingRowInnerDoor extends State<SavingRowInnerDoor> {
  TextEditingController savingController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(languageEnglish ? "Inner doors" : "Innerdører"),
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
            InnerDoorModel innerDoorModel;
            for (var i = 0; i < lengthOfArray; i++) {
              innerDoorModel = InnerDoorModel(
                name:
                    languageEnglish ? innerDoor[i].name : norwInnerDoor[i].name,
                description: languageEnglish
                    ? innerDoor[i].description
                    : norwInnerDoor[i].description,
                unit:
                    languageEnglish ? innerDoor[i].unit : norwInnerDoor[i].unit,
                quantity: languageEnglish
                    ? innerDoor[i].quantity
                    : norwInnerDoor[i].quantity,
                laborHours1: languageEnglish
                    ? innerDoor[i].laborHours1
                    : norwInnerDoor[i].laborHours1,
                laborHours2: languageEnglish
                    ? innerDoor[i].laborHours2
                    : norwInnerDoor[i].laborHours2,
                laborCost: languageEnglish
                    ? innerDoor[i].laborCost
                    : norwInnerDoor[i].laborCost,
                material: languageEnglish
                    ? innerDoor[i].material
                    : norwInnerDoor[i].material,
                materials: languageEnglish
                    ? innerDoor[i].materials
                    : norwInnerDoor[i].materials,
                totalPrice: languageEnglish
                    ? innerDoor[i].totalPrice
                    : norwInnerDoor[i].totalPrice,
              );
              await writeJson(innerDoorModel, fileName);
              //write a comma for the next element, check if the length is over equals 1 and if it isnt the last element
              if (lengthOfArray >= 1 && i != lengthOfArray - 1) {
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
                          ? innerDoor[i].name
                          : norwInnerDoor[i].name),
                    ),
                    value: languageEnglish
                        ? innerDoor[i].name
                        : norwInnerDoor[i].name,
                    label: languageEnglish
                        ? innerDoor[i].name
                        : norwInnerDoor[i].name),
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
                    generateInnerDoorExcelDocument(
                      savingController.text,
                      //
                      innerDoor[indexOfName].description,
                      //
                      innerDoor[indexOfName].unit,
                      //
                      innerDoor[indexOfName].quantity,
                      //
                      isHoursChecked != null && isHoursChecked == true
                          ? innerDoor[indexOfName].laborHours1
                          //
                          : generateEmptyList(
                              innerDoor[indexOfName].laborHours1),
                      //
                      isTotalHoursChecked != null && isTotalHoursChecked == true
                          ? innerDoor[indexOfName].laborHours2
                          //
                          : generateEmptyList(
                              innerDoor[indexOfName].laborHours2),
                      //
                      isJobCostChecked != null && isJobCostChecked == true
                          ? innerDoor[indexOfName].laborCost
                          //
                          : generateEmptyList(innerDoor[indexOfName].laborCost),
                      //
                      isMaterialChecked != null && isMaterialChecked == true
                          ? innerDoor[indexOfName].material
                          //
                          : generateEmptyList(innerDoor[indexOfName].material),
                      //
                      isTotalMaterialsCostChecked != null &&
                              isTotalMaterialsCostChecked == true
                          ? innerDoor[indexOfName].materials
                          //
                          : generateEmptyList(innerDoor[indexOfName].materials),
                      //
                      isTotalPriceChecked != null && isTotalPriceChecked == true
                          ? innerDoor[indexOfName].totalPrice
                          //
                          : generateEmptyList(
                              innerDoor[indexOfName].totalPrice),
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
          ? innerDoor[i].name == selectedName
          : norwInnerDoor[i].name == selectedName) {
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
