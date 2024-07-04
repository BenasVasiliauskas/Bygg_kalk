import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/models/deck_data_model.dart';
import 'package:cost_calculator/models/flooring_data_model.dart';
import 'package:cost_calculator/models/hull_roofing_data_model.dart';
import 'package:cost_calculator/models/inner_door_data_model.dart';
import 'package:cost_calculator/models/inner_stairs_model.dart';
import 'package:cost_calculator/models/inner_wall_data_model.dart';
import 'package:cost_calculator/models/outer_roof_model.dart';
import 'package:cost_calculator/models/outer_wall_data_model.dart';
import 'package:cost_calculator/models/parquet_laminate_data_model.dart';
import 'package:cost_calculator/models/scaffolding_data_model.dart';
import 'package:cost_calculator/models/support_system_data_model.dart';
import 'package:cost_calculator/models/terrace_model.dart';
import 'package:cost_calculator/models/waste_data_model.dart';
import 'package:cost_calculator/models/windows_exterior_doors_model.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_deck_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_exterior_wall_items_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_flooring_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_hull_roofing_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_inner_door_items_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_inner_stairs_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_interior_wall_items_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_outer_roof_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_parquet_laminate_items_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_scaffolding_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_support_system_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_terrace_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_waste_item_screen.dart';
import 'package:cost_calculator/pages/norw_item_screen/norw_windows_exterior_door_items_screen.dart';

Future<void> norwLoadProject(String fileName, var data, var model) async {
  for (int i = 0; i < data.length; i++) {
    model.runtimeType == OuterWallModel
        ? {
            model = OuterWallModel.fromJson(data[i]),
            await loadOuterWallModel(model),
          }
        //1
        : model.runtimeType == InnerWallModel
            ? {
                model = InnerWallModel.fromJson(data[i]),
                await loadInnerWallModel(model)
              }
            //2
            : model.runtimeType == DeckModel
                ? {
                    model = DeckModel.fromJson(data[i]),
                    await loadDeckModel(model),
                  }
                //3
                : model.runtimeType == InnerDoorModel
                    ? {
                        model = InnerDoorModel.fromJson(data[i]),
                        await loadInnerDoorModel(model),
                      }
                    //4
                    : model.runtimeType == ParquetAndLaminateModel
                        ? {
                            model = ParquetAndLaminateModel.fromJson(data[i]),
                            await loadParquetAndLaminateModel(model),
                          }
                        //5
                        : model.runtimeType == WindowsAndExteriorDoorsModel
                            ? {
                                model = WindowsAndExteriorDoorsModel.fromJson(
                                    data[i]),
                                await loadWindowsAndExteriorDoorsModel(model),
                              }
                            //6
                            : model.runtimeType == SupportSystemModel
                                ? {
                                    model =
                                        SupportSystemModel.fromJson(data[i]),
                                    await loadSupportSystemModel(model),
                                  }
                                //7
                                : model.runtimeType == FlooringModel
                                    ? {
                                        model = FlooringModel.fromJson(data[i]),
                                        await loadFlooringModel(model),
                                      }
                                    //8
                                    : model.runtimeType == TerraceModel
                                        ? {
                                            model =
                                                TerraceModel.fromJson(data[i]),
                                            await loadTerraceModel(model),
                                          }
                                        //9
                                        : model.runtimeType == OuterRoofModel
                                            ? {
                                                model = OuterRoofModel.fromJson(
                                                    data[i]),
                                                await loadOuterRoofModel(model),
                                              }
                                            //10
                                            : model.runtimeType ==
                                                    HullRoofingModel
                                                ? {
                                                    model = HullRoofingModel
                                                        .fromJson(data[i]),
                                                    await loadHullRoofingModel(
                                                        model),
                                                  }
                                                //11
                                                : model.runtimeType ==
                                                        ScaffoldingModel
                                                    ? {
                                                        model = ScaffoldingModel
                                                            .fromJson(data[i]),
                                                        await loadScaffoldingModel(
                                                            model),
                                                      }
                                                    //12
                                                    : model.runtimeType ==
                                                            InnerStairsModel
                                                        ? {
                                                            model =
                                                                InnerStairsModel
                                                                    .fromJson(
                                                                        data[
                                                                            i]),
                                                            await loadInnerStairsModel(
                                                                model),
                                                          }

                                                        //13
                                                        : {
                                                            model = WasteModel
                                                                .fromJson(
                                                                    data[i]),
                                                            await loadWasteModel(
                                                                model),
                                                          };
  }
}

Future<void> loadWasteModel(var model) async {
  double mat2Total = 0;
  double mat1Total = 0;
  double calculationQuantity = 0;
  for (int i = 0; i < norwWasteData.length; i++) {
    if (model.name == norwWasteData[i].name) {
      norwWasteData[i].name = model.name;
      norwWasteData[i].description = model.description;
      norwWasteData[i].unit = model.unit;
      norwWasteData[i].quantity = model.quantity;
      norwWasteData[i].laborHours1 = model.laborHours1;
      norwWasteData[i].laborHours2 = model.laborHours2;
      norwWasteData[i].laborCost = model.laborCost;
      norwWasteData[i].material = model.material;
      norwWasteData[i].materials = model.materials;
      norwWasteData[i].totalPrice = model.totalPrice;
      mat2Total = norwWasteData[i]
          .materials
          .fold(0, (previousValue, element) => previousValue + element);
      mat1Total = norwWasteData[i]
          .material
          .fold(0, (previousValue, element) => previousValue + element);
      if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
        double calculationQuantity = mat2Total / mat1Total;
        norwWasteCalculationControllers.text =
            calculationQuantity.toStringAsFixed(2);
      }
    }
    continue;
  }
}

Future<void> loadInnerStairsModel(var model) async {
  double mat2Total = 0;
  double mat1Total = 0;
  double calculationQuantity = 0;
  for (int i = 0; i < norwInnerStairsData.length; i++) {
    if (model.name == norwInnerStairsData[i].name) {
      norwInnerStairsData[i].name = model.name;
      norwInnerStairsData[i].description = model.description;
      norwInnerStairsData[i].unit = model.unit;
      norwInnerStairsData[i].quantity = model.quantity;
      norwInnerStairsData[i].laborHours1 = model.laborHours1;
      norwInnerStairsData[i].laborHours2 = model.laborHours2;
      norwInnerStairsData[i].laborCost = model.laborCost;
      norwInnerStairsData[i].material = model.material;
      norwInnerStairsData[i].materials = model.materials;
      norwInnerStairsData[i].totalPrice = model.totalPrice;
      mat2Total = norwInnerStairsData[i]
          .materials
          .fold(0, (previousValue, element) => previousValue + element);
      mat1Total = norwInnerStairsData[i]
          .material
          .fold(0, (previousValue, element) => previousValue + element);
      if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
        double calculationQuantity = mat2Total / mat1Total;
        norwInnerStairsCalculationControllers.text =
            calculationQuantity.toStringAsFixed(2);
      }
    }
    continue;
  }
}

Future<void> loadScaffoldingModel(var model) async {
  double mat2Total = 0;
  double mat1Total = 0;
  double calculationQuantity = 0;
  for (int i = 0; i < norwScaffoldingData.length; i++) {
    if (model.name == norwScaffoldingData[i].name) {
      norwScaffoldingData[i].name = model.name;
      norwScaffoldingData[i].description = model.description;
      norwScaffoldingData[i].unit = model.unit;
      norwScaffoldingData[i].quantity = model.quantity;
      norwScaffoldingData[i].laborHours1 = model.laborHours1;
      norwScaffoldingData[i].laborHours2 = model.laborHours2;
      norwScaffoldingData[i].laborCost = model.laborCost;
      norwScaffoldingData[i].material = model.material;
      norwScaffoldingData[i].materials = model.materials;
      norwScaffoldingData[i].totalPrice = model.totalPrice;
      mat2Total = norwScaffoldingData[i]
          .materials
          .fold(0, (previousValue, element) => previousValue + element);
      mat1Total = norwScaffoldingData[i]
          .material
          .fold(0, (previousValue, element) => previousValue + element);
      if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
        double calculationQuantity = mat2Total / mat1Total;
        norwScaffoldingCalculationControllers.text =
            calculationQuantity.toStringAsFixed(2);
      }
    }
    continue;
  }
}

Future<void> loadHullRoofingModel(var model) async {
  double mat2Total = 0;
  double mat1Total = 0;
  double calculationQuantity = 0;
  for (int i = 0; i < norwHullRoofingData.length; i++) {
    if (model.name == norwHullRoofingData[i].name) {
      norwHullRoofingData[i].name = model.name;
      norwHullRoofingData[i].description = model.description;
      norwHullRoofingData[i].unit = model.unit;
      norwHullRoofingData[i].quantity = model.quantity;
      norwHullRoofingData[i].laborHours1 = model.laborHours1;
      norwHullRoofingData[i].laborHours2 = model.laborHours2;
      norwHullRoofingData[i].laborCost = model.laborCost;
      norwHullRoofingData[i].material = model.material;
      norwHullRoofingData[i].materials = model.materials;
      norwHullRoofingData[i].totalPrice = model.totalPrice;
      mat2Total = norwHullRoofingData[i]
          .materials
          .fold(0, (previousValue, element) => previousValue + element);
      mat1Total = norwHullRoofingData[i]
          .material
          .fold(0, (previousValue, element) => previousValue + element);
      if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
        double calculationQuantity = mat2Total / mat1Total;
        norwHullCalculationControllers.text =
            calculationQuantity.toStringAsFixed(2);
      }
    }
    continue;
  }
}

Future<void> loadOuterRoofModel(var model) async {
  double mat2Total = 0;
  double mat1Total = 0;
  double calculationQuantity = 0;
  for (int i = 0; i < norwOuterRoofData.length; i++) {
    if (model.name == norwOuterRoofData[i].name) {
      norwOuterRoofData[i].name = model.name;
      norwOuterRoofData[i].description = model.description;
      norwOuterRoofData[i].unit = model.unit;
      norwOuterRoofData[i].quantity = model.quantity;
      norwOuterRoofData[i].materialQuantity = model.materialQuantity;
      norwOuterRoofData[i].laborHours1 = model.laborHours1;
      norwOuterRoofData[i].laborHours2 = model.laborHours2;
      norwOuterRoofData[i].laborCost = model.laborCost;
      norwOuterRoofData[i].material = model.material;
      norwOuterRoofData[i].materials = model.materials;
      norwOuterRoofData[i].totalPrice = model.totalPrice;
      mat2Total = norwOuterRoofData[i]
          .materials
          .fold(0, (previousValue, element) => previousValue + element);
      mat1Total = norwOuterRoofData[i]
          .material
          .fold(0, (previousValue, element) => previousValue + element);
      if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
        double calculationQuantity = mat2Total / mat1Total;
        norwOuterRoofCalculationControllers.text =
            calculationQuantity.toStringAsFixed(2);
      }
    }
    continue;
  }
}

Future<void> loadTerraceModel(var model) async {
  double mat2Total = 0;
  double mat1Total = 0;
  double calculationQuantity = 0;
  for (int i = 0; i < norwTerraceData.length; i++) {
    if (model.name == norwTerraceData[i].name) {
      norwTerraceData[i].name = model.name;
      norwTerraceData[i].description = model.description;
      norwTerraceData[i].unit = model.unit;
      norwTerraceData[i].quantity = model.quantity;
      norwTerraceData[i].laborHours1 = model.laborHours1;
      norwTerraceData[i].laborHours2 = model.laborHours2;
      norwTerraceData[i].laborCost = model.laborCost;
      norwTerraceData[i].material = model.material;
      norwTerraceData[i].materials = model.materials;
      norwTerraceData[i].totalPrice = model.totalPrice;
      mat2Total = norwTerraceData[i]
          .materials
          .fold(0, (previousValue, element) => previousValue + element);
      mat1Total = norwTerraceData[i]
          .material
          .fold(0, (previousValue, element) => previousValue + element);
      if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
        double calculationQuantity = mat2Total / mat1Total;
        norwTerraceCalculationControllers.text =
            calculationQuantity.toStringAsFixed(2);
      }
    }
    continue;
  }
}

Future<void> loadFlooringModel(var model) async {
  double mat2Total = 0;
  double mat1Total = 0;
  double calculationQuantity = 0;
  for (int i = 0; i < norwFlooringData.length; i++) {
    if (model.name == norwFlooringData[i].name) {
      norwFlooringData[i].name = model.name;
      norwFlooringData[i].description = model.description;
      norwFlooringData[i].unit = model.unit;
      norwFlooringData[i].quantity = model.quantity;
      norwFlooringData[i].laborHours1 = model.laborHours1;
      norwFlooringData[i].laborHours2 = model.laborHours2;
      norwFlooringData[i].laborCost = model.laborCost;
      norwFlooringData[i].material = model.material;
      norwFlooringData[i].materials = model.materials;
      norwFlooringData[i].totalPrice = model.totalPrice;
      mat2Total = norwFlooringData[i]
          .materials
          .fold(0, (previousValue, element) => previousValue + element);
      mat1Total = norwFlooringData[i]
          .material
          .fold(0, (previousValue, element) => previousValue + element);
      if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
        double calculationQuantity = mat2Total / mat1Total;
        norwFlooringCalculationControllers.text =
            calculationQuantity.toStringAsFixed(2);
      }
    }
    continue;
  }
}

Future<void> loadSupportSystemModel(var model) async {
  double mat2Total = 0;
  double mat1Total = 0;
  double calculationQuantity = 0;
  for (int i = 0; i < norwSupportSystem.length; i++) {
    if (model.name == norwSupportSystem[i].name) {
      norwSupportSystem[i].name = model.name;
      norwSupportSystem[i].description = model.description;
      norwSupportSystem[i].unit = model.unit;
      norwSupportSystem[i].quantity = model.quantity;
      norwSupportSystem[i].laborHours1 = model.laborHours1;
      norwSupportSystem[i].laborHours2 = model.laborHours2;
      norwSupportSystem[i].laborCost = model.laborCost;
      norwSupportSystem[i].material = model.material;
      norwSupportSystem[i].materials = model.materials;
      norwSupportSystem[i].totalPrice = model.totalPrice;
      mat2Total = norwSupportSystem[i]
          .materials
          .fold(0, (previousValue, element) => previousValue + element);
      mat1Total = norwSupportSystem[i]
          .material
          .fold(0, (previousValue, element) => previousValue + element);
      if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
        double calculationQuantity = mat2Total / mat1Total;
        norwSupportSystemCalculationQuantityController.text =
            calculationQuantity.toStringAsFixed(2);
      }
    }
    continue;
  }
}

Future<void> loadWindowsAndExteriorDoorsModel(var model) async {
  double mat2Total = 0;
  double mat1Total = 0;
  double calculationQuantity = 0;
  for (int i = 0; i < norwWindowsExteriorDoors.length; i++) {
    if (model.name == norwWindowsExteriorDoors[i].name) {
      norwWindowsExteriorDoors[i].name = model.name;
      norwWindowsExteriorDoors[i].description = model.description;
      norwWindowsExteriorDoors[i].unit = model.unit;
      norwWindowsExteriorDoors[i].quantity = model.quantity;
      norwWindowsExteriorDoors[i].laborHours1 = model.laborHours1;
      norwWindowsExteriorDoors[i].laborHours2 = model.laborHours2;
      norwWindowsExteriorDoors[i].laborCost = model.laborCost;
      norwWindowsExteriorDoors[i].material = model.material;
      norwWindowsExteriorDoors[i].materials = model.materials;
      norwWindowsExteriorDoors[i].totalPrice = model.totalPrice;
      mat2Total = norwWindowsExteriorDoors[i]
          .materials
          .fold(0, (previousValue, element) => previousValue + element);
      mat1Total = norwWindowsExteriorDoors[i]
          .material
          .fold(0, (previousValue, element) => previousValue + element);
      if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
        double calculationQuantity = mat2Total / mat1Total;
        norwWindowsExteriorDoorsCalculationControllers.text =
            calculationQuantity.toStringAsFixed(2);
      }
    }
    continue;
  }
}

Future<void> loadParquetAndLaminateModel(var model) async {
  double mat2Total = 0;
  double mat1Total = 0;
  double calculationQuantity = 0;
  for (int i = 0; i < norwParquetAndLaminate.length; i++) {
    if (model.name == norwParquetAndLaminate[i].name) {
      norwParquetAndLaminate[i].name = model.name;
      norwParquetAndLaminate[i].description = model.description;
      norwParquetAndLaminate[i].unit = model.unit;
      norwParquetAndLaminate[i].quantity = model.quantity;
      norwParquetAndLaminate[i].laborHours1 = model.laborHours1;
      norwParquetAndLaminate[i].laborHours2 = model.laborHours2;
      norwParquetAndLaminate[i].laborCost = model.laborCost;
      norwParquetAndLaminate[i].material = model.material;
      norwParquetAndLaminate[i].materials = model.materials;
      norwParquetAndLaminate[i].totalPrice = model.totalPrice;
      mat2Total = norwParquetAndLaminate[i]
          .materials
          .fold(0, (previousValue, element) => previousValue + element);
      mat1Total = norwParquetAndLaminate[i]
          .material
          .fold(0, (previousValue, element) => previousValue + element);
      if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
        double calculationQuantity = mat2Total / mat1Total;
        norwParquetAndLaminateCalculationControllers.text =
            calculationQuantity.toStringAsFixed(2);
      }
    }
    continue;
  }
}

Future<void> loadInnerDoorModel(var model) async {
  double mat2Total = 0;
  double mat1Total = 0;
  double calculationQuantity = 0;
  for (int i = 0; i < norwInnerDoor.length; i++) {
    if (model.name == norwInnerDoor[i].name) {
      norwInnerDoor[i].name = model.name;
      norwInnerDoor[i].description = model.description;
      norwInnerDoor[i].unit = model.unit;
      norwInnerDoor[i].quantity = model.quantity;
      norwInnerDoor[i].laborHours1 = model.laborHours1;
      norwInnerDoor[i].laborHours2 = model.laborHours2;
      norwInnerDoor[i].laborCost = model.laborCost;
      norwInnerDoor[i].material = model.material;
      norwInnerDoor[i].materials = model.materials;
      norwInnerDoor[i].totalPrice = model.totalPrice;
      mat2Total = norwInnerDoor[i]
          .materials
          .fold(0, (previousValue, element) => previousValue + element);
      mat1Total = norwInnerDoor[i]
          .material
          .fold(0, (previousValue, element) => previousValue + element);
      if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
        double calculationQuantity = mat2Total / mat1Total;
        norwInnerDoorCalculationControllers.text =
            calculationQuantity.toStringAsFixed(2);
      }
    }
    continue;
  }
}

Future<void> loadDeckModel(var model) async {
  double mat2Total = 0;
  double mat1Total = 0;
  double calculationQuantity = 0;
  for (int i = 0; i < norwDeckData.length; i++) {
    if (model.name == norwDeckData[i].name) {
      norwDeckData[i].name = model.name;
      norwDeckData[i].description = model.description;
      norwDeckData[i].unit = model.unit;
      norwDeckData[i].quantity = model.quantity;
      norwDeckData[i].laborHours1 = model.laborHours1;
      norwDeckData[i].laborHours2 = model.laborHours2;
      norwDeckData[i].laborCost = model.laborCost;
      norwDeckData[i].material = model.material;
      norwDeckData[i].materials = model.materials;
      norwDeckData[i].totalPrice = model.totalPrice;
      mat2Total = norwDeckData[i]
          .materials
          .fold(0, (previousValue, element) => previousValue + element);
      mat1Total = norwDeckData[i]
          .material
          .fold(0, (previousValue, element) => previousValue + element);
      if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
        double calculationQuantity = mat2Total / mat1Total;
        norwDeckCalculationControllers.text =
            calculationQuantity.toStringAsFixed(2);
      }
    }
    continue;
  }
}

Future<void> loadOuterWallModel(var model) async {
  double mat2Total = 0;
  double mat1Total = 0;
  double calculationQuantity = 0;
  for (int i = 0; i < norwExteriorWallData.length; i++) {
    if (model.name == norwExteriorWallData[i].name) {
      norwExteriorWallData[i].name = model.name;
      norwExteriorWallData[i].description = model.description;
      norwExteriorWallData[i].unit = model.unit;
      norwExteriorWallData[i].quantity = model.quantity;
      norwExteriorWallData[i].materialQuantity = model.materialQuantity;
      norwExteriorWallData[i].laborHours1 = model.laborHours1;
      norwExteriorWallData[i].laborHours2 = model.laborHours2;
      norwExteriorWallData[i].laborCost = model.laborCost;
      norwExteriorWallData[i].material = model.material;
      norwExteriorWallData[i].materials = model.materials;
      norwExteriorWallData[i].totalPrice = model.totalPrice;
      mat2Total = norwExteriorWallData[i]
          .materials
          .fold(0, (previousValue, element) => previousValue + element);
      mat1Total = norwExteriorWallData[i]
          .material
          .fold(0, (previousValue, element) => previousValue + element);
      if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
        double calculationQuantity = mat2Total / mat1Total;
        norwExteriorWallCalculationControllers.text =
            calculationQuantity.toStringAsFixed(2);
      }
    }
    continue;
  }
}

Future<void> loadInnerWallModel(var model) async {
  double mat2Total = 0;
  double mat1Total = 0;
  double calculationQuantity = 0;
  for (int i = 0; i < norwInnerWallData.length; i++) {
    if (model.name == norwInnerWallData[i].name) {
      norwInnerWallData[i].name = model.name;
      norwInnerWallData[i].description = model.description;
      norwInnerWallData[i].unit = model.unit;
      norwInnerWallData[i].quantity = model.quantity;
      norwInnerWallData[i].materialQuantity = model.materialQuantity;
      norwInnerWallData[i].laborHours1 = model.laborHours1;
      norwInnerWallData[i].laborHours2 = model.laborHours2;
      norwInnerWallData[i].laborCost = model.laborCost;
      norwInnerWallData[i].material1 = model.material1;
      norwInnerWallData[i].material2 = model.material2;
      norwInnerWallData[i].totalPrice = model.totalPrice;
      mat2Total = norwInnerWallData[i]
          .material2
          .fold(0, (previousValue, element) => previousValue + element);
      mat1Total = norwInnerWallData[i]
          .material1
          .fold(0, (previousValue, element) => previousValue + element);
      if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
        double calculationQuantity = mat2Total / mat1Total;
        norwInnerWallCalculationQuantityController.text =
            calculationQuantity.toStringAsFixed(2);
      }
    }
    continue;
  }
}
