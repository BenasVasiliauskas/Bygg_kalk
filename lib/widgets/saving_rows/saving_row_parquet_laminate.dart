// ignore_for_file: must_be_immutable

import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/data/data.dart';
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

class _SavingRowParquetLaminate extends State<SavingRowParquetLaminate> {
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
            ParquetAndLaminateModel ParquetLaminateModel;
            for (var i = 0; i < parquetAndLaminate.length; i++) {
              ParquetLaminateModel = ParquetAndLaminateModel(
                name: parquetAndLaminate[i].name,
                description: parquetAndLaminate[i].description,
                unit: parquetAndLaminate[i].unit,
                quantity: parquetAndLaminate[i].quantity,
                laborHours1: parquetAndLaminate[i].laborHours1,
                laborHours2: parquetAndLaminate[i].laborHours2,
                laborCost: parquetAndLaminate[i].laborCost,
                material: parquetAndLaminate[i].material,
                materials: parquetAndLaminate[i].materials,
                totalPrice: parquetAndLaminate[i].totalPrice,
              );
              await writeJson(ParquetLaminateModel, fileName);
              //write a comma for the next element, check if the length is over equals 1 and if it isnt the last element
              if (parquetAndLaminate.length >= 1 &&
                  i != parquetAndLaminate.length - 1) {
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
        DropdownMenu(dropdownMenuEntries: <DropdownMenuEntry<String>>[
          for (int i = 0; i < parquetAndLaminate.length; i++)
            DropdownMenuEntry(
                value: parquetAndLaminate[i].name,
                label: parquetAndLaminate[i].name),
        ]),
        TextButton(
          onPressed: () {},
          child: Text("Save to excel"),
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
