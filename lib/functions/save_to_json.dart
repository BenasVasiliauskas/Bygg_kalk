// file picker doesnt work
// make a pop up for user to input name then save the file to default download location?

import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> get localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get localFile async {
  final path = await localPath;
  return File('$path/counter.json');
}

Future<File> writeCounter(
    String fileName,
    String dataName,
    List<String> dataDescription,
    List<String> dataUnit,
    List<String> dataQuantity,
    List<String> dataMaterialQuantity) async {
  final file = await localFile;

  // Write the file
  file.writeAsString('$fileName (' + '\n');
  file.writeAsString('name: \n');
  file.writeAsString('$dataName' + ',\n');
  //Description writing
  file.writeAsString('description: [' + '\n');
  for (int i = 0; i < dataDescription.length; i++) {
    file.writeAsString(dataDescription[i] + ',\n');
  }
  file.writeAsString(']' + '\n');
  //Unit writing
  file.writeAsString('unit: [' + '\n');
  for (int i = 0; i < dataUnit.length; i++) {
    file.writeAsString(dataUnit[i] + ',\n');
  }
  file.writeAsString(']' + '\n');
  //Quantity
  file.writeAsString('quantity: [' + '\n');
  for (int i = 0; i < dataQuantity.length; i++) {
    file.writeAsString(dataQuantity[i] + ',\n');
  }
  file.writeAsString(']' + '\n');
  //Material quantity
  file.writeAsString('materialQuantity: [' + '\n');
  for (int i = 0; i < dataMaterialQuantity.length; i++) {
    file.writeAsString(dataMaterialQuantity[i] + ',\n');
  }
  file.writeAsString(']' + '\n');
  //Labor hours1

  
  //Labor hours2
  //Labor cost
  //Material cost1
  //Mateiral cost2
  //Total cost

  return file;
}
