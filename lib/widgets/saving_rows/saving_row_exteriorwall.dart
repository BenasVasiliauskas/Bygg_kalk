// ignore_for_file: must_be_immutable

import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
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

class _SavingRowOuterWall extends State<SavingRowOuterWall> {
  TextEditingController savingController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.name),
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
            OuterWallModel outerwallModel;
            for (var i = 0; i < exteriorWallData.length; i++) {
              outerwallModel = OuterWallModel(
                name: exteriorWallData[i].name,
                description: exteriorWallData[i].description,
                unit: exteriorWallData[i].unit,
                quantity: exteriorWallData[i].quantity,
                materialQuantity: exteriorWallData[i].materialQuantity,
                laborHours1: exteriorWallData[i].laborHours1,
                laborHours2: exteriorWallData[i].laborHours2,
                laborCost: exteriorWallData[i].laborCost,
                material: exteriorWallData[i].material,
                materials: exteriorWallData[i].materials,
                totalPrice: exteriorWallData[i].totalPrice,
              );
              await writeJson(outerwallModel, fileName);
              //write a comma for the next element, check if the length is over equals 1 and if it isnt the last element
              if (exteriorWallData.length >= 1 &&
                  i != exteriorWallData.length - 1) {
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
            onSelected: (value) {
              selectedName = value.toString();
            },
            dropdownMenuEntries: <DropdownMenuEntry<String>>[
              for (int i = 0; i < exteriorWallData.length; i++)
                DropdownMenuEntry(
                    value: exteriorWallData[i].name,
                    label: exteriorWallData[i].name),
            ]),
        // FloatingActionButton(
        //   onPressed: () {
        //     generateInnerDoorExcelDocument(
        //       "ExterioirWallItems",
        //       exteriorWallData[0].description,
        //       exteriorWallData[0].unit,
        //       exteriorWallData[0].quantity,
        //       exteriorWallData[0].laborHours1,
        //       exteriorWallData[0].laborHours2,
        //       exteriorWallData[0].laborCost,
        //       exteriorWallData[0].material,
        //       exteriorWallData[0].materials,
        //       exteriorWallData[0].totalPrice,
        //       widget.name,
        //     );

        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(
        //         content: Text(
        //             'Excel file has been created in your Downloads folder'),
        //       ),
        //     );
        //   },
        //   child: Text("Save to Excel"),
        // ),
        TextButton(
          onPressed: () {
            openExcelDialog();
          },
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
                      title: const Text("Save field called: Material quantity"),
                      value: isMaterialQuantityChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isMaterialQuantityChecked = value;
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
                  child: Text("Save")),
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
