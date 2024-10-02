import 'package:cost_calculator/data/data.dart';
import 'package:cost_calculator/data/norw_data.dart';
import 'package:cost_calculator/functions/save_to_json.dart';

Future<void> saveProject(String projectName, var savingModel) async {
  for (int i = 0; i < savingModel.length; i++) {
    await writeJsonOriginal(savingModel[i], projectName);
    if (i < savingModel.length - 1) {
      await writeJsonComma(projectName);
    }
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
  await writeJsonArrayStart(fileName);
  await saveProject(fileName, norwInnerWallData);

  // Add commas between each section
  if (norwDeckData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, norwDeckData);
  }

  if (norwInnerDoor.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, norwInnerDoor);
  }

  if (norwWindowsExteriorDoors.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, norwWindowsExteriorDoors);
  }

  if (norwSupportSystem.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, norwSupportSystem);
  }

  if (norwFlooringData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, norwFlooringData);
  }

  if (norwTerraceData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, norwTerraceData);
  }

  if (norwOuterRoofData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, norwOuterRoofData);
  }

  if (norwExteriorWallData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, norwExteriorWallData);
  }

  if (norwHullRoofingData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, norwHullRoofingData);
  }

  if (norwScaffoldingData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, norwScaffoldingData);
  }

  if (norwInnerStairsData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, norwInnerStairsData);
  }

  if (norwWasteData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, norwWasteData);
  }

  await writeJsonArrayEnd(fileName); // End the JSON array
}
