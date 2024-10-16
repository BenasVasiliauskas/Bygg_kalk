import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/data/norwegian_data_folder/norw_data.dart';
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
  await writeJsonArrayStart(fileName);
  await saveProject(fileName, dataInnerWallData);

  if (deckData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, deckData);
  }
  if (innerDoor.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, innerDoor);
  }
  if (windowsExteriorDoors.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, windowsExteriorDoors);
  }
  if (supportSystem.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, supportSystem);
  }
  if (flooringData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, flooringData);
  }
  if (terraceData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, terraceData);
  }
  if (outerRoofData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, outerRoofData);
  }
  if (exteriorWallData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, exteriorWallData);
  }
  if (hullRoofingData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, hullRoofingData);
  }
  if (scaffoldingData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, scaffoldingData);
  }
  if (innerStairsData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, innerStairsData);
  }
  if (wasteData.isNotEmpty) {
    await writeJsonComma(fileName);
    await saveProject(fileName, wasteData);
  }

  await writeJsonArrayEnd(fileName);
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
