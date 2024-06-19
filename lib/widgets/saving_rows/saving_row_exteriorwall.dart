// ignore_for_file: must_be_immutable

import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/functions/create_worksheet.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/models/outer_wall_data_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SavingRowOuterWall extends StatefulWidget {
  String name;

  SavingRowOuterWall(
    this.name,
  );
  @override
  State<SavingRowOuterWall> createState() => _SavingRowOuterWall();
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
bool? isDescriptionChecked = false;
bool? isUnitsChecked = false;
bool? isQuantityChecked = false;
bool? isMaterialQuantityChecked = false;
bool? isHoursChecked = false;
bool? isTotalHoursChecked = false;
bool? isJobCostChecked = false;
bool? isMaterialChecked = false;
bool? isTotalMaterialsCostChecked = false;
bool? isTotalPriceChecked = false;
var lengthOfArray =
    languageEnglish ? exteriorWallData.length : norwExteriorWallData.length;

class _SavingRowOuterWall extends State<SavingRowOuterWall> {
  TextEditingController savingController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(languageEnglish ? "Exterior walls" : "Yttervegger"),
        ),
        SizedBox(
          child: TextButton(
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
              OuterWallModel outerwallModel;
              for (var i = 0; i < lengthOfArray; i++) {
                outerwallModel = OuterWallModel(
                  name: languageEnglish
                      ? exteriorWallData[i].name
                      : norwExteriorWallData[i].name,
                  description: languageEnglish
                      ? exteriorWallData[i].description
                      : norwExteriorWallData[i].description,
                  unit: languageEnglish
                      ? exteriorWallData[i].unit
                      : norwExteriorWallData[i].unit,
                  quantity: languageEnglish
                      ? exteriorWallData[i].quantity
                      : norwExteriorWallData[i].materialQuantity,
                  materialQuantity: languageEnglish
                      ? exteriorWallData[i].materialQuantity
                      : norwExteriorWallData[i].materialQuantity,
                  laborHours1: languageEnglish
                      ? exteriorWallData[i].laborHours1
                      : norwExteriorWallData[i].laborHours1,
                  laborHours2: languageEnglish
                      ? exteriorWallData[i].laborHours2
                      : norwExteriorWallData[i].laborHours2,
                  laborCost: languageEnglish
                      ? exteriorWallData[i].laborCost
                      : norwExteriorWallData[i].laborCost,
                  material: languageEnglish
                      ? exteriorWallData[i].material
                      : norwExteriorWallData[i].material,
                  materials: languageEnglish
                      ? exteriorWallData[i].materials
                      : norwExteriorWallData[i].materials,
                  totalPrice: languageEnglish
                      ? exteriorWallData[i].totalPrice
                      : norwExteriorWallData[i].totalPrice,
                );
                await writeJson(outerwallModel, fileName);
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
                  value: languageEnglish
                      ? exteriorWallData[i].name
                      : norwExteriorWallData[i].name,
                  label: languageEnglish
                      ? exteriorWallData[i].name
                      : norwExteriorWallData[i].name,
                ),
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
                          ? "Save field called: Description"
                          : "Lagre felt kalt: Beskrivelse"),
                      value: isDescriptionChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isDescriptionChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: Text(languageEnglish
                          ? "Save field called: Units"
                          : "Lagre felt kalt: Enheter"),
                      value: isUnitsChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isUnitsChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: Text(languageEnglish
                          ? "Save field called: Quantity"
                          : "Lagre felt kalt: Antall"),
                      value: isQuantityChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isQuantityChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: Text(languageEnglish
                          ? "Save field called: Material quantity"
                          : "Lagre felt kalt: Materialmengde"),
                      value: isMaterialQuantityChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isMaterialQuantityChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
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
                child: Text(languageEnglish ? "Cancel" : "Avbryt"),
              ),
              TextButton(
                  onPressed: () {
                    findIndex();
                    if (indexOfName == -1) {
                      return;
                    }
                    generateOuterWallExcelDocument(
                      savingController.text,
                      //
                      isDescriptionChecked != null &&
                              isDescriptionChecked == true
                          ? exteriorWallData[indexOfName].description
                          //
                          : generateEmptyStringList(
                              exteriorWallData[indexOfName].description),
                      //
                      isUnitsChecked != null && isUnitsChecked == true
                          ? exteriorWallData[indexOfName].unit
                          //
                          : generateEmptyStringList(
                              exteriorWallData[indexOfName].unit),
                      //
                      isQuantityChecked != null && isQuantityChecked == true
                          ? exteriorWallData[indexOfName].quantity
                          //
                          : generateEmptyList(
                              exteriorWallData[indexOfName].quantity),
                      //
                      isMaterialQuantityChecked != null &&
                              isMaterialQuantityChecked == true
                          ? exteriorWallData[indexOfName].materialQuantity
                          //
                          : generateEmptyList(
                              exteriorWallData[indexOfName].materialQuantity),
                      //
                      isHoursChecked != null && isHoursChecked == true
                          ? exteriorWallData[indexOfName].laborHours1
                          //
                          : generateEmptyList(
                              exteriorWallData[indexOfName].laborHours1),
                      //
                      isTotalHoursChecked != null && isTotalHoursChecked == true
                          ? exteriorWallData[indexOfName].laborHours2
                          //
                          : generateEmptyList(
                              exteriorWallData[indexOfName].laborHours2),
                      //
                      isJobCostChecked != null && isJobCostChecked == true
                          ? exteriorWallData[indexOfName].laborCost
                          //
                          : generateEmptyList(
                              exteriorWallData[indexOfName].laborCost),
                      //
                      isMaterialChecked != null && isMaterialChecked == true
                          ? exteriorWallData[indexOfName].material
                          //
                          : generateEmptyList(
                              exteriorWallData[indexOfName].material),
                      //
                      isTotalMaterialsCostChecked != null &&
                              isTotalMaterialsCostChecked == true
                          ? exteriorWallData[indexOfName].materials
                          //
                          : generateEmptyList(
                              exteriorWallData[indexOfName].materials),
                      //
                      isTotalPriceChecked != null && isTotalPriceChecked == true
                          ? exteriorWallData[indexOfName].totalPrice
                          //
                          : generateEmptyList(
                              exteriorWallData[indexOfName].totalPrice),
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
    for (int i = 0; i < exteriorWallData.length; i++) {
      if (exteriorWallData[i].name == selectedName) {
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
