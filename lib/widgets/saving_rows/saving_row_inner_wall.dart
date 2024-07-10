// ignore_for_file: must_be_immutable

import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/functions/create_worksheet.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/models/inner_wall_data_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SavingRowInnerWall extends StatefulWidget {
  String name;

  SavingRowInnerWall(
    this.name,
  );
  @override
  State<SavingRowInnerWall> createState() => _SavingRowInnerWall();
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

bool? isMaterialQuantityChecked = false;
bool? isHoursChecked = false;
bool? isTotalHoursChecked = false;
bool? isJobCostChecked = false;
bool? isMaterialChecked = false;
bool? isTotalMaterialsCostChecked = false;
bool? isTotalPriceChecked = false;
var lengthOfArray =
    languageEnglish ? dataInnerWallData.length : norwInnerWallData.length;

class _SavingRowInnerWall extends State<SavingRowInnerWall> {
  TextEditingController savingController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(languageEnglish ? widget.name : "Innervegger"),
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
            InnerWallModel innerWallModel;
            for (var i = 0; i < lengthOfArray; i++) {
              innerWallModel = InnerWallModel(
                name: languageEnglish
                    ? dataInnerWallData[i].name
                    : norwInnerWallData[i].name,
                description: languageEnglish
                    ? dataInnerWallData[i].description
                    : norwInnerWallData[i].description,
                unit: languageEnglish
                    ? dataInnerWallData[i].unit
                    : norwInnerWallData[i].unit,
                quantity: languageEnglish
                    ? dataInnerWallData[i].quantity
                    : norwInnerWallData[i].quantity,
                materialQuantity: languageEnglish
                    ? dataInnerWallData[i].materialQuantity
                    : norwInnerWallData[i].materialQuantity,
                laborHours1: languageEnglish
                    ? dataInnerWallData[i].laborHours1
                    : norwInnerWallData[i].laborHours1,
                laborHours2: languageEnglish
                    ? dataInnerWallData[i].laborHours2
                    : norwInnerWallData[i].laborHours2,
                laborCost: languageEnglish
                    ? dataInnerWallData[i].laborCost
                    : norwInnerWallData[i].laborCost,
                material1: languageEnglish
                    ? dataInnerWallData[i].material1
                    : norwInnerWallData[i].material1,
                material2: languageEnglish
                    ? dataInnerWallData[i].material2
                    : norwInnerWallData[i].material2,
                totalPrice: languageEnglish
                    ? dataInnerWallData[i].totalPrice
                    : norwInnerWallData[i].totalPrice,
              );
              await writeJson(innerWallModel, fileName);
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
                          ? dataInnerWallData[i].name
                          : norwInnerWallData[i].name),
                    ),
                    value: languageEnglish
                        ? dataInnerWallData[i].name
                        : norwInnerWallData[i].name,
                    label: languageEnglish
                        ? dataInnerWallData[i].name
                        : norwInnerWallData[i].name),
            ]),
        TextButton(
          onPressed: () {},
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
                child: Text("Cancel"),
              ),
              TextButton(
                  onPressed: () {
                    findIndex();
                    if (indexOfName == -1) {
                      return;
                    }
                    generateInnerWallExcelDocument(
                      savingController.text,
                      //
                      dataInnerWallData[indexOfName].description,
                      //
                      dataInnerWallData[indexOfName].unit,
                      //
                      dataInnerWallData[indexOfName].quantity,
                      //
                      isMaterialQuantityChecked != null &&
                              isMaterialQuantityChecked == true
                          ? dataInnerWallData[indexOfName].materialQuantity
                          //
                          : generateEmptyList(
                              dataInnerWallData[indexOfName].materialQuantity),
                      //
                      isHoursChecked != null && isHoursChecked == true
                          ? dataInnerWallData[indexOfName].laborHours1
                          //
                          : generateEmptyList(
                              dataInnerWallData[indexOfName].laborHours1),
                      //
                      isTotalHoursChecked != null && isTotalHoursChecked == true
                          ? dataInnerWallData[indexOfName].laborHours2
                          //
                          : generateEmptyList(
                              dataInnerWallData[indexOfName].laborHours2),
                      //
                      isJobCostChecked != null && isJobCostChecked == true
                          ? dataInnerWallData[indexOfName].laborCost
                          //
                          : generateEmptyList(
                              dataInnerWallData[indexOfName].laborCost),
                      //
                      isMaterialChecked != null && isMaterialChecked == true
                          ? dataInnerWallData[indexOfName].material1
                          //
                          : generateEmptyList(
                              dataInnerWallData[indexOfName].material1),
                      //
                      isTotalMaterialsCostChecked != null &&
                              isTotalMaterialsCostChecked == true
                          ? dataInnerWallData[indexOfName].material2
                          //
                          : generateEmptyList(
                              dataInnerWallData[indexOfName].material2),
                      //
                      isTotalPriceChecked != null && isTotalPriceChecked == true
                          ? dataInnerWallData[indexOfName].totalPrice
                          //
                          : generateEmptyList(
                              dataInnerWallData[indexOfName].totalPrice),
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
          ? dataInnerWallData[i].name == selectedName
          : norwInnerWallData[i].name == selectedName) {
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
