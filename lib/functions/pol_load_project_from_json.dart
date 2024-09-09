import 'package:cost_calculator/data/polish_data.dart';
import 'package:cost_calculator/models/deck_data_model.dart';
import 'package:cost_calculator/models/flooring_data_model.dart';
import 'package:cost_calculator/models/hull_roofing_data_model.dart';
import 'package:cost_calculator/models/inner_door_data_model.dart';
import 'package:cost_calculator/models/inner_stairs_model.dart';
import 'package:cost_calculator/models/inner_wall_data_model.dart';
import 'package:cost_calculator/models/outer_roof_model.dart';
import 'package:cost_calculator/models/outer_wall_data_model.dart';
import 'package:cost_calculator/models/scaffolding_data_model.dart';
import 'package:cost_calculator/models/support_system_data_model.dart';
import 'package:cost_calculator/models/terrace_model.dart';
import 'package:cost_calculator/models/waste_data_model.dart';
import 'package:cost_calculator/models/windows_exterior_doors_model.dart';

Future<void> polLoadProject(String fileName, var data, var model) async {
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
                    : model.runtimeType == WindowsAndExteriorDoorsModel
                        ? {
                            model =
                                WindowsAndExteriorDoorsModel.fromJson(data[i]),
                            await loadWindowsAndExteriorDoorsModel(model),
                          }
                        //5
                        : model.runtimeType == SupportSystemModel
                            ? {
                                model = SupportSystemModel.fromJson(data[i]),
                                await loadSupportSystemModel(model),
                              }
                            //6
                            : model.runtimeType == FlooringModel
                                ? {
                                    model = FlooringModel.fromJson(data[i]),
                                    await loadFlooringModel(model),
                                  }
                                //7
                                : model.runtimeType == TerraceModel
                                    ? {
                                        model = TerraceModel.fromJson(data[i]),
                                        await loadTerraceModel(model),
                                      }
                                    //8
                                    : model.runtimeType == OuterRoofModel
                                        ? {
                                            model = OuterRoofModel.fromJson(
                                                data[i]),
                                            await loadOuterRoofModel(model),
                                          }
                                        //9
                                        : model.runtimeType == HullRoofingModel
                                            ? {
                                                model =
                                                    HullRoofingModel.fromJson(
                                                        data[i]),
                                                await loadHullRoofingModel(
                                                    model),
                                              }
                                            //10
                                            : model.runtimeType ==
                                                    ScaffoldingModel
                                                ? {
                                                    model = ScaffoldingModel
                                                        .fromJson(data[i]),
                                                    await loadScaffoldingModel(
                                                        model),
                                                  }
                                                //11
                                                : model.runtimeType ==
                                                        InnerStairsModel
                                                    ? {
                                                        model = InnerStairsModel
                                                            .fromJson(data[i]),
                                                        await loadInnerStairsModel(
                                                            model),
                                                      }

                                                    //12
                                                    : {
                                                        model =
                                                            WasteModel.fromJson(
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
  for (int i = 0; i < polWasteData.length; i++) {
    if (model.name == polWasteData[i].name) {
      polWasteData[i].name = model.name;
      polWasteData[i].description = model.description;
      polWasteData[i].unit = model.unit;
      polWasteData[i].quantity = model.quantity;
      polWasteData[i].laborHours1 = model.laborHours1;
      polWasteData[i].laborHours2 = model.laborHours2;
      polWasteData[i].laborCost = model.laborCost;
      polWasteData[i].material = model.material;
      polWasteData[i].materials = model.materials;
      polWasteData[i].totalPrice = model.totalPrice;
      // mat2Total = polWasteData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = polWasteData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   polWasteCalculationControllers.text =
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
  for (int i = 0; i < polInnerStairsData.length; i++) {
    if (model.name == polInnerStairsData[i].name) {
      polInnerStairsData[i].name = model.name;
      polInnerStairsData[i].description = model.description;
      polInnerStairsData[i].unit = model.unit;
      polInnerStairsData[i].quantity = model.quantity;
      polInnerStairsData[i].laborHours1 = model.laborHours1;
      polInnerStairsData[i].laborHours2 = model.laborHours2;
      polInnerStairsData[i].laborCost = model.laborCost;
      polInnerStairsData[i].material = model.material;
      polInnerStairsData[i].materials = model.materials;
      polInnerStairsData[i].totalPrice = model.totalPrice;
      // mat2Total = polInnerStairsData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = polInnerStairsData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   polInnerStairsCalculationControllers.text =
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
  for (int i = 0; i < polScaffoldingData.length; i++) {
    if (model.name == polScaffoldingData[i].name) {
      polScaffoldingData[i].name = model.name;
      polScaffoldingData[i].description = model.description;
      polScaffoldingData[i].unit = model.unit;
      polScaffoldingData[i].quantity = model.quantity;
      polScaffoldingData[i].laborHours1 = model.laborHours1;
      polScaffoldingData[i].laborHours2 = model.laborHours2;
      polScaffoldingData[i].laborCost = model.laborCost;
      polScaffoldingData[i].material = model.material;
      polScaffoldingData[i].materials = model.materials;
      polScaffoldingData[i].totalPrice = model.totalPrice;
      // mat2Total = polScaffoldingData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = polScaffoldingData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   polScaffoldingCalculationControllers.text =
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
  for (int i = 0; i < polHullRoofingData.length; i++) {
    if (model.name == polHullRoofingData[i].name) {
      polHullRoofingData[i].name = model.name;
      polHullRoofingData[i].description = model.description;
      polHullRoofingData[i].unit = model.unit;
      polHullRoofingData[i].quantity = model.quantity;
      polHullRoofingData[i].laborHours1 = model.laborHours1;
      polHullRoofingData[i].laborHours2 = model.laborHours2;
      polHullRoofingData[i].laborCost = model.laborCost;
      polHullRoofingData[i].material = model.material;
      polHullRoofingData[i].materials = model.materials;
      polHullRoofingData[i].totalPrice = model.totalPrice;
      // mat2Total = polHullRoofingData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = polHullRoofingData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   polHullCalculationControllers.text =
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
  for (int i = 0; i < polOuterRoofData.length; i++) {
    if (model.name == polOuterRoofData[i].name) {
      polOuterRoofData[i].name = model.name;
      polOuterRoofData[i].description = model.description;
      polOuterRoofData[i].unit = model.unit;
      polOuterRoofData[i].quantity = model.quantity;
      polOuterRoofData[i].materialQuantity = model.materialQuantity;
      polOuterRoofData[i].laborHours1 = model.laborHours1;
      polOuterRoofData[i].laborHours2 = model.laborHours2;
      polOuterRoofData[i].laborCost = model.laborCost;
      polOuterRoofData[i].material = model.material;
      polOuterRoofData[i].materials = model.materials;
      polOuterRoofData[i].totalPrice = model.totalPrice;
      // mat2Total = polOuterRoofData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = polOuterRoofData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   polOuterRoofCalculationControllers.text =
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
  for (int i = 0; i < polTerraceData.length; i++) {
    if (model.name == polTerraceData[i].name) {
      polTerraceData[i].name = model.name;
      polTerraceData[i].description = model.description;
      polTerraceData[i].unit = model.unit;
      polTerraceData[i].quantity = model.quantity;
      polTerraceData[i].laborHours1 = model.laborHours1;
      polTerraceData[i].laborHours2 = model.laborHours2;
      polTerraceData[i].laborCost = model.laborCost;
      polTerraceData[i].material = model.material;
      polTerraceData[i].materials = model.materials;
      polTerraceData[i].totalPrice = model.totalPrice;
      // mat2Total = polTerraceData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = polTerraceData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   polTerraceCalculationControllers.text =
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
  for (int i = 0; i < polFlooringData.length; i++) {
    if (model.name == polFlooringData[i].name) {
      polFlooringData[i].name = model.name;
      polFlooringData[i].description = model.description;
      polFlooringData[i].unit = model.unit;
      polFlooringData[i].quantity = model.quantity;
      polFlooringData[i].laborHours1 = model.laborHours1;
      polFlooringData[i].laborHours2 = model.laborHours2;
      polFlooringData[i].laborCost = model.laborCost;
      polFlooringData[i].material = model.material;
      polFlooringData[i].materials = model.materials;
      polFlooringData[i].totalPrice = model.totalPrice;
      // mat2Total = polFlooringData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = polFlooringData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   polFlooringCalculationControllers.text =
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
  for (int i = 0; i < polSupportSystem.length; i++) {
    if (model.name == polSupportSystem[i].name) {
      polSupportSystem[i].name = model.name;
      polSupportSystem[i].description = model.description;
      polSupportSystem[i].unit = model.unit;
      polSupportSystem[i].quantity = model.quantity;
      polSupportSystem[i].laborHours1 = model.laborHours1;
      polSupportSystem[i].laborHours2 = model.laborHours2;
      polSupportSystem[i].laborCost = model.laborCost;
      polSupportSystem[i].material = model.material;
      polSupportSystem[i].materials = model.materials;
      polSupportSystem[i].totalPrice = model.totalPrice;
      // mat2Total = polSupportSystem[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = polSupportSystem[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   polSupportSystemCalculationControllers.text =
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
  for (int i = 0; i < polWindowsExteriorDoors.length; i++) {
    if (model.name == polWindowsExteriorDoors[i].name) {
      polWindowsExteriorDoors[i].name = model.name;
      polWindowsExteriorDoors[i].description = model.description;
      polWindowsExteriorDoors[i].unit = model.unit;
      polWindowsExteriorDoors[i].quantity = model.quantity;
      polWindowsExteriorDoors[i].laborHours1 = model.laborHours1;
      polWindowsExteriorDoors[i].laborHours2 = model.laborHours2;
      polWindowsExteriorDoors[i].laborCost = model.laborCost;
      polWindowsExteriorDoors[i].material = model.material;
      polWindowsExteriorDoors[i].materials = model.materials;
      polWindowsExteriorDoors[i].totalPrice = model.totalPrice;
      // mat2Total = polWindowsExteriorDoors[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = polWindowsExteriorDoors[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   polWindowsExteriorDoorsCalculationControllers.text =
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
  for (int i = 0; i < polInnerDoor.length; i++) {
    if (model.name == polInnerDoor[i].name) {
      polInnerDoor[i].name = model.name;
      polInnerDoor[i].description = model.description;
      polInnerDoor[i].unit = model.unit;
      polInnerDoor[i].quantity = model.quantity;
      polInnerDoor[i].laborHours1 = model.laborHours1;
      polInnerDoor[i].laborHours2 = model.laborHours2;
      polInnerDoor[i].laborCost = model.laborCost;
      polInnerDoor[i].material = model.material;
      polInnerDoor[i].materials = model.materials;
      polInnerDoor[i].totalPrice = model.totalPrice;
      // mat2Total = polInnerDoor[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = polInnerDoor[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   polInnerDoorCalculationControllers.text =
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
  for (int i = 0; i < polDeckData.length; i++) {
    if (model.name == polDeckData[i].name) {
      polDeckData[i].name = model.name;
      polDeckData[i].description = model.description;
      polDeckData[i].unit = model.unit;
      polDeckData[i].quantity = model.quantity;
      polDeckData[i].laborHours1 = model.laborHours1;
      polDeckData[i].laborHours2 = model.laborHours2;
      polDeckData[i].laborCost = model.laborCost;
      polDeckData[i].material = model.material;
      polDeckData[i].materials = model.materials;
      polDeckData[i].totalPrice = model.totalPrice;
      // mat2Total = polDeckData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = polDeckData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   polDeckCalculationControllers.text =
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
  for (int i = 0; i < polExteriorWallData.length; i++) {
    if (model.name == polExteriorWallData[i].name) {
      polExteriorWallData[i].name = model.name;
      polExteriorWallData[i].description = model.description;
      polExteriorWallData[i].unit = model.unit;
      polExteriorWallData[i].quantity = model.quantity;
      polExteriorWallData[i].materialQuantity = model.materialQuantity;
      polExteriorWallData[i].laborHours1 = model.laborHours1;
      polExteriorWallData[i].laborHours2 = model.laborHours2;
      polExteriorWallData[i].laborCost = model.laborCost;
      polExteriorWallData[i].material = model.material;
      polExteriorWallData[i].materials = model.materials;
      polExteriorWallData[i].totalPrice = model.totalPrice;
      // mat2Total = polExteriorWallData[i]
      //     .materials
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = polExteriorWallData[i]
      //     .material
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   polExteriorWallCalculationControllers.text =
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
  for (int i = 0; i < polInnerWallData.length; i++) {
    if (model.name == polInnerWallData[i].name) {
      polInnerWallData[i].name = model.name;
      polInnerWallData[i].description = model.description;
      polInnerWallData[i].unit = model.unit;
      polInnerWallData[i].quantity = model.quantity;
      polInnerWallData[i].materialQuantity = model.materialQuantity;
      polInnerWallData[i].laborHours1 = model.laborHours1;
      polInnerWallData[i].laborHours2 = model.laborHours2;
      polInnerWallData[i].laborCost = model.laborCost;
      polInnerWallData[i].material1 = model.material1;
      polInnerWallData[i].material2 = model.material2;
      polInnerWallData[i].totalPrice = model.totalPrice;
      // mat2Total = polInnerWallData[i]
      //     .material2
      //     .fold(0, (previousValue, element) => previousValue + element);
      // mat1Total = polInnerWallData[i]
      //     .material1
      //     .fold(0, (previousValue, element) => previousValue + element);
      // if (calculationQuantity == 0 && mat2Total != 0 && mat1Total != 0) {
      //   double calculationQuantity = mat2Total / mat1Total;
      //   polSupportSystemCalculationControllers.text =
      //       calculationQuantity.toStringAsFixed(2);
      // }
    }
    continue;
  }
}
