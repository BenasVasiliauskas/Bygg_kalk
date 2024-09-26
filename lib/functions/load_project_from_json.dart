import 'package:cost_calculator/constants/budget_constants.dart';
import 'package:cost_calculator/data/data.dart';
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

Future<void> loadProject(String fileName, var data, var model) async {
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
                                                //1
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
  for (int i = 0; i < wasteData.length; i++) {
    if (model.name == wasteData[i].name) {
      wasteData[i].name = model.name;
      wasteData[i].description = model.description;
      wasteData[i].unit = model.unit;
      wasteData[i].quantity = model.quantity;
      wasteData[i].laborHours1 = model.laborHours1;
      wasteData[i].laborHours2 = model.laborHours2;
      wasteData[i].laborCost = model.laborCost;
      wasteData[i].material = model.material;
      wasteData[i].materials = model.materials;
      wasteData[i].totalPrice = model.totalPrice;
      wasteData[i].calculationQuantity = model.calculationQuantity;
    }
    continue;
  }
}

Future<void> loadInnerStairsModel(var model) async {
  for (int i = 0; i < innerStairsData.length; i++) {
    if (model.name == innerStairsData[i].name) {
      innerStairsData[i].name = model.name;
      innerStairsData[i].description = model.description;
      innerStairsData[i].unit = model.unit;
      innerStairsData[i].quantity = model.quantity;
      innerStairsData[i].laborHours1 = model.laborHours1;
      innerStairsData[i].laborHours2 = model.laborHours2;
      innerStairsData[i].laborCost = model.laborCost;
      innerStairsData[i].material = model.material;
      innerStairsData[i].materials = model.materials;
      innerStairsData[i].totalPrice = model.totalPrice;
      innerStairsData[i].calculationQuantity = model.calculationQuantity;
    }
    continue;
  }
}

Future<void> loadScaffoldingModel(var model) async {
  for (int i = 0; i < scaffoldingData.length; i++) {
    if (model.name == scaffoldingData[i].name) {
      scaffoldingData[i].name = model.name;
      scaffoldingData[i].description = model.description;
      scaffoldingData[i].unit = model.unit;
      scaffoldingData[i].quantity = model.quantity;
      scaffoldingData[i].laborHours1 = model.laborHours1;
      scaffoldingData[i].laborHours2 = model.laborHours2;
      scaffoldingData[i].laborCost = model.laborCost;
      scaffoldingData[i].material = model.material;
      scaffoldingData[i].materials = model.materials;
      scaffoldingData[i].totalPrice = model.totalPrice;
      scaffoldingData[i].calculationQuantity = model.calculationQuantity;
    }
    continue;
  }
}

Future<void> loadHullRoofingModel(var model) async {
  for (int i = 0; i < hullRoofingData.length; i++) {
    if (model.name == hullRoofingData[i].name) {
      hullRoofingData[i].name = model.name;
      hullRoofingData[i].description = model.description;
      hullRoofingData[i].unit = model.unit;
      hullRoofingData[i].quantity = model.quantity;
      hullRoofingData[i].laborHours1 = model.laborHours1;
      hullRoofingData[i].laborHours2 = model.laborHours2;
      hullRoofingData[i].laborCost = model.laborCost;
      hullRoofingData[i].material = model.material;
      hullRoofingData[i].materials = model.materials;
      hullRoofingData[i].totalPrice = model.totalPrice;
      hullRoofingData[i].calculationQuantity = model.calculationQuantity;
    }
    continue;
  }
}

Future<void> loadOuterRoofModel(var model) async {
  for (int i = 0; i < outerRoofData.length; i++) {
    if (model.name == outerRoofData[i].name) {
      outerRoofData[i].name = model.name;
      outerRoofData[i].description = model.description;
      outerRoofData[i].unit = model.unit;
      outerRoofData[i].quantity = model.quantity;
      outerRoofData[i].materialQuantity = model.materialQuantity;
      outerRoofData[i].laborHours1 = model.laborHours1;
      outerRoofData[i].laborHours2 = model.laborHours2;
      outerRoofData[i].laborCost = model.laborCost;
      outerRoofData[i].material = model.material;
      outerRoofData[i].materials = model.materials;
      outerRoofData[i].totalPrice = model.totalPrice;
      outerRoofData[i].calculationQuantity = model.calculationQuantity;
    }
    continue;
  }
}

Future<void> loadTerraceModel(var model) async {
  for (int i = 0; i < terraceData.length; i++) {
    if (model.name == terraceData[i].name) {
      terraceData[i].name = model.name;
      terraceData[i].description = model.description;
      terraceData[i].unit = model.unit;
      terraceData[i].quantity = model.quantity;
      terraceData[i].laborHours1 = model.laborHours1;
      terraceData[i].laborHours2 = model.laborHours2;
      terraceData[i].laborCost = model.laborCost;
      terraceData[i].material = model.material;
      terraceData[i].materials = model.materials;
      terraceData[i].totalPrice = model.totalPrice;
      terraceData[i].calculationQuantity = model.calculationQuantity;
    }
    continue;
  }
}

Future<void> loadFlooringModel(var model) async {
  for (int i = 0; i < flooringData.length; i++) {
    if (model.name == flooringData[i].name) {
      flooringData[i].name = model.name;
      flooringData[i].description = model.description;
      flooringData[i].unit = model.unit;
      flooringData[i].quantity = model.quantity;
      flooringData[i].laborHours1 = model.laborHours1;
      flooringData[i].laborHours2 = model.laborHours2;
      flooringData[i].laborCost = model.laborCost;
      flooringData[i].material = model.material;
      flooringData[i].materials = model.materials;
      flooringData[i].totalPrice = model.totalPrice;
      flooringData[i].calculationQuantity = model.calculationQuantity;
    }
    continue;
  }
}

Future<void> loadSupportSystemModel(var model) async {
  for (int i = 0; i < supportSystem.length; i++) {
    if (model.name == supportSystem[i].name) {
      supportSystem[i].name = model.name;
      supportSystem[i].description = model.description;
      supportSystem[i].unit = model.unit;
      supportSystem[i].quantity = model.quantity;
      supportSystem[i].laborHours1 = model.laborHours1;
      supportSystem[i].laborHours2 = model.laborHours2;
      supportSystem[i].laborCost = model.laborCost;
      supportSystem[i].material = model.material;
      supportSystem[i].materials = model.materials;
      supportSystem[i].totalPrice = model.totalPrice;
      supportSystem[i].calculationQuantity = model.calculationQuantity;
    }
    continue;
  }
}

Future<void> loadWindowsAndExteriorDoorsModel(var model) async {
  for (int i = 0; i < windowsExteriorDoors.length; i++) {
    if (model.name == windowsExteriorDoors[i].name) {
      windowsExteriorDoors[i].name = model.name;
      windowsExteriorDoors[i].description = model.description;
      windowsExteriorDoors[i].unit = model.unit;
      windowsExteriorDoors[i].quantity = model.quantity;
      windowsExteriorDoors[i].laborHours1 = model.laborHours1;
      windowsExteriorDoors[i].laborHours2 = model.laborHours2;
      windowsExteriorDoors[i].laborCost = model.laborCost;
      windowsExteriorDoors[i].material = model.material;
      windowsExteriorDoors[i].materials = model.materials;
      windowsExteriorDoors[i].totalPrice = model.totalPrice;
      windowsExteriorDoors[i].calculationQuantity = model.calculationQuantity;
    }
    continue;
  }
}

Future<void> loadInnerDoorModel(var model) async {
  for (int i = 0; i < innerDoor.length; i++) {
    if (model.name == innerDoor[i].name) {
      innerDoor[i].name = model.name;
      innerDoor[i].description = model.description;
      innerDoor[i].unit = model.unit;
      innerDoor[i].quantity = model.quantity;
      innerDoor[i].laborHours1 = model.laborHours1;
      innerDoor[i].laborHours2 = model.laborHours2;
      innerDoor[i].laborCost = model.laborCost;
      innerDoor[i].material = model.material;
      innerDoor[i].materials = model.materials;
      innerDoor[i].totalPrice = model.totalPrice;
      innerDoor[i].calculationQuantity = model.calculationQuantity;
    }
    continue;
  }
}

Future<void> loadDeckModel(var model) async {
  for (int i = 0; i < deckData.length; i++) {
    if (model.name == deckData[i].name) {
      deckData[i].name = model.name;
      deckData[i].description = model.description;
      deckData[i].unit = model.unit;
      deckData[i].quantity = model.quantity;
      deckData[i].laborHours1 = model.laborHours1;
      deckData[i].laborHours2 = model.laborHours2;
      deckData[i].laborCost = model.laborCost;
      deckData[i].material = model.material;
      deckData[i].materials = model.materials;
      deckData[i].totalPrice = model.totalPrice;
      deckData[i].calculationQuantity = model.calculationQuantity;
    }
    continue;
  }
}

Future<void> loadOuterWallModel(var model) async {
  for (int i = 0; i < exteriorWallData.length; i++) {
    if (model.name == exteriorWallData[i].name) {
      exteriorWallData[i].name = model.name;
      exteriorWallData[i].description = model.description;
      exteriorWallData[i].unit = model.unit;
      exteriorWallData[i].quantity = model.quantity;
      exteriorWallData[i].materialQuantity = model.materialQuantity;
      exteriorWallData[i].laborHours1 = model.laborHours1;
      exteriorWallData[i].laborHours2 = model.laborHours2;
      exteriorWallData[i].laborCost = model.laborCost;
      exteriorWallData[i].material = model.material;
      exteriorWallData[i].materials = model.materials;
      exteriorWallData[i].totalPrice = model.totalPrice;
      exteriorWallData[i].calculationQuantity = model.calculationQuantity;
    }
    continue;
  }
}

Future<void> loadInnerWallModel(var model) async {
  for (int i = 0; i < dataInnerWallData.length; i++) {
    if (model.name == dataInnerWallData[i].name) {
      dataInnerWallData[i].name = model.name;
      dataInnerWallData[i].description = model.description;
      dataInnerWallData[i].unit = model.unit;
      dataInnerWallData[i].quantity = model.quantity;
      dataInnerWallData[i].materialQuantity = model.materialQuantity;
      dataInnerWallData[i].laborHours1 = model.laborHours1;
      dataInnerWallData[i].laborHours2 = model.laborHours2;
      dataInnerWallData[i].laborCost = model.laborCost;
      dataInnerWallData[i].material1 = model.material1;
      dataInnerWallData[i].material2 = model.material2;
      dataInnerWallData[i].totalPrice = model.totalPrice;
      dataInnerWallData[i].calculationQuantity = model.calculationQuantity;
    }
    continue;
  }
}
