// file picker doesnt work
// make a pop up for user to input name then save the file to default download location?

import 'dart:convert';

import 'dart:io';

import 'package:cost_calculator/models/inner_wall_data_model.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get localPath async {
  final directory;
  if (Platform.isIOS) {
    directory = await getApplicationDocumentsDirectory();
  } else if (Platform.isAndroid) {
    directory = Directory('/storage/emulated/0/Download');
  } else if (Platform.isWindows) {
    return Directory.current.path;
  } else {
    directory = await getApplicationDocumentsDirectory();
  }
  return directory.path;
}

Future<File> get localFile async {
  final path = await localPath;

  return File('$path/InnerWalls.json');
}

Future<File> writeJson(InnerWallModel wallModel) async {
  final file = await localFile;

  // Convert list of InnerWallModel objects to a list of maps
  Map<String, dynamic> jsonData = wallModel.toJson();

  // Write the JSON string to the file
  await file.writeAsString(jsonEncode(jsonData));

  return file;
}

Future<File> get _jsonFile async {
  final path = await localPath;

  return File('$path/InnerWalls.json');
}

Future readJsonFile() async {
  String jsonContent = "";
  File file = await _jsonFile;
  try {
    jsonContent = await file.readAsString();
    return json.decode(jsonContent);
  } catch (e) {
    print("Error reading from file: $e");
  }
  return null;
}
