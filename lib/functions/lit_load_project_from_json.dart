import 'package:cost_calculator/data/lith_data.dart';
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

Future<void> litLoadProject(String fileName, var data, var model) async {
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
  // double mat2Total = 0;
  // double mat1Total = 0;
  // double calculationQuantity = 0;
  for (int i = 0; i < litWasteData.length; i++) {
    if (model.name == litWasteData[i].name) {
      litWasteData[i].name = model.name;
      litWasteData[i].description = model.description;
      litWasteData[i].unit = model.unit;
      litWasteData[i].quantity = model.quantity;
      litWasteData[i].laborHours1 = model.laborHours1;
      litWasteData[i].laborHours2 = model.laborHours2;
      litWasteData[i].laborCost = model.laborCost;
      litWasteData[i].material = model.material;
      litWasteData[i].materials = model.materials;
      litWasteData[i].totalPrice = model.totalPrice;
      // mat2Total = litWasteData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = litWasteData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   litWasteCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}

Future<void> loadInnerStairsModel(var model) async {
  // double mat2Total = 0;
  // double mat1Total = 0;
  // double calculationQuantity = 0;
  for (int i = 0; i < litInnerStairsData.length; i++) {
    if (model.name == litInnerStairsData[i].name) {
      litInnerStairsData[i].name = model.name;
      litInnerStairsData[i].description = model.description;
      litInnerStairsData[i].unit = model.unit;
      litInnerStairsData[i].quantity = model.quantity;
      litInnerStairsData[i].laborHours1 = model.laborHours1;
      litInnerStairsData[i].laborHours2 = model.laborHours2;
      litInnerStairsData[i].laborCost = model.laborCost;
      litInnerStairsData[i].material = model.material;
      litInnerStairsData[i].materials = model.materials;
      litInnerStairsData[i].totalPrice = model.totalPrice;
      // mat2Total = litInnerStairsData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = litInnerStairsData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   litInnerStairsCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}

Future<void> loadScaffoldingModel(var model) async {
  // double mat2Total = 0;
  // double mat1Total = 0;
  // double calculationQuantity = 0;
  for (int i = 0; i < litScaffoldingData.length; i++) {
    if (model.name == litScaffoldingData[i].name) {
      litScaffoldingData[i].name = model.name;
      litScaffoldingData[i].description = model.description;
      litScaffoldingData[i].unit = model.unit;
      litScaffoldingData[i].quantity = model.quantity;
      litScaffoldingData[i].laborHours1 = model.laborHours1;
      litScaffoldingData[i].laborHours2 = model.laborHours2;
      litScaffoldingData[i].laborCost = model.laborCost;
      litScaffoldingData[i].material = model.material;
      litScaffoldingData[i].materials = model.materials;
      litScaffoldingData[i].totalPrice = model.totalPrice;
      // mat2Total = litScaffoldingData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = litScaffoldingData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   litScaffoldingCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}

Future<void> loadHullRoofingModel(var model) async {
  // double mat2Total = 0;
  // double mat1Total = 0;
  // double calculationQuantity = 0;
  for (int i = 0; i < litHullRoofingData.length; i++) {
    if (model.name == litHullRoofingData[i].name) {
      litHullRoofingData[i].name = model.name;
      litHullRoofingData[i].description = model.description;
      litHullRoofingData[i].unit = model.unit;
      litHullRoofingData[i].quantity = model.quantity;
      litHullRoofingData[i].laborHours1 = model.laborHours1;
      litHullRoofingData[i].laborHours2 = model.laborHours2;
      litHullRoofingData[i].laborCost = model.laborCost;
      litHullRoofingData[i].material = model.material;
      litHullRoofingData[i].materials = model.materials;
      litHullRoofingData[i].totalPrice = model.totalPrice;
      // mat2Total = litHullRoofingData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = litHullRoofingData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   litHullCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}

Future<void> loadOuterRoofModel(var model) async {
  // double mat2Total = 0;
  // double mat1Total = 0;
  // double calculationQuantity = 0;
  for (int i = 0; i < litOuterRoofData.length; i++) {
    if (model.name == litOuterRoofData[i].name) {
      litOuterRoofData[i].name = model.name;
      litOuterRoofData[i].description = model.description;
      litOuterRoofData[i].unit = model.unit;
      litOuterRoofData[i].quantity = model.quantity;
      litOuterRoofData[i].materialQuantity = model.materialQuantity;
      litOuterRoofData[i].laborHours1 = model.laborHours1;
      litOuterRoofData[i].laborHours2 = model.laborHours2;
      litOuterRoofData[i].laborCost = model.laborCost;
      litOuterRoofData[i].material = model.material;
      litOuterRoofData[i].materials = model.materials;
      litOuterRoofData[i].totalPrice = model.totalPrice;
      // mat2Total = litOuterRoofData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = litOuterRoofData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   litOuterRoofCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}

Future<void> loadTerraceModel(var model) async {
  // double mat2Total = 0;
  // double mat1Total = 0;
  // double calculationQuantity = 0;
  for (int i = 0; i < litTerraceData.length; i++) {
    if (model.name == litTerraceData[i].name) {
      litTerraceData[i].name = model.name;
      litTerraceData[i].description = model.description;
      litTerraceData[i].unit = model.unit;
      litTerraceData[i].quantity = model.quantity;
      litTerraceData[i].laborHours1 = model.laborHours1;
      litTerraceData[i].laborHours2 = model.laborHours2;
      litTerraceData[i].laborCost = model.laborCost;
      litTerraceData[i].material = model.material;
      litTerraceData[i].materials = model.materials;
      litTerraceData[i].totalPrice = model.totalPrice;
      // mat2Total = litTerraceData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = litTerraceData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   litTerraceCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}

Future<void> loadFlooringModel(var model) async {
  // double mat2Total = 0;
  // double mat1Total = 0;
  // double calculationQuantity = 0;
  for (int i = 0; i < litFlooringData.length; i++) {
    if (model.name == litFlooringData[i].name) {
      litFlooringData[i].name = model.name;
      litFlooringData[i].description = model.description;
      litFlooringData[i].unit = model.unit;
      litFlooringData[i].quantity = model.quantity;
      litFlooringData[i].laborHours1 = model.laborHours1;
      litFlooringData[i].laborHours2 = model.laborHours2;
      litFlooringData[i].laborCost = model.laborCost;
      litFlooringData[i].material = model.material;
      litFlooringData[i].materials = model.materials;
      litFlooringData[i].totalPrice = model.totalPrice;
      // mat2Total = litFlooringData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = litFlooringData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   litFlooringCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}

Future<void> loadSupportSystemModel(var model) async {
  // double mat2Total = 0;
  // double mat1Total = 0;
  // double calculationQuantity = 0;
  for (int i = 0; i < litSupportSystem.length; i++) {
    if (model.name == litSupportSystem[i].name) {
      litSupportSystem[i].name = model.name;
      litSupportSystem[i].description = model.description;
      litSupportSystem[i].unit = model.unit;
      litSupportSystem[i].quantity = model.quantity;
      litSupportSystem[i].laborHours1 = model.laborHours1;
      litSupportSystem[i].laborHours2 = model.laborHours2;
      litSupportSystem[i].laborCost = model.laborCost;
      litSupportSystem[i].material = model.material;
      litSupportSystem[i].materials = model.materials;
      litSupportSystem[i].totalPrice = model.totalPrice;
      // mat2Total = litSupportSystem[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = litSupportSystem[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   litSupportSystemCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}

Future<void> loadWindowsAndExteriorDoorsModel(var model) async {
  // double mat2Total = 0;
  // double mat1Total = 0;
  // double calculationQuantity = 0;
  for (int i = 0; i < litWindowsExteriorDoors.length; i++) {
    if (model.name == litWindowsExteriorDoors[i].name) {
      litWindowsExteriorDoors[i].name = model.name;
      litWindowsExteriorDoors[i].description = model.description;
      litWindowsExteriorDoors[i].unit = model.unit;
      litWindowsExteriorDoors[i].quantity = model.quantity;
      litWindowsExteriorDoors[i].laborHours1 = model.laborHours1;
      litWindowsExteriorDoors[i].laborHours2 = model.laborHours2;
      litWindowsExteriorDoors[i].laborCost = model.laborCost;
      litWindowsExteriorDoors[i].material = model.material;
      litWindowsExteriorDoors[i].materials = model.materials;
      litWindowsExteriorDoors[i].totalPrice = model.totalPrice;
      // mat2Total = litWindowsExteriorDoors[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = litWindowsExteriorDoors[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   litWindowsExteriorDoorsCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}

Future<void> loadParquetAndLaminateModel(var model) async {
  // double mat2Total = 0;
  // double mat1Total = 0;
  // double calculationQuantity = 0;
  for (int i = 0; i < litParquetAndLaminate.length; i++) {
    if (model.name == litParquetAndLaminate[i].name) {
      litParquetAndLaminate[i].name = model.name;
      litParquetAndLaminate[i].description = model.description;
      litParquetAndLaminate[i].unit = model.unit;
      litParquetAndLaminate[i].quantity = model.quantity;
      litParquetAndLaminate[i].laborHours1 = model.laborHours1;
      litParquetAndLaminate[i].laborHours2 = model.laborHours2;
      litParquetAndLaminate[i].laborCost = model.laborCost;
      litParquetAndLaminate[i].material = model.material;
      litParquetAndLaminate[i].materials = model.materials;
      litParquetAndLaminate[i].totalPrice = model.totalPrice;
      // mat2Total = litParquetAndLaminate[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = litParquetAndLaminate[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   litParquetAndLaminateCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}

Future<void> loadInnerDoorModel(var model) async {
  // double mat2Total = 0;
  // double mat1Total = 0;
  // double calculationQuantity = 0;
  for (int i = 0; i < litInnerDoor.length; i++) {
    if (model.name == litInnerDoor[i].name) {
      litInnerDoor[i].name = model.name;
      litInnerDoor[i].description = model.description;
      litInnerDoor[i].unit = model.unit;
      litInnerDoor[i].quantity = model.quantity;
      litInnerDoor[i].laborHours1 = model.laborHours1;
      litInnerDoor[i].laborHours2 = model.laborHours2;
      litInnerDoor[i].laborCost = model.laborCost;
      litInnerDoor[i].material = model.material;
      litInnerDoor[i].materials = model.materials;
      litInnerDoor[i].totalPrice = model.totalPrice;
      // mat2Total = litInnerDoor[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = litInnerDoor[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   litInnerDoorCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}

Future<void> loadDeckModel(var model) async {
  // double mat2Total = 0;
  // double mat1Total = 0;
  // double calculationQuantity = 0;
  for (int i = 0; i < litDeckData.length; i++) {
    if (model.name == litDeckData[i].name) {
      litDeckData[i].name = model.name;
      litDeckData[i].description = model.description;
      litDeckData[i].unit = model.unit;
      litDeckData[i].quantity = model.quantity;
      litDeckData[i].laborHours1 = model.laborHours1;
      litDeckData[i].laborHours2 = model.laborHours2;
      litDeckData[i].laborCost = model.laborCost;
      litDeckData[i].material = model.material;
      litDeckData[i].materials = model.materials;
      litDeckData[i].totalPrice = model.totalPrice;
      // mat2Total = litDeckData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = litDeckData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   litDeckCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}

Future<void> loadOuterWallModel(var model) async {
  // double mat2Total = 0;
  // double mat1Total = 0;
  // double calculationQuantity = 0;
  for (int i = 0; i < litExteriorWallData.length; i++) {
    if (model.name == litExteriorWallData[i].name) {
      litExteriorWallData[i].name = model.name;
      litExteriorWallData[i].description = model.description;
      litExteriorWallData[i].unit = model.unit;
      litExteriorWallData[i].quantity = model.quantity;
      litExteriorWallData[i].materialQuantity = model.materialQuantity;
      litExteriorWallData[i].laborHours1 = model.laborHours1;
      litExteriorWallData[i].laborHours2 = model.laborHours2;
      litExteriorWallData[i].laborCost = model.laborCost;
      litExteriorWallData[i].material = model.material;
      litExteriorWallData[i].materials = model.materials;
      litExteriorWallData[i].totalPrice = model.totalPrice;
      // mat2Total = litExteriorWallData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = litExteriorWallData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   litExteriorWallCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}

Future<void> loadInnerWallModel(var model) async {
  // double mat2Total = 0;
  // double mat1Total = 0;
  // double calculationQuantity = 0;
  for (int i = 0; i < litInnerWallData.length; i++) {
    if (model.name == litInnerWallData[i].name) {
      litInnerWallData[i].name = model.name;
      litInnerWallData[i].description = model.description;
      litInnerWallData[i].unit = model.unit;
      litInnerWallData[i].quantity = model.quantity;
      litInnerWallData[i].materialQuantity = model.materialQuantity;
      litInnerWallData[i].laborHours1 = model.laborHours1;
      litInnerWallData[i].laborHours2 = model.laborHours2;
      litInnerWallData[i].laborCost = model.laborCost;
      litInnerWallData[i].material1 = model.material1;
      litInnerWallData[i].material2 = model.material2;
      litInnerWallData[i].totalPrice = model.totalPrice;
      // mat2Total = litInnerWallData[i]
      //     .material2
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = litInnerWallData[i]
      //     .material1
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   litSupportSystemCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}
