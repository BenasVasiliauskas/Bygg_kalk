import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/innerwall_constants.dart';

Future<String?> getDownloadPath() async {
  Directory? directory;
  try {
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else if (Platform.isAndroid) {
      directory = Directory('/storage/emulated/0/Download');
      // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
      if (!await directory.exists())
        directory = await getExternalStorageDirectory();
    } else if (Platform.isWindows) {
      return Directory.current.path;
    }
  } catch (err) {
    print("Cannot get download folder path");
  }
  return directory?.path;
}

void addDataInnerWall(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  Workbook workbook,
) {
  double sumOfHours1 = 0;
  double sumOfCustomHours = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;

  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Material quantity');
  worksheet.getRangeByIndex(1, 5).setText('Hours');
  worksheet.getRangeByIndex(1, 6).setText('Custom hours');
  worksheet.getRangeByIndex(1, 7).setText('Hours2');
  worksheet.getRangeByIndex(1, 8).setText('Job cost');
  worksheet.getRangeByIndex(1, 9).setText('Material');
  worksheet.getRangeByIndex(1, 10).setText('Material cost');
  worksheet.getRangeByIndex(1, 11).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfCustomHours.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterial.toString());
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 11).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].text);
      worksheet.getRangeByIndex(i + 2, 4).setText(materialQuantityList[i].text);
      worksheet.getRangeByIndex(i + 2, 5).setText(laborHours1List[i].text);
      sumOfHours1 += double.parse(laborHours1List[i].text);
      worksheet.getRangeByIndex(i + 2, 6).setText(customColumnList[i].text);
      sumOfCustomHours += double.parse(customColumnList[i].text);
      worksheet.getRangeByIndex(i + 2, 7).setText(laborHours2List[i].text);
      sumOfHours2 += double.parse(laborHours2List[i].text);
      worksheet.getRangeByIndex(i + 2, 8).setText(laborCostList[i].text);
      sumOfJobCost += double.parse(laborCostList[i].text);
      worksheet.getRangeByIndex(i + 2, 9).setText(material1List[i].text);
      sumOfMaterial += double.parse(material1List[i].text);
      worksheet.getRangeByIndex(i + 2, 10).setText(material2List[i].text);
      sumOfMaterialCost += double.parse(material2List[i].text);
      worksheet.getRangeByIndex(i + 2, 11).setText(totalPriceList[i].text);
      sumOfTotalPrice += double.parse(totalPriceList[i].text);
    }
  }

  worksheet.getRangeByName('A1:K1').autoFit();
  worksheet.getRangeByName('A1:A14').autoFit();

  workbook.worksheets.addWithSheet(worksheet);
}

void addDataExteriorWall(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfCustomHours = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:K1');
  Range range1 = worksheet.getRangeByName('A1:A14');

  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Material quantity');
  worksheet.getRangeByIndex(1, 5).setText('Hours');
  worksheet.getRangeByIndex(1, 6).setText('Custom hours');
  worksheet.getRangeByIndex(1, 7).setText('Hours2');
  worksheet.getRangeByIndex(1, 8).setText('Job cost');
  worksheet.getRangeByIndex(1, 9).setText('Material');
  worksheet.getRangeByIndex(1, 10).setText('Material cost');
  worksheet.getRangeByIndex(1, 11).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfCustomHours.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterial.toString());
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 11).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].text);
      worksheet.getRangeByIndex(i + 2, 4).setText(materialQuantityList[i].text);
      worksheet.getRangeByIndex(i + 2, 5).setText(laborHours1List[i].text);
      sumOfHours1 += double.parse(laborHours1List[i].text);
      worksheet.getRangeByIndex(i + 2, 6).setText(customColumnList[i].text);
      sumOfCustomHours += double.parse(customColumnList[i].text);
      worksheet.getRangeByIndex(i + 2, 7).setText(laborHours2List[i].text);
      sumOfHours2 += double.parse(laborHours2List[i].text);
      worksheet.getRangeByIndex(i + 2, 8).setText(laborCostList[i].text);
      sumOfJobCost += double.parse(laborCostList[i].text);
      worksheet.getRangeByIndex(i + 2, 9).setText(material1List[i].text);
      sumOfMaterial += double.parse(material1List[i].text);
      worksheet.getRangeByIndex(i + 2, 10).setText(material2List[i].text);
      sumOfMaterialCost += double.parse(material2List[i].text);
      worksheet.getRangeByIndex(i + 2, 11).setText(totalPriceList[i].text);
      sumOfTotalPrice += double.parse(totalPriceList[i].text);
    }
  }
  range.cellStyle.wrapText = false;
  range.autoFit();

  range1.cellStyle.wrapText = false;
  range1.autoFit();

  norwOuterWallWorkbook.worksheets.addWithSheet(worksheet);
}

void addDataNorwExteriorWall(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfCustomHours = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:K1');
  Range range1 = worksheet.getRangeByName('A1:A14');

  worksheet.getRangeByIndex(1, 1).setText('Beskrivelse');
  worksheet.getRangeByIndex(1, 2).setText('Enhet');
  worksheet.getRangeByIndex(1, 3).setText('Antall');
  worksheet.getRangeByIndex(1, 4).setText('Materialmengde');
  worksheet.getRangeByIndex(1, 5).setText('Timer');
  worksheet.getRangeByIndex(1, 6).setText('Tilpassede timer');
  worksheet.getRangeByIndex(1, 7).setText('Sum. tid.');
  worksheet.getRangeByIndex(1, 8).setText('Jobbkostnad');
  worksheet.getRangeByIndex(1, 9).setText('Materiale');
  worksheet.getRangeByIndex(1, 10).setText('Materialkostnad');
  worksheet.getRangeByIndex(1, 11).setText('Totalpris');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total (eks. mva)");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfCustomHours.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterial.toString());
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 11).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].text);
      worksheet.getRangeByIndex(i + 2, 4).setText(materialQuantityList[i].text);
      worksheet.getRangeByIndex(i + 2, 5).setText(laborHours1List[i].text);
      sumOfHours1 += double.parse(laborHours1List[i].text);
      worksheet.getRangeByIndex(i + 2, 6).setText(customColumnList[i].text);
      sumOfCustomHours += double.parse(customColumnList[i].text);
      worksheet.getRangeByIndex(i + 2, 7).setText(laborHours2List[i].text);
      sumOfHours2 += double.parse(laborHours2List[i].text);
      worksheet.getRangeByIndex(i + 2, 8).setText(laborCostList[i].text);
      sumOfJobCost += double.parse(laborCostList[i].text);
      worksheet.getRangeByIndex(i + 2, 9).setText(material1List[i].text);
      sumOfMaterial += double.parse(material1List[i].text);
      worksheet.getRangeByIndex(i + 2, 10).setText(material2List[i].text);
      sumOfMaterialCost += double.parse(material2List[i].text);
      worksheet.getRangeByIndex(i + 2, 11).setText(totalPriceList[i].text);
      sumOfTotalPrice += double.parse(totalPriceList[i].text);
    }
  }
  range.cellStyle.wrapText = false;
  range.autoFit();

  range1.cellStyle.wrapText = false;
  range1.autoFit();

  norwOuterWallWorkbook.worksheets.addWithSheet(worksheet);
}

void addDataInnerDoor(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfCustomHours = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:K1');
  Range range1 = worksheet.getRangeByName('A1:A14');

  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Material quantity');
  worksheet.getRangeByIndex(1, 5).setText('Hours');
  worksheet.getRangeByIndex(1, 6).setText('Custom hours');
  worksheet.getRangeByIndex(1, 7).setText('Hours2');
  worksheet.getRangeByIndex(1, 8).setText('Job cost');
  worksheet.getRangeByIndex(1, 9).setText('Material');
  worksheet.getRangeByIndex(1, 10).setText('Material cost');
  worksheet.getRangeByIndex(1, 11).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfCustomHours.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterial.toString());
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 11).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].text);
      worksheet.getRangeByIndex(i + 2, 4).setText(materialQuantityList[i].text);
      worksheet.getRangeByIndex(i + 2, 5).setText(laborHours1List[i].text);
      sumOfHours1 += double.parse(laborHours1List[i].text);
      worksheet.getRangeByIndex(i + 2, 6).setText(customColumnList[i].text);
      sumOfCustomHours += double.parse(customColumnList[i].text);
      worksheet.getRangeByIndex(i + 2, 7).setText(laborHours2List[i].text);
      sumOfHours2 += double.parse(laborHours2List[i].text);
      worksheet.getRangeByIndex(i + 2, 8).setText(laborCostList[i].text);
      sumOfJobCost += double.parse(laborCostList[i].text);
      worksheet.getRangeByIndex(i + 2, 9).setText(material1List[i].text);
      sumOfMaterial += double.parse(material1List[i].text);
      worksheet.getRangeByIndex(i + 2, 10).setText(material2List[i].text);
      sumOfMaterialCost += double.parse(material2List[i].text);
      worksheet.getRangeByIndex(i + 2, 11).setText(totalPriceList[i].text);
      sumOfTotalPrice += double.parse(totalPriceList[i].text);
    }
  }
  range.cellStyle.wrapText = false;
  range.autoFit();

  range1.cellStyle.wrapText = false;
  range1.autoFit();

  innerDoorWorkbook.worksheets.addWithSheet(worksheet);
}

void addDataWindowsExteriorDoors(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfCustomHours = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:K1');
  Range range1 = worksheet.getRangeByName('A1:A14');

  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Material quantity');
  worksheet.getRangeByIndex(1, 5).setText('Hours');
  worksheet.getRangeByIndex(1, 6).setText('Custom hours');
  worksheet.getRangeByIndex(1, 7).setText('Hours2');
  worksheet.getRangeByIndex(1, 8).setText('Job cost');
  worksheet.getRangeByIndex(1, 9).setText('Material');
  worksheet.getRangeByIndex(1, 10).setText('Material cost');
  worksheet.getRangeByIndex(1, 11).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfCustomHours.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterial.toString());
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 11).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].text);
      worksheet.getRangeByIndex(i + 2, 4).setText(materialQuantityList[i].text);
      worksheet.getRangeByIndex(i + 2, 5).setText(laborHours1List[i].text);
      sumOfHours1 += double.parse(laborHours1List[i].text);
      worksheet.getRangeByIndex(i + 2, 6).setText(customColumnList[i].text);
      sumOfCustomHours += double.parse(customColumnList[i].text);
      worksheet.getRangeByIndex(i + 2, 7).setText(laborHours2List[i].text);
      sumOfHours2 += double.parse(laborHours2List[i].text);
      worksheet.getRangeByIndex(i + 2, 8).setText(laborCostList[i].text);
      sumOfJobCost += double.parse(laborCostList[i].text);
      worksheet.getRangeByIndex(i + 2, 9).setText(material1List[i].text);
      sumOfMaterial += double.parse(material1List[i].text);
      worksheet.getRangeByIndex(i + 2, 10).setText(material2List[i].text);
      sumOfMaterialCost += double.parse(material2List[i].text);
      worksheet.getRangeByIndex(i + 2, 11).setText(totalPriceList[i].text);
      sumOfTotalPrice += double.parse(totalPriceList[i].text);
    }
  }
  range.cellStyle.wrapText = false;
  range.autoFit();

  range1.cellStyle.wrapText = false;
  range1.autoFit();

  windowsExteriorDoorsWorkbook.worksheets.addWithSheet(worksheet);
}

void addDataParquetAndLaminate(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfCustomHours = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:K1');
  Range range1 = worksheet.getRangeByName('A1:A14');

  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Material quantity');
  worksheet.getRangeByIndex(1, 5).setText('Hours');
  worksheet.getRangeByIndex(1, 6).setText('Custom hours');
  worksheet.getRangeByIndex(1, 7).setText('Hours2');
  worksheet.getRangeByIndex(1, 8).setText('Job cost');
  worksheet.getRangeByIndex(1, 9).setText('Material');
  worksheet.getRangeByIndex(1, 10).setText('Material cost');
  worksheet.getRangeByIndex(1, 11).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfCustomHours.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterial.toString());
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 11).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].text);
      worksheet.getRangeByIndex(i + 2, 4).setText(materialQuantityList[i].text);
      worksheet.getRangeByIndex(i + 2, 5).setText(laborHours1List[i].text);
      sumOfHours1 += double.parse(laborHours1List[i].text);
      worksheet.getRangeByIndex(i + 2, 6).setText(customColumnList[i].text);
      sumOfCustomHours += double.parse(customColumnList[i].text);
      worksheet.getRangeByIndex(i + 2, 7).setText(laborHours2List[i].text);
      sumOfHours2 += double.parse(laborHours2List[i].text);
      worksheet.getRangeByIndex(i + 2, 8).setText(laborCostList[i].text);
      sumOfJobCost += double.parse(laborCostList[i].text);
      worksheet.getRangeByIndex(i + 2, 9).setText(material1List[i].text);
      sumOfMaterial += double.parse(material1List[i].text);
      worksheet.getRangeByIndex(i + 2, 10).setText(material2List[i].text);
      sumOfMaterialCost += double.parse(material2List[i].text);
      worksheet.getRangeByIndex(i + 2, 11).setText(totalPriceList[i].text);
      sumOfTotalPrice += double.parse(totalPriceList[i].text);
    }
  }
  range.cellStyle.wrapText = false;
  range.autoFit();

  range1.cellStyle.wrapText = false;
  range1.autoFit();

  parquetAndLaminateWorkbook.worksheets.addWithSheet(worksheet);
}

void addDataKitchen(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfCustomHours = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:K1');
  Range range1 = worksheet.getRangeByName('A1:A14');

  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Material quantity');
  worksheet.getRangeByIndex(1, 5).setText('Hours');
  worksheet.getRangeByIndex(1, 6).setText('Custom hours');
  worksheet.getRangeByIndex(1, 7).setText('Hours2');
  worksheet.getRangeByIndex(1, 8).setText('Job cost');
  worksheet.getRangeByIndex(1, 9).setText('Material');
  worksheet.getRangeByIndex(1, 10).setText('Material cost');
  worksheet.getRangeByIndex(1, 11).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfCustomHours.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterial.toString());
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 11).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].text);
      worksheet.getRangeByIndex(i + 2, 4).setText(materialQuantityList[i].text);
      worksheet.getRangeByIndex(i + 2, 5).setText(laborHours1List[i].text);
      sumOfHours1 += double.parse(laborHours1List[i].text);
      worksheet.getRangeByIndex(i + 2, 6).setText(customColumnList[i].text);
      sumOfCustomHours += double.parse(customColumnList[i].text);
      worksheet.getRangeByIndex(i + 2, 7).setText(laborHours2List[i].text);
      sumOfHours2 += double.parse(laborHours2List[i].text);
      worksheet.getRangeByIndex(i + 2, 8).setText(laborCostList[i].text);
      sumOfJobCost += double.parse(laborCostList[i].text);
      worksheet.getRangeByIndex(i + 2, 9).setText(material1List[i].text);
      sumOfMaterial += double.parse(material1List[i].text);
      worksheet.getRangeByIndex(i + 2, 10).setText(material2List[i].text);
      sumOfMaterialCost += double.parse(material2List[i].text);
      worksheet.getRangeByIndex(i + 2, 11).setText(totalPriceList[i].text);
      sumOfTotalPrice += double.parse(totalPriceList[i].text);
    }
  }
  range.cellStyle.wrapText = false;
  range.autoFit();

  range1.cellStyle.wrapText = false;
  range1.autoFit();

  kitchenWorkbook.worksheets.addWithSheet(worksheet);
}

Future<void> generateInnerWallExcelDocument(
  String excelName,
  List<DataColumn> columns,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  String tabletName,
) async {
  addDataInnerWall(
    switch (tabletName) {
      "Wooden truss 48x98, double sound wall, double plaster" =>
        innerWallWorksheet1,
      "Wooden trusses 48x98, insulated, smooth panel" => innerWallWorksheet2,
      "Wooden truss 48x98, precut h=2400, plaster" => innerWallWorksheet3,
      "Steel trusses 2x75mm, double, insulated, plaster" => innerWallWorksheet4,
      "Steel trusses 2x100mm, double, insulated, plaster" =>
        innerWallWorksheet5,
      "Steel trusses 2x75mm, double, insulated, double plaster" =>
        innerWallWorksheet6,
      _ => innerWallWorksheet1,
    },
    descriptionList,
    unitList,
    quantityLists,
    materialQuantityList,
    laborHours1List,
    customColumnList,
    laborHours2List,
    laborCostList,
    material1List,
    material2List,
    totalPriceList,
    innerWallWorkbook,
  );

  final List<int> bytes = innerWallWorkbook.saveAsStream();

  String? downloadPath = await getDownloadPath();
  String filePath = '$downloadPath/' + excelName + '.xlsx';
  File(filePath).writeAsBytes(bytes);
}

Future<void> generateExteriorWallExcelDocument(
  String excelName,
  List<DataColumn> columns,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  String tabletName,
) async {
  final Worksheet worksheet = exteriorWallWorkbook.worksheets[0];

  addDataExteriorWall(
    switch (tabletName) {
      "Timber truss 48x198, 50mm liner, standing double seam, plaster" =>
        worksheet,
      _ => worksheet,
    },
    descriptionList,
    unitList,
    quantityLists,
    materialQuantityList,
    laborHours1List,
    customColumnList,
    laborHours2List,
    laborCostList,
    material1List,
    material2List,
    totalPriceList,
  );

  final List<int> bytes = exteriorWallWorkbook.saveAsStream();

  String? downloadPath = await getDownloadPath();
  String filePath = '$downloadPath/' + excelName + '.xlsx';
  File(filePath).writeAsBytes(bytes);
}

void addNorwKitchenData(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfCustomHours = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:K1');
  Range range1 = worksheet.getRangeByName('A1:A14');

  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Material quantity');
  worksheet.getRangeByIndex(1, 5).setText('Hours');
  worksheet.getRangeByIndex(1, 6).setText('Custom hours');
  worksheet.getRangeByIndex(1, 7).setText('Hours2');
  worksheet.getRangeByIndex(1, 8).setText('Job cost');
  worksheet.getRangeByIndex(1, 9).setText('Material');
  worksheet.getRangeByIndex(1, 10).setText('Material cost');
  worksheet.getRangeByIndex(1, 11).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfCustomHours.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterial.toString());
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 11).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].text);
      worksheet.getRangeByIndex(i + 2, 4).setText(materialQuantityList[i].text);
      worksheet.getRangeByIndex(i + 2, 5).setText(laborHours1List[i].text);
      sumOfHours1 += double.parse(laborHours1List[i].text);
      worksheet.getRangeByIndex(i + 2, 6).setText(customColumnList[i].text);
      sumOfCustomHours += double.parse(customColumnList[i].text);
      worksheet.getRangeByIndex(i + 2, 7).setText(laborHours2List[i].text);
      sumOfHours2 += double.parse(laborHours2List[i].text);
      worksheet.getRangeByIndex(i + 2, 8).setText(laborCostList[i].text);
      sumOfJobCost += double.parse(laborCostList[i].text);
      worksheet.getRangeByIndex(i + 2, 9).setText(material1List[i].text);
      sumOfMaterial += double.parse(material1List[i].text);
      worksheet.getRangeByIndex(i + 2, 10).setText(material2List[i].text);
      sumOfMaterialCost += double.parse(material2List[i].text);
      worksheet.getRangeByIndex(i + 2, 11).setText(totalPriceList[i].text);
      sumOfTotalPrice += double.parse(totalPriceList[i].text);
    }
  }
  range.cellStyle.wrapText = false;
  range.autoFit();

  range1.cellStyle.wrapText = false;
  range1.autoFit();

  norwKitchenWorkbook.worksheets.addWithSheet(worksheet);
}

Future<void> generateNorwKitchenExcelDocument(
  String excelName,
  List<DataColumn> columns,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  String tabletName,
) async {
  final Worksheet worksheet = norwKitchenWorkbook.worksheets[0];

  addNorwKitchenData(
    switch (tabletName) {
      "Innredning i bolig, kjøkken overskap" => worksheet,
      _ => worksheet,
    },
    descriptionList,
    unitList,
    quantityLists,
    materialQuantityList,
    laborHours1List,
    customColumnList,
    laborHours2List,
    laborCostList,
    material1List,
    material2List,
    totalPriceList,
  );

  final List<int> bytes = norwKitchenWorkbook.saveAsStream();

  String? downloadPath = await getDownloadPath();
  String filePath = '$downloadPath/' + excelName + '.xlsx';
  File(filePath).writeAsBytes(bytes);
}

Future<void> generateNorwParquetAndLaminateExcelDocument(
  String excelName,
  List<DataColumn> columns,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  String tabletName,
) async {
  final Worksheet worksheet = norwParquetAndLaminateWorkbook.worksheets[0];

  addDataNorwParquetAndLaminate(
    switch (tabletName) {
      "Overflate dekker parkett" => worksheet,
      _ => worksheet,
    },
    descriptionList,
    unitList,
    quantityLists,
    materialQuantityList,
    laborHours1List,
    customColumnList,
    laborHours2List,
    laborCostList,
    material1List,
    material2List,
    totalPriceList,
  );

  final List<int> bytes = norwParquetAndLaminateWorkbook.saveAsStream();

  String? downloadPath = await getDownloadPath();
  String filePath = '$downloadPath/' + excelName + '.xlsx';
  File(filePath).writeAsBytes(bytes);
}

void addDataNorwParquetAndLaminate(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfCustomHours = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:K1');
  Range range1 = worksheet.getRangeByName('A1:A14');

  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Material quantity');
  worksheet.getRangeByIndex(1, 5).setText('Hours');
  worksheet.getRangeByIndex(1, 6).setText('Custom hours');
  worksheet.getRangeByIndex(1, 7).setText('Hours2');
  worksheet.getRangeByIndex(1, 8).setText('Job cost');
  worksheet.getRangeByIndex(1, 9).setText('Material');
  worksheet.getRangeByIndex(1, 10).setText('Material cost');
  worksheet.getRangeByIndex(1, 11).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfCustomHours.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterial.toString());
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 11).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].text);
      worksheet.getRangeByIndex(i + 2, 4).setText(materialQuantityList[i].text);
      worksheet.getRangeByIndex(i + 2, 5).setText(laborHours1List[i].text);
      sumOfHours1 += double.parse(laborHours1List[i].text);
      worksheet.getRangeByIndex(i + 2, 6).setText(customColumnList[i].text);
      sumOfCustomHours += double.parse(customColumnList[i].text);
      worksheet.getRangeByIndex(i + 2, 7).setText(laborHours2List[i].text);
      sumOfHours2 += double.parse(laborHours2List[i].text);
      worksheet.getRangeByIndex(i + 2, 8).setText(laborCostList[i].text);
      sumOfJobCost += double.parse(laborCostList[i].text);
      worksheet.getRangeByIndex(i + 2, 9).setText(material1List[i].text);
      sumOfMaterial += double.parse(material1List[i].text);
      worksheet.getRangeByIndex(i + 2, 10).setText(material2List[i].text);
      sumOfMaterialCost += double.parse(material2List[i].text);
      worksheet.getRangeByIndex(i + 2, 11).setText(totalPriceList[i].text);
      sumOfTotalPrice += double.parse(totalPriceList[i].text);
    }
  }
  range.cellStyle.wrapText = false;
  range.autoFit();

  range1.cellStyle.wrapText = false;
  range1.autoFit();

  norwParquetAndLaminateWorkbook.worksheets.addWithSheet(worksheet);
}

void addDataNorwWindowsExteriorDoor(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfCustomHours = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:K1');
  Range range1 = worksheet.getRangeByName('A1:A14');

  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Material quantity');
  worksheet.getRangeByIndex(1, 5).setText('Hours');
  worksheet.getRangeByIndex(1, 6).setText('Custom hours');
  worksheet.getRangeByIndex(1, 7).setText('Hours2');
  worksheet.getRangeByIndex(1, 8).setText('Job cost');
  worksheet.getRangeByIndex(1, 9).setText('Material');
  worksheet.getRangeByIndex(1, 10).setText('Material cost');
  worksheet.getRangeByIndex(1, 11).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfCustomHours.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterial.toString());
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 11).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].text);
      worksheet.getRangeByIndex(i + 2, 4).setText(materialQuantityList[i].text);
      worksheet.getRangeByIndex(i + 2, 5).setText(laborHours1List[i].text);
      sumOfHours1 += double.parse(laborHours1List[i].text);
      worksheet.getRangeByIndex(i + 2, 6).setText(customColumnList[i].text);
      sumOfCustomHours += double.parse(customColumnList[i].text);
      worksheet.getRangeByIndex(i + 2, 7).setText(laborHours2List[i].text);
      sumOfHours2 += double.parse(laborHours2List[i].text);
      worksheet.getRangeByIndex(i + 2, 8).setText(laborCostList[i].text);
      sumOfJobCost += double.parse(laborCostList[i].text);
      worksheet.getRangeByIndex(i + 2, 9).setText(material1List[i].text);
      sumOfMaterial += double.parse(material1List[i].text);
      worksheet.getRangeByIndex(i + 2, 10).setText(material2List[i].text);
      sumOfMaterialCost += double.parse(material2List[i].text);
      worksheet.getRangeByIndex(i + 2, 11).setText(totalPriceList[i].text);
      sumOfTotalPrice += double.parse(totalPriceList[i].text);
    }
  }
  range.cellStyle.wrapText = false;
  range.autoFit();

  range1.cellStyle.wrapText = false;
  range1.autoFit();

  norwWindowsExteriorDoorsWorkbook.worksheets.addWithSheet(worksheet);
}

Future<void> generateNorwWindowsExteriorDoorExcelDocument(
  String excelName,
  List<DataColumn> columns,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  String tabletName,
) async {
  final Worksheet worksheet = norwWindowsExteriorDoorsWorkbook.worksheets[0];
  final Worksheet worksheet2 = new Worksheet(norwWindowsExteriorDoorsWorkbook);
  addDataNorwWindowsExteriorDoor(
    switch (tabletName) {
      "Vindu, trevegg toppsving 12x10" => worksheet,
      "Ytterdør av tre, i bindingsverksvegg, hvit, 10x21" => worksheet2,
      _ => worksheet,
    },
    descriptionList,
    unitList,
    quantityLists,
    materialQuantityList,
    laborHours1List,
    customColumnList,
    laborHours2List,
    laborCostList,
    material1List,
    material2List,
    totalPriceList,
  );

  final List<int> bytes = exteriorWallWorkbook.saveAsStream();

  String? downloadPath = await getDownloadPath();
  String filePath = '$downloadPath/' + excelName + '.xlsx';
  File(filePath).writeAsBytes(bytes);
}

Future<void> generateNorwExteriorWallExcelDocument(
  String excelName,
  List<DataColumn> columns,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  String tabletName,
) async {
  final Worksheet worksheet = norwExteriorWallWorkbook.worksheets[0];

  addDataNorwExteriorWall(
    switch (tabletName) {
      "Bindingsverk av tre 48x198, 50mm påforing, stående dobbelfals, gips" =>
        worksheet,
      _ => worksheet,
    },
    descriptionList,
    unitList,
    quantityLists,
    materialQuantityList,
    laborHours1List,
    customColumnList,
    laborHours2List,
    laborCostList,
    material1List,
    material2List,
    totalPriceList,
  );

  final List<int> bytes = norwExteriorWallWorkbook.saveAsStream();

  String? downloadPath = await getDownloadPath();
  String filePath = '$downloadPath/' + excelName + '.xlsx';
  File(filePath).writeAsBytes(bytes);
}

void addDataNorwInnerDoor(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfCustomHours = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:K1');
  Range range1 = worksheet.getRangeByName('A1:A14');

  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Material quantity');
  worksheet.getRangeByIndex(1, 5).setText('Hours');
  worksheet.getRangeByIndex(1, 6).setText('Custom hours');
  worksheet.getRangeByIndex(1, 7).setText('Hours2');
  worksheet.getRangeByIndex(1, 8).setText('Job cost');
  worksheet.getRangeByIndex(1, 9).setText('Material');
  worksheet.getRangeByIndex(1, 10).setText('Material cost');
  worksheet.getRangeByIndex(1, 11).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfCustomHours.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterial.toString());
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 11).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].text);
      worksheet.getRangeByIndex(i + 2, 4).setText(materialQuantityList[i].text);
      worksheet.getRangeByIndex(i + 2, 5).setText(laborHours1List[i].text);
      sumOfHours1 += double.parse(laborHours1List[i].text);
      worksheet.getRangeByIndex(i + 2, 6).setText(customColumnList[i].text);
      sumOfCustomHours += double.parse(customColumnList[i].text);
      worksheet.getRangeByIndex(i + 2, 7).setText(laborHours2List[i].text);
      sumOfHours2 += double.parse(laborHours2List[i].text);
      worksheet.getRangeByIndex(i + 2, 8).setText(laborCostList[i].text);
      sumOfJobCost += double.parse(laborCostList[i].text);
      worksheet.getRangeByIndex(i + 2, 9).setText(material1List[i].text);
      sumOfMaterial += double.parse(material1List[i].text);
      worksheet.getRangeByIndex(i + 2, 10).setText(material2List[i].text);
      sumOfMaterialCost += double.parse(material2List[i].text);
      worksheet.getRangeByIndex(i + 2, 11).setText(totalPriceList[i].text);
      sumOfTotalPrice += double.parse(totalPriceList[i].text);
    }
  }
  range.cellStyle.wrapText = false;
  range.autoFit();

  range1.cellStyle.wrapText = false;
  range1.autoFit();

  norwInnerDoorWorkbook.worksheets.addWithSheet(worksheet);
}

Future<void> generateNorwInnerDoorExcelDocument(
  String excelName,
  List<DataColumn> columns,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  String tabletName,
) async {
  final Worksheet worksheet = norwInnerDoorWorkbook.worksheets[0];

  addDataNorwInnerDoor(
    switch (tabletName) {
      "Innerdør, furu 9x21" => worksheet,
      _ => worksheet,
    },
    descriptionList,
    unitList,
    quantityLists,
    materialQuantityList,
    laborHours1List,
    customColumnList,
    laborHours2List,
    laborCostList,
    material1List,
    material2List,
    totalPriceList,
  );

  final List<int> bytes = norwInnerDoorWorkbook.saveAsStream();

  String? downloadPath = await getDownloadPath();
  String filePath = '$downloadPath/' + excelName + '.xlsx';
  File(filePath).writeAsBytes(bytes);
}

Future<void> generateInnerDoorExcelDocument(
  String excelName,
  List<DataColumn> columns,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  String tabletName,
) async {
  Worksheet worksheet = innerDoorWorkbook.worksheets[0];

  addDataInnerDoor(
    switch (tabletName) {
      "Interior door, pine 9x21" => worksheet,
      _ => worksheet,
    },
    descriptionList,
    unitList,
    quantityLists,
    materialQuantityList,
    laborHours1List,
    customColumnList,
    laborHours2List,
    laborCostList,
    material1List,
    material2List,
    totalPriceList,
  );

  List<int> bytes = innerDoorWorkbook.saveAsStream();

  String? downloadPath = await getDownloadPath();
  String filePath = '$downloadPath/' + excelName + '.xlsx';
  File(filePath).writeAsBytes(bytes);
}

Future<void> generateKitchenExcelDocument(
  String excelName,
  List<DataColumn> columns,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  String tabletName,
) async {
  final Worksheet worksheet = kitchenWorkbook.worksheets[0];

  addDataKitchen(
    switch (tabletName) {
      "Interior design in housing, kitchen cabinets" => worksheet,
      _ => worksheet,
    },
    descriptionList,
    unitList,
    quantityLists,
    materialQuantityList,
    laborHours1List,
    customColumnList,
    laborHours2List,
    laborCostList,
    material1List,
    material2List,
    totalPriceList,
  );

  final List<int> bytes = kitchenWorkbook.saveAsStream();

  String? downloadPath = await getDownloadPath();
  String filePath = '$downloadPath/' + excelName + '.xlsx';
  File(filePath).writeAsBytes(bytes);
}

Future<void> generateOuterWallExcelDocument(
  String excelName,
  List<DataColumn> columns,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  String tabletName,
) async {
  final Worksheet worksheet = outerWallWorkbook.worksheets[0];

  addDataExteriorWall(
    switch (tabletName) {
      "Timber truss 48x198, 50mm liner, standing double seam, plaster" =>
        worksheet,
      _ => worksheet,
    },
    descriptionList,
    unitList,
    quantityLists,
    materialQuantityList,
    laborHours1List,
    customColumnList,
    laborHours2List,
    laborCostList,
    material1List,
    material2List,
    totalPriceList,
  );

  final List<int> bytes = outerWallWorkbook.saveAsStream();

  String? downloadPath = await getDownloadPath();
  String filePath = '$downloadPath/' + excelName + '.xlsx';
  File(filePath).writeAsBytes(bytes);
}

Future<void> generateParquetLaminateExcelDocument(
  String excelName,
  List<DataColumn> columns,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  String tabletName,
) async {
  final Worksheet worksheet = parquetAndLaminateWorkbook.worksheets[0];

  addDataParquetAndLaminate(
    switch (tabletName) {
      "Surface covering parquet" => worksheet,
      _ => worksheet,
    },
    descriptionList,
    unitList,
    quantityLists,
    materialQuantityList,
    laborHours1List,
    customColumnList,
    laborHours2List,
    laborCostList,
    material1List,
    material2List,
    totalPriceList,
  );

  final List<int> bytes = parquetAndLaminateWorkbook.saveAsStream();

  String? downloadPath = await getDownloadPath();
  String filePath = '$downloadPath/' + excelName + '.xlsx';
  File(filePath).writeAsBytes(bytes);
}

Future<void> generateWindowsOuterDoorExcelDocument(
  String excelName,
  List<DataColumn> columns,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  String tabletName,
) async {
  final Worksheet worksheet = windowsExteriorDoorsWorkbook.worksheets[0];
  final Worksheet worksheet2 = new Worksheet(windowsExteriorDoorsWorkbook);
  addDataWindowsExteriorDoors(
    switch (tabletName) {
      "Window, wooden wall top swing 12x10" => worksheet,
      "Exterior door of wood, in timber frame wall, white, 10x21" => worksheet2,
      _ => worksheet,
    },
    descriptionList,
    unitList,
    quantityLists,
    materialQuantityList,
    laborHours1List,
    customColumnList,
    laborHours2List,
    laborCostList,
    material1List,
    material2List,
    totalPriceList,
  );

  final List<int> bytes = windowsExteriorDoorsWorkbook.saveAsStream();

  String? downloadPath = await getDownloadPath();
  String filePath = '$downloadPath/' + excelName + '.xlsx';
  File(filePath).writeAsBytes(bytes);
}

void addNorwData(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  Workbook workbook,
) {
  double sumOfHours1 = 0;
  double sumOfCustomHours = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;

  final Range range = worksheet.getRangeByName('A1:K1');
  final Range range1 = worksheet.getRangeByName('A1:A14');
  worksheet.getRangeByIndex(1, 1).setText('Beskrivelse');
  worksheet.getRangeByIndex(1, 2).setText('Enhet');
  worksheet.getRangeByIndex(1, 3).setText('Mengde');
  worksheet.getRangeByIndex(1, 4).setText('Mengde av material');
  worksheet.getRangeByIndex(1, 5).setText('Enh. tid.');
  worksheet.getRangeByIndex(1, 6).setText('Enh. tid.');
  worksheet.getRangeByIndex(1, 7).setText('Sum. tid.');
  worksheet.getRangeByIndex(1, 8).setText('Arb.pris');
  worksheet.getRangeByIndex(1, 9).setText('Enh. mater.');
  worksheet.getRangeByIndex(1, 10).setText('Sum. material');
  worksheet.getRangeByIndex(1, 11).setText('Total pris');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfCustomHours.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterial.toString());
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 11).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].text);
      worksheet.getRangeByIndex(i + 2, 4).setText(materialQuantityList[i].text);
      worksheet.getRangeByIndex(i + 2, 5).setText(laborHours1List[i].text);
      sumOfHours1 += double.parse(laborHours1List[i].text);
      worksheet.getRangeByIndex(i + 2, 6).setText(customColumnList[i].text);
      sumOfCustomHours += double.parse(customColumnList[i].text);
      worksheet.getRangeByIndex(i + 2, 7).setText(laborHours2List[i].text);
      sumOfHours2 += double.parse(laborHours2List[i].text);
      worksheet.getRangeByIndex(i + 2, 8).setText(laborCostList[i].text);
      sumOfJobCost += double.parse(laborCostList[i].text);
      worksheet.getRangeByIndex(i + 2, 9).setText(material1List[i].text);
      sumOfMaterial += double.parse(material1List[i].text);
      worksheet.getRangeByIndex(i + 2, 10).setText(material2List[i].text);
      sumOfMaterialCost += double.parse(material2List[i].text);
      worksheet.getRangeByIndex(i + 2, 11).setText(totalPriceList[i].text);
      sumOfTotalPrice += double.parse(totalPriceList[i].text);
    }
  }
  range.cellStyle.wrapText = false;
  range.autoFit();

  range1.cellStyle.wrapText = false;
  range1.autoFit();

  workbook.worksheets.addWithSheet(worksheet);
}

Future<void> generateNorwInnerWallExcelDocument(
  String excelName,
  List<DataColumn> columns,
  List<String> descriptionList,
  List<String> unitList,
  List<TextEditingController> quantityLists,
  List<TextEditingController> materialQuantityList,
  List<TextEditingController> laborHours1List,
  List<TextEditingController> customColumnList,
  List<TextEditingController> laborHours2List,
  List<TextEditingController> laborCostList,
  List<TextEditingController> material1List,
  List<TextEditingController> material2List,
  List<TextEditingController> totalPriceList,
  String tabletName,
) async {
  final Worksheet worksheet = norwInnerWallWorkbook.worksheets[0];
  final Worksheet worksheet2 = new Worksheet(norwInnerWallWorkbook);
  final Worksheet worksheet3 = new Worksheet(norwInnerWallWorkbook);
  final Worksheet worksheet4 = new Worksheet(norwInnerWallWorkbook);
  final Worksheet worksheet5 = new Worksheet(norwInnerWallWorkbook);
  final Worksheet worksheet6 = new Worksheet(norwInnerWallWorkbook);

  addNorwData(
      switch (tabletName) {
        "Bindingsverk av tre 48x98, dobbel lydvegg, dobbel gips" => worksheet,
        "Bindingsverk av tre 48x98, isolert, glattpanel" => worksheet2,
        "Bindingsverk av tre 48x98, kappet h=2400, gips" => worksheet3,
        "Bindingsverk av stål 2x75mm, dobbelt, isolert, gips" => worksheet4,
        "Bindingsverk av stål 2x100mm, dobbelt, isolert, gips" => worksheet5,
        "Bindingsverk av stål 2x75mm, dobbelt, isolert, dobbel gips" =>
          worksheet6,
        _ => worksheet,
      },
      descriptionList,
      unitList,
      quantityLists,
      materialQuantityList,
      laborHours1List,
      customColumnList,
      laborHours2List,
      laborCostList,
      material1List,
      material2List,
      totalPriceList,
      norwInnerWallWorkbook);

  final List<int> bytes = norwInnerWallWorkbook.saveAsStream();
  File("norw" + excelName + ".xlsx").writeAsBytes(bytes);
}
