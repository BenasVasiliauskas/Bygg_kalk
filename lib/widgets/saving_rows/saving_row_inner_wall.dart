// ignore_for_file: must_be_immutable

import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
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

class _SavingRowInnerWall extends State<SavingRowInnerWall> {
  TextEditingController savingController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(widget.name),
        ),
        TextButton(
          child: Text("Save"),
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
            for (var i = 0; i < dataInnerWallData.length; i++) {
              innerWallModel = InnerWallModel(
                name: dataInnerWallData[i].name,
                description: dataInnerWallData[i].description,
                unit: dataInnerWallData[i].unit,
                quantity: dataInnerWallData[i].quantity,
                materialQuantity: dataInnerWallData[i].materialQuantity,
                laborHours1: dataInnerWallData[i].laborHours1,
                laborHours2: dataInnerWallData[i].laborHours2,
                laborCost: dataInnerWallData[i].laborCost,
                material1: dataInnerWallData[i].material1,
                material2: dataInnerWallData[i].material2,
                totalPrice: dataInnerWallData[i].totalPrice,
              );
              await writeJson(innerWallModel, fileName);
              //write a comma for the next element, check if the length is over equals 1 and if it isnt the last element
              if (dataInnerWallData.length >= 1 &&
                  i != dataInnerWallData.length - 1) {
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
        DropdownMenu(
            width: 500,
            onSelected: (value) {
              selectedName = value.toString();
            },
            dropdownMenuEntries: <DropdownMenuEntry<String>>[
              for (int i = 0; i < dataInnerWallData.length; i++)
                DropdownMenuEntry(
                    value: dataInnerWallData[i].name,
                    label: dataInnerWallData[i].name),
            ]),
        TextButton(
          onPressed: () {},
          child: Text("Save to excel"),
        ),
      ],
    );
  }

  Future<String?> openExcelDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Name the file"),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  TextField(
                    controller: savingController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Enter the name of the file",
                    ),
                  ),
                  CheckboxListTile(
                      title: const Text("Save field called: Description"),
                      value: isDescriptionChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isDescriptionChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: const Text("Save field called: Units"),
                      value: isUnitsChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isUnitsChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: const Text("Save field called: Quantity"),
                      value: isQuantityChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isQuantityChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: const Text("Save field called: Hours"),
                      value: isHoursChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isHoursChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: const Text("Save field called: Total hours"),
                      value: isTotalHoursChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isTotalHoursChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: const Text("Save field called: Labor cost"),
                      value: isJobCostChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isJobCostChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: const Text("Save field called: Materials"),
                      value: isMaterialChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isMaterialChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title:
                          const Text("Save field called:Total Material cost"),
                      value: isTotalMaterialsCostChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isTotalMaterialsCostChecked = value;
                        });
                        Navigator.pop(context);
                        openExcelDialog();
                      }),
                  CheckboxListTile(
                      title: const Text("Save field called: Total price"),
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
                      isDescriptionChecked != null &&
                              isDescriptionChecked == true
                          ? dataInnerWallData[indexOfName].description
                          //
                          : generateEmptyStringList(
                              dataInnerWallData[indexOfName].description),
                      //
                      isUnitsChecked != null && isUnitsChecked == true
                          ? dataInnerWallData[indexOfName].unit
                          //
                          : generateEmptyStringList(
                              dataInnerWallData[indexOfName].unit),
                      //
                      isQuantityChecked != null && isQuantityChecked == true
                          ? dataInnerWallData[indexOfName].quantity
                          //
                          : generateEmptyList(
                              dataInnerWallData[indexOfName].quantity),
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
                  child: Text("Save")),
            ],
          ));

  void findIndex() {
    for (int i = 0; i < dataInnerWallData.length; i++) {
      if (dataInnerWallData[i].name == selectedName) {
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
