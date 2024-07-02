import 'package:cost_calculator/data/data.dart';
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

Future<void> loadProject(String fileName, var data, var model) async {
  for (int i = 0; i < data.length; i++) {
    model.runtimeType == OuterWallModel
        ? {
            model = OuterWallModel.fromJson(data[i]),
            await loadOuterWall(model),
          }
        //1
        : model.runtimeType == InnerWallModel
            ? {
                model = InnerWallModel.fromJson(data[i]),
                await loadInnerWall(model)
              }
            //2
            : model.runtimeType == DeckModel
                ? {
                    model = DeckModel.fromJson(data[i]),
                    // await deckModel(model)
                  }
                //3
                : model.runtimeType == InnerDoorModel
                    ? {
                        model = InnerDoorModel.fromJson(data[i]),
                        // await innerDoor(model)
                      }
                    //4
                    : model.runtimeType == ParquetAndLaminateModel
                        ? {
                            model = ParquetAndLaminateModel.fromJson(data[i]),
                            // await parquetAndLaminate(model)
                          }
                        //5
                        : model.runtimeType == WindowsAndExteriorDoorsModel
                            ? {
                                model = WindowsAndExteriorDoorsModel.fromJson(
                                    data[i]),
                                //await windowsAndExteriorDoors
                              }
                            //6
                            : model.runtimeType == SupportSystemModel
                                ? {
                                    model =
                                        SupportSystemModel.fromJson(data[i]),
                                    //await supportSystem(model)
                                  }
                                //7
                                : model.runtimeType == FlooringModel
                                    ? {
                                        model = FlooringModel.fromJson(data[i]),
                                        //await flooring(model)
                                      }
                                    //8
                                    : model.runtimeType == TerraceModel
                                        ? {
                                            model =
                                                TerraceModel.fromJson(data[i]),
                                            //await terrace(model)
                                          }
                                        //9
                                        : model.runtimeType == OuterRoofModel
                                            ? {
                                                model = OuterRoofModel.fromJson(
                                                    data[i]),
                                                //await outerRoof(model)
                                              }
                                            //10
                                            : model.runtimeType ==
                                                    HullRoofingModel
                                                ? {
                                                    model = HullRoofingModel
                                                        .fromJson(data[i]),
                                                    //await hullRoofing(model)
                                                  }
                                                //11
                                                : model.runtimeType ==
                                                        ScaffoldingModel
                                                    ? {
                                                        model = ScaffoldingModel
                                                            .fromJson(data[i]),
                                                        //await scaffolding(model)
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
                                                            //await innerStairs(model)
                                                          }
                                                        //13
                                                        : model.runtimeType ==
                                                                SupportSystemModel
                                                            ? {
                                                                model = SupportSystemModel
                                                                    .fromJson(
                                                                        data[
                                                                            i]),
                                                                //await supportSystem(model)
                                                              }
                                                            //14
                                                            : {
                                                                model = WasteModel
                                                                    .fromJson(
                                                                        data[
                                                                            i]),
                                                                //await waste(model)
                                                              };
  }
}

Future<void> loadOuterWall(var model) async {
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
    }
  }
}

Future<void> loadInnerWall(var model) async {
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
      dataInnerWallData[i].material1 = model.material;
      //gets set 0
      dataInnerWallData[i].material2 = model.materials;
      dataInnerWallData[i].totalPrice = model.totalPrice;
    }
  }
}
