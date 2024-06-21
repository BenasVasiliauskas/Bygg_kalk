// ignore_for_file: must_be_immutable

import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/functions/create_worksheet.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:cost_calculator/models/parquet_laminate_data_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SavingRowParquetLaminate extends StatefulWidget {
  String name;

  SavingRowParquetLaminate(
    this.name,
  );
  @override
  State<SavingRowParquetLaminate> createState() => _SavingRowParquetLaminate();
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
bool? isHoursChecked = false;
bool? isTotalHoursChecked = false;
bool? isJobCostChecked = false;
bool? isMaterialChecked = false;
bool? isTotalMaterialsCostChecked = false;
bool? isTotalPriceChecked = false;
var lengthOfArray =
    languageEnglish ? parquetAndLaminate.length : norwParquetAndLaminate.length;

class _SavingRowParquetLaminate extends State<SavingRowParquetLaminate> {
  TextEditingController savingController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(languageEnglish ? widget.name : "Parkett og laminat"),
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
            ParquetAndLaminateModel ParquetLaminateModel;
            for (var i = 0; i < lengthOfArray; i++) {
              ParquetLaminateModel = ParquetAndLaminateModel(
                name: languageEnglish
                    ? parquetAndLaminate[i].name
                    : norwParquetAndLaminate[i].name,
                description: languageEnglish
                    ? parquetAndLaminate[i].description
                    : norwParquetAndLaminate[i].description,
                unit: languageEnglish
                    ? parquetAndLaminate[i].unit
                    : norwParquetAndLaminate[i].unit,
                quantity: languageEnglish
                    ? parquetAndLaminate[i].quantity
                    : norwParquetAndLaminate[i].quantity,
                laborHours1: languageEnglish
                    ? parquetAndLaminate[i].laborHours1
                    : norwParquetAndLaminate[i].laborHours1,
                laborHours2: languageEnglish
                    ? parquetAndLaminate[i].laborHours2
                    : norwParquetAndLaminate[i].laborHours2,
                laborCost: languageEnglish
                    ? parquetAndLaminate[i].laborCost
                    : norwParquetAndLaminate[i].laborCost,
                material: languageEnglish
                    ? parquetAndLaminate[i].material
                    : norwParquetAndLaminate[i].material,
                materials: languageEnglish
                    ? parquetAndLaminate[i].materials
                    : norwParquetAndLaminate[i].materials,
                totalPrice: languageEnglish
                    ? parquetAndLaminate[i].totalPrice
                    : norwParquetAndLaminate[i].totalPrice,
              );
              await writeJson(ParquetLaminateModel, fileName);
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
                          ? parquetAndLaminate[i].name
                          : norwParquetAndLaminate[i].name),
                    ),
                    value: parquetAndLaminate[i].name,
                    label: parquetAndLaminate[i].name),
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
                    generateParquetLaminateExcelDocument(
                      savingController.text,
                      //
                      isDescriptionChecked != null &&
                              isDescriptionChecked == true
                          ? parquetAndLaminate[indexOfName].description
                          //
                          : generateEmptyStringList(
                              parquetAndLaminate[indexOfName].description),
                      //
                      isUnitsChecked != null && isUnitsChecked == true
                          ? parquetAndLaminate[indexOfName].unit
                          //
                          : generateEmptyStringList(
                              parquetAndLaminate[indexOfName].unit),
                      //
                      isQuantityChecked != null && isQuantityChecked == true
                          ? parquetAndLaminate[indexOfName].quantity
                          //
                          : generateEmptyList(
                              parquetAndLaminate[indexOfName].quantity),
                      //
                      isHoursChecked != null && isHoursChecked == true
                          ? parquetAndLaminate[indexOfName].laborHours1
                          //
                          : generateEmptyList(
                              parquetAndLaminate[indexOfName].laborHours1),
                      //
                      isTotalHoursChecked != null && isTotalHoursChecked == true
                          ? parquetAndLaminate[indexOfName].laborHours2
                          //
                          : generateEmptyList(
                              parquetAndLaminate[indexOfName].laborHours2),
                      //
                      isJobCostChecked != null && isJobCostChecked == true
                          ? parquetAndLaminate[indexOfName].laborCost
                          //
                          : generateEmptyList(
                              parquetAndLaminate[indexOfName].laborCost),
                      //
                      isMaterialChecked != null && isMaterialChecked == true
                          ? parquetAndLaminate[indexOfName].material
                          //
                          : generateEmptyList(
                              parquetAndLaminate[indexOfName].material),
                      //
                      isTotalMaterialsCostChecked != null &&
                              isTotalMaterialsCostChecked == true
                          ? parquetAndLaminate[indexOfName].materials
                          //
                          : generateEmptyList(
                              parquetAndLaminate[indexOfName].materials),
                      //
                      isTotalPriceChecked != null && isTotalPriceChecked == true
                          ? parquetAndLaminate[indexOfName].totalPrice
                          //
                          : generateEmptyList(
                              parquetAndLaminate[indexOfName].totalPrice),
                      //
                      widget.name,
                    );
                    Navigator.of(context).pop();
                  },
                  child: Text("Save")),
            ],
          ));

  void findIndex() {
    for (int i = 0; i < lengthOfArray; i++) {
      if (languageEnglish
          ? parquetAndLaminate[i].name == selectedName
          : norwParquetAndLaminate[i].name == selectedName) {
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
