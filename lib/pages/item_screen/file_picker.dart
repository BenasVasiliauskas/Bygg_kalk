import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/pages/shared/home_page.dart';
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
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return homePage();
          }),
        );
      },
      child: Scaffold(
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
                    child:
                        SavingRowWindowExteriorDoor("Windows/exterior doors"),
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
                  TextButton(
                    onPressed: () {
                      //reading like this is fine, so we can just write 50 mllion save calls?
                      var dataInnerWall = dataInnerWallData;
                      var dataDeckData = deckData;
                      var dataInnerDoor = innerDoor;
                      var dataParquetAndLaminate = parquetAndLaminate;
                      var dataWindowsExteriorDoors = windowsExteriorDoors;
                      var dataSupportSystem = supportSystem;
                      var dataFlooringData = flooringData;
                      var dataTerraceData = terraceData;
                      var dataOuterRoofData = outerRoofData;
                      var dataExteriorWallData = exteriorWallData;
                      var dataHullRoofingData = hullRoofingData;
                      var dataScaffoldingData = scaffoldingData;
                      var dataInnerStairsData = innerStairsData;
                      var dataWasteData = wasteData;

                      print(dataInnerWall);
                      print(dataDeckData);
                      print(dataInnerDoor);
                      print(dataParquetAndLaminate);
                      print(dataWindowsExteriorDoors);
                      print(dataSupportSystem);
                      print(dataFlooringData);
                      print(dataTerraceData);
                      print(dataOuterRoofData);
                      print(dataExteriorWallData);
                      print(dataHullRoofingData);
                      print(dataScaffoldingData);
                      print(dataInnerStairsData);
                      print(dataWasteData);
                    },
                    child: Text("AAAAAAAAAA"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
