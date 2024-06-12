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

Future<void> fileDeleteIfExists(String name) async {
  final file = await localFile(name);
  if (await file.exists()) {
    await file.delete();
  }
}

Future<File> writeJsonArrayStart(String name) async {
  final file = await localFile(name);
  await file.writeAsString(
    mode: FileMode.writeOnlyAppend,
    "[",
  );

  return file;
}

Future<File> writeJsonComma(String name) async {
  final file = await localFile(name);
  await file.writeAsString(
    mode: FileMode.writeOnlyAppend,
    ",",
  );

  return file;
}

Future<File> writeJsonArrayEnd(String name) async {
  final file = await localFile(name);
  await file.writeAsString(
    mode: FileMode.writeOnlyAppend,
    "]",
  );

  return file;
}

Future<File> writeJson(var model, String name) async {
  final file = await localFile(name);
  // Convert list of objects to a list of maps
  Map<String, dynamic> jsonData = model.toJson();

  // Write the JSON string to the file
  await file.writeAsString(
    mode: FileMode.writeOnlyAppend,
    jsonEncode(jsonData),
  );

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
