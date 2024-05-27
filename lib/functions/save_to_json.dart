// file picker doesnt work
// make a pop up for user to input name then save the file to default download location?

import 'dart:convert';
import 'dart:io';
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

Future<File> localFile(String name) async {
  final path = await localPath;

  return File('$path/${name}.json');
}

Future<File> writeJson(var wallModel) async {
  final file = await localFile(wallModel.name);

  // Convert list of objects to a list of maps
  Map<String, dynamic> jsonData = wallModel.toJson();

  // Write the JSON string to the file
  await file.writeAsString(jsonEncode(jsonData));

  return file;
}

Future<File> _jsonFile(String fileName) async {
  final path = await localPath;

  return File('$path/${fileName}.json');
}

Future readJsonFile(String fileName) async {
  String jsonContent = "";
  File file = await _jsonFile(fileName);
  try {
    jsonContent = await file.readAsString();
    return json.decode(jsonContent);
  } catch (e) {
    print("Error reading from file: $e");
  }
  return null;
}
