// ignore_for_file: must_be_immutable

import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
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
