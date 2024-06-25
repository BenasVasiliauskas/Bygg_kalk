import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:cost_calculator/widgets/saving_rows/saving_row_exteriorwall.dart';
import 'package:cost_calculator/widgets/saving_rows/saving_row_inner_door.dart';
import 'package:cost_calculator/widgets/saving_rows/saving_row_inner_wall.dart';
import 'package:cost_calculator/widgets/saving_rows/saving_row_parquet_laminate.dart';
import 'package:cost_calculator/widgets/saving_rows/saving_row_windows_exterior_door.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
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

class _FilePickerScreenState extends State<FilePickerScreen> {
  TextEditingController savingController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bygg Kalk'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SavingRowOuterWall("Exterior walls"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SavingRowWindowExteriorDoor("Windows/exterior doors"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SavingRowInnerWall("Interior walls"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SavingRowInnerDoor("Interior door"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SavingRowParquetLaminate("Parquet and laminate"),
                ),
                // TextButton(
                //   onPressed: () async {
                //     var fileName = "test";
                //     await writeJsonArrayStart(fileName);
                //     OuterWallModel outerWallModel;
                //     for (int i = 0; i < exteriorWallData.length; i++) {
                //       outerWallModel = OuterWallModel(
                //           name: exteriorWallData[i].name,
                //           description: exteriorWallData[i].description,
                //           unit: exteriorWallData[i].unit,
                //           quantity: exteriorWallData[i].quantity,
                //           materialQuantity:
                //               exteriorWallData[i].materialQuantity,
                //           laborHours1: exteriorWallData[i].laborHours1,
                //           laborHours2: exteriorWallData[i].laborHours2,
                //           laborCost: exteriorWallData[i].laborCost,
                //           material: exteriorWallData[i].material,
                //           materials: exteriorWallData[i].materials,
                //           totalPrice: exteriorWallData[i].totalPrice);
                //       await writeJson(outerWallModel, fileName);
                //       //write a comma for the next element, check if the length is over equals 1 and if it isnt the last element
                //       if (exteriorWallData.length >= 1 &&
                //           i != exteriorWallData.length - 1) {
                //         await writeJsonComma(fileName);
                //       }
                //     }
                //     await writeJsonArrayEnd(fileName);
                //   },
                //   child: Text("test"),
                // ),
                // TextButton(
                //   onPressed: () {
                //     var fileName = "test";
                //     readJsonFile(fileName).then((value) {
                //       writeProjectToJson(fileName, exteriorWallData.length);
                //     });

                //     readJsonFile(fileName).then(
                //       (value) {
                //         for (int i = 0; i < value.length; i++) {
                //           print("a");
                //         }
                //         for (int i = 0; i < value.length; i++) {
                //           OuterWallModel outerwallModel =
                //               OuterWallModel.fromJson(value[i]);
                //           if (outerwallModel.name == exteriorWallData[0].name) {
                //             exteriorWallData[0].description = outerwallModel
                //                 .description; //should be current files data == newly read files data
                //             exteriorWallData[0].unit = outerwallModel.unit;
                //             exteriorWallData[0].quantity =
                //                 outerwallModel.quantity;
                //             exteriorWallData[0].materialQuantity =
                //                 outerwallModel.materialQuantity;
                //             exteriorWallData[0].laborHours1 =
                //                 outerwallModel.laborHours1;
                //             exteriorWallData[0].laborHours2 =
                //                 outerwallModel.laborHours2;
                //             exteriorWallData[0].laborCost =
                //                 outerwallModel.laborCost;
                //             exteriorWallData[0].material =
                //                 outerwallModel.material;
                //             exteriorWallData[0].materials =
                //                 outerwallModel.materials;
                //             exteriorWallData[0].totalPrice =
                //                 outerwallModel.totalPrice;
                //           }
                //         }
                //       },
                //     );
                //   },
                //   child: Text("Test2"),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
