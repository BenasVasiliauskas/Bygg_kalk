import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/functions/save_to_json.dart';

Future<void> saveProject(String projectName, var savingModel) async {
  for (int i = 0; i < savingModel.length; i++) {
    await writeJsonOriginal(savingModel[i], projectName);
    if (i < savingModel.length && i != savingModel.length - 1)
      await writeJsonComma(projectName);
  }
}

Future<void> saveEngProjectToJSON(
  String fileName,
) async {
  await saveProject(fileName, dataInnerWallData);
  await writeJsonComma(fileName);
  await saveProject(fileName, deckData);
  await writeJsonComma(fileName);
  await saveProject(fileName, innerDoor);
  await writeJsonComma(fileName);
  await saveProject(fileName, windowsExteriorDoors);
  await writeJsonComma(fileName);
  await saveProject(fileName, supportSystem);
  await writeJsonComma(fileName);
  await saveProject(fileName, flooringData);
  await writeJsonComma(fileName);
  await saveProject(fileName, terraceData);
  await writeJsonComma(fileName);
  await saveProject(fileName, outerRoofData);
  await writeJsonComma(fileName);
  await saveProject(fileName, exteriorWallData);
  await writeJsonComma(fileName);
  await saveProject(fileName, hullRoofingData);
  await writeJsonComma(fileName);
  await saveProject(fileName, scaffoldingData);
  await writeJsonComma(fileName);
  await saveProject(fileName, innerStairsData);
  await writeJsonComma(fileName);
  await saveProject(fileName, wasteData);
}

Future<void> saveNorwProjectToJson(String fileName) async {
  await saveProject(fileName, norwInnerWallData);
  await writeJsonComma(fileName);
  await saveProject(fileName, norwDeckData);
  await writeJsonComma(fileName);
  await saveProject(fileName, norwInnerDoor);
  await writeJsonComma(fileName);
  await saveProject(fileName, norwWindowsExteriorDoors);
  await writeJsonComma(fileName);
  await saveProject(fileName, norwSupportSystem);
  await writeJsonComma(fileName);
  await saveProject(fileName, norwFlooringData);
  await writeJsonComma(fileName);
  await saveProject(fileName, norwTerraceData);
  await writeJsonComma(fileName);
  await saveProject(fileName, norwOuterRoofData);
  await writeJsonComma(fileName);
  await saveProject(fileName, norwExteriorWallData);
  await writeJsonComma(fileName);
  await saveProject(fileName, norwHullRoofingData);
  await writeJsonComma(fileName);
  await saveProject(fileName, norwScaffoldingData);
  await writeJsonComma(fileName);
  await saveProject(fileName, norwInnerStairsData);
  await writeJsonComma(fileName);
  await saveProject(fileName, norwWasteData);
}
