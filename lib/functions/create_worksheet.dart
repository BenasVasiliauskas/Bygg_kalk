import 'dart:developer';
import 'dart:io';
import 'package:cost_calculator/constants/innerwall_constants.dart';
import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/models/outer_wall_data_model.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';

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

void createExcelFile() async {
  OuterWallModel outerWallModel = exteriorWallData[0];
  var dlPath = await getDownloadPath();

  Workbook workbook = Workbook();
  Worksheet worksheet = workbook.worksheets[0];
  worksheet.getRangeByName("A1").columnWidth = 40;
  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Hours');
  worksheet.getRangeByName("E1").columnWidth = 10;
  worksheet.getRangeByIndex(1, 5).setText('Total hours');
  worksheet.getRangeByIndex(1, 6).setText('Job cost');
  worksheet.getRangeByIndex(1, 7).setText('Material');
  worksheet.getRangeByName("H1").columnWidth = 15;
  worksheet.getRangeByIndex(1, 8).setText('Material cost');
  worksheet.getRangeByIndex(1, 9).setText('Total price');

  worksheet.getRangeByIndex(2, 1).setText(outerWallModel.name);
  for (int i = 0; i < outerWallModel.description.length; i++) {
    worksheet.getRangeByIndex(i + 3, 1).setText(outerWallModel.description[i]);
    worksheet.getRangeByIndex(i + 3, 2).setText(outerWallModel.unit[i]);
    worksheet
        .getRangeByIndex(i + 3, 3)
        .setText(outerWallModel.quantity[i].toString());
    worksheet
        .getRangeByIndex(i + 3, 4)
        .setText(outerWallModel.laborHours1[i].toString());
    worksheet
        .getRangeByIndex(i + 3, 5)
        .setText(outerWallModel.laborHours2[i].toString());
    worksheet
        .getRangeByIndex(i + 3, 6)
        .setText(outerWallModel.laborCost[i].toString());
    worksheet
        .getRangeByIndex(i + 3, 7)
        .setText(outerWallModel.material[i].toString());
    worksheet
        .getRangeByIndex(i + 3, 8)
        .setText(outerWallModel.materials[i].toString());
    worksheet
        .getRangeByIndex(i + 3, 9)
        .setText(outerWallModel.totalPrice[i].toString());
  }

  final List<int> bytes = workbook.saveAsStream();
  File(dlPath! + "CreateExcel.xlsx").writeAsBytes(bytes);
  workbook.dispose();
}

void addDataInnerWall(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
  Workbook workbook,
) {
  double sumOfHours1 = 0;
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
  worksheet.getRangeByIndex(1, 6).setText('Total hours');
  worksheet.getRangeByIndex(1, 7).setText('Job cost');
  worksheet.getRangeByIndex(1, 8).setText('Material');
  worksheet.getRangeByIndex(1, 9).setText('Material cost');
  worksheet.getRangeByIndex(1, 10).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfMaterial.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 10).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].toString());

      worksheet
          .getRangeByIndex(i + 2, 5)
          .setText(laborHours1List[i].toString());
      sumOfHours1 += laborHours1List[i];
      worksheet
          .getRangeByIndex(i + 2, 6)
          .setText(laborHours2List[i].toString());
      sumOfHours2 += laborHours2List[i];
      worksheet.getRangeByIndex(i + 2, 7).setText(laborCostList[i].toString());
      sumOfJobCost += laborCostList[i];
      worksheet.getRangeByIndex(i + 2, 8).setText(material1List[i].toString());
      sumOfMaterial += material1List[i];
      worksheet.getRangeByIndex(i + 2, 9).setText(material2List[i].toString());
      sumOfMaterialCost += material2List[i];
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(totalPriceList[i].toString());
      sumOfTotalPrice += totalPriceList[i];
    }
  }

  worksheet.getRangeByName('A1:J1').autoFit();
  worksheet.getRangeByName('A1:A14').autoFit();

  workbook.worksheets.addWithSheet(worksheet);
}

void addDataExteriorWall(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:J1');
  Range range1 = worksheet.getRangeByName('A1:A14');

  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Material quantity');
  worksheet.getRangeByIndex(1, 5).setText('Hours');
  worksheet.getRangeByIndex(1, 6).setText('Total hours');
  worksheet.getRangeByIndex(1, 7).setText('Job cost');
  worksheet.getRangeByIndex(1, 8).setText('Material');
  worksheet.getRangeByIndex(1, 9).setText('Material cost');
  worksheet.getRangeByIndex(1, 10).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfMaterial.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 10).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].toString());
      worksheet
          .getRangeByIndex(i + 2, 5)
          .setText(laborHours1List[i].toString());
      sumOfHours1 += laborHours1List[i];
      worksheet
          .getRangeByIndex(i + 2, 6)
          .setText(laborHours2List[i].toString());
      sumOfHours2 += laborHours2List[i];
      worksheet.getRangeByIndex(i + 2, 7).setText(laborCostList[i].toString());
      sumOfJobCost += laborCostList[i];
      worksheet.getRangeByIndex(i + 2, 8).setText(material1List[i].toString());
      sumOfMaterial += material1List[i];
      worksheet.getRangeByIndex(i + 2, 9).setText(material2List[i].toString());
      sumOfMaterialCost += material2List[i];
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(totalPriceList[i].toString());
      sumOfTotalPrice += totalPriceList[i];
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
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:J1');
  Range range1 = worksheet.getRangeByName('A1:A14');

  worksheet.getRangeByIndex(1, 1).setText('Beskrivelse');
  worksheet.getRangeByIndex(1, 2).setText('Enhet');
  worksheet.getRangeByIndex(1, 3).setText('Antall');
  worksheet.getRangeByIndex(1, 4).setText('Materialmengde');
  worksheet.getRangeByIndex(1, 5).setText('Timer');
  worksheet.getRangeByIndex(1, 6).setText('Sum. tid.');
  worksheet.getRangeByIndex(1, 7).setText('Jobbkostnad');
  worksheet.getRangeByIndex(1, 8).setText('Materiale');
  worksheet.getRangeByIndex(1, 9).setText('Materialkostnad');
  worksheet.getRangeByIndex(1, 10).setText('Totalpris');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total (eks. mva)");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfMaterial.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 10).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].toString());
      worksheet
          .getRangeByIndex(i + 2, 5)
          .setText(laborHours1List[i].toString());
      sumOfHours1 += laborHours1List[i];

      worksheet
          .getRangeByIndex(i + 2, 6)
          .setText(laborHours2List[i].toString());
      sumOfHours2 += laborHours2List[i];
      worksheet.getRangeByIndex(i + 2, 7).setText(laborCostList[i].toString());
      sumOfJobCost += laborCostList[i];
      worksheet.getRangeByIndex(i + 2, 8).setText(material1List[i].toString());
      sumOfMaterial += material1List[i];
      worksheet.getRangeByIndex(i + 2, 9).setText(material2List[i].toString());
      sumOfMaterialCost += material2List[i];
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(totalPriceList[i].toString());
      sumOfTotalPrice += totalPriceList[i];
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
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:I1');
  Range range1 = worksheet.getRangeByName('A1:A10');

  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Hours');
  worksheet.getRangeByIndex(1, 5).setText('Total hours');
  worksheet.getRangeByIndex(1, 6).setText('Job cost');
  worksheet.getRangeByIndex(1, 7).setText('Material');
  worksheet.getRangeByIndex(1, 8).setText('Material cost');
  worksheet.getRangeByIndex(1, 9).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfMaterial.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].toString());
      worksheet
          .getRangeByIndex(i + 2, 4)
          .setText(laborHours1List[i].toString());
      sumOfHours1 += laborHours1List[i];
      worksheet
          .getRangeByIndex(i + 2, 5)
          .setText(laborHours2List[i].toString());
      sumOfHours2 += laborHours2List[i];
      worksheet.getRangeByIndex(i + 2, 6).setText(laborCostList[i].toString());
      sumOfJobCost += laborCostList[i];
      worksheet.getRangeByIndex(i + 2, 7).setText(material1List[i].toString());
      sumOfMaterial += material1List[i];
      worksheet.getRangeByIndex(i + 2, 8).setText(material2List[i].toString());
      sumOfMaterialCost += material2List[i];
      worksheet.getRangeByIndex(i + 2, 9).setText(totalPriceList[i].toString());
      sumOfTotalPrice += totalPriceList[i];
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
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:I1');
  Range range1 = worksheet.getRangeByName('A1:A14');

  worksheet.getRangeByIndex(1, 1).setText('Description');
  worksheet.getRangeByIndex(1, 2).setText('Unit');
  worksheet.getRangeByIndex(1, 3).setText('Quantity');
  worksheet.getRangeByIndex(1, 4).setText('Hours');
  worksheet.getRangeByIndex(1, 5).setText('Hours2');
  worksheet.getRangeByIndex(1, 6).setText('Job cost');
  worksheet.getRangeByIndex(1, 7).setText('Material');
  worksheet.getRangeByIndex(1, 8).setText('Material cost');
  worksheet.getRangeByIndex(1, 9).setText('Total price');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfMaterial.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].toString());
      worksheet
          .getRangeByIndex(i + 2, 4)
          .setText(laborHours1List[i].toString());
      sumOfHours1 += laborHours1List[i];
      worksheet
          .getRangeByIndex(i + 2, 5)
          .setText(laborHours2List[i].toString());
      sumOfHours2 += laborHours2List[i];
      worksheet.getRangeByIndex(i + 2, 6).setText(laborCostList[i].toString());
      sumOfJobCost += laborCostList[i];
      worksheet.getRangeByIndex(i + 2, 7).setText(material1List[i].toString());
      sumOfMaterial += material1List[i];
      worksheet.getRangeByIndex(i + 2, 8).setText(material2List[i].toString());
      sumOfMaterialCost += material2List[i];
      worksheet.getRangeByIndex(i + 2, 9).setText(totalPriceList[i].toString());
      sumOfTotalPrice += totalPriceList[i];
    }
  }
  range.cellStyle.wrapText = false;
  range.autoFit();

  range1.cellStyle.wrapText = false;
  range1.autoFit();

  windowsExteriorDoorsWorkbook.worksheets.addWithSheet(worksheet);
}

Future<void> generateInnerWallExcelDocument(
  String excelName,
  List<String> descriptionList,
  List<String> unitList,
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
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
    laborHours1List,
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
  List<String> descriptionList,
  List<String> unitList,
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> customColumnList,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
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
    laborHours1List,
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

void addDataNorwWindowsExteriorDoor(
  Worksheet worksheet,
  List<String> descriptionList,
  List<String> unitList,
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:I1');
  Range range1 = worksheet.getRangeByName('A1:A14');

  worksheet.getRangeByIndex(1, 1).setText('Beskrivelse');
  worksheet.getRangeByIndex(1, 2).setText('Enhet');
  worksheet.getRangeByIndex(1, 3).setText('Antall');
  worksheet.getRangeByIndex(1, 4).setText('Timer');
  worksheet.getRangeByIndex(1, 5).setText('Sum. tid.');
  worksheet.getRangeByIndex(1, 6).setText('Jobbkostnad');
  worksheet.getRangeByIndex(1, 7).setText('Materiale');
  worksheet.getRangeByIndex(1, 8).setText('Materialkostnad');
  worksheet.getRangeByIndex(1, 9).setText('Totalpris');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfMaterial.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].toString());
      worksheet
          .getRangeByIndex(i + 2, 4)
          .setText(laborHours1List[i].toString());
      sumOfHours1 += laborHours1List[i];
      worksheet
          .getRangeByIndex(i + 2, 5)
          .setText(laborHours2List[i].toString());
      sumOfHours2 += laborHours2List[i];
      worksheet.getRangeByIndex(i + 2, 6).setText(laborCostList[i].toString());
      sumOfJobCost += laborCostList[i];
      worksheet.getRangeByIndex(i + 2, 7).setText(material1List[i].toString());
      sumOfMaterial += material1List[i];
      worksheet.getRangeByIndex(i + 2, 8).setText(material2List[i].toString());
      sumOfMaterialCost += material2List[i];
      worksheet.getRangeByIndex(i + 2, 9).setText(totalPriceList[i].toString());
      sumOfTotalPrice += totalPriceList[i];
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
  List<String> descriptionList,
  List<String> unitList,
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
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
    laborHours1List,
    laborHours2List,
    laborCostList,
    material1List,
    material2List,
    totalPriceList,
  );

  final List<int> bytes = norwWindowsExteriorDoorsWorkbook.saveAsStream();

  String? downloadPath = await getDownloadPath();
  String filePath = '$downloadPath/' + excelName + '.xlsx';
  File(filePath).writeAsBytes(bytes);
}

Future<void> generateNorwExteriorWallExcelDocument(
  String excelName,
  List<String> descriptionList,
  List<String> unitList,
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
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
    laborHours1List,
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
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
) {
  double sumOfHours1 = 0;
  double sumOfHours2 = 0;
  double sumOfJobCost = 0;
  double sumOfMaterial = 0;
  double sumOfMaterialCost = 0;
  double sumOfTotalPrice = 0;
  Range range = worksheet.getRangeByName('A1:I1');
  Range range1 = worksheet.getRangeByName('A1:A10');

  worksheet.getRangeByIndex(1, 1).setText('Beskrivelse');
  worksheet.getRangeByIndex(1, 2).setText('Enhet');
  worksheet.getRangeByIndex(1, 3).setText('Antall');
  worksheet.getRangeByIndex(1, 4).setText('Timer');
  worksheet.getRangeByIndex(1, 5).setText('Sum. tid.');
  worksheet.getRangeByIndex(1, 6).setText('Jobbkostnad');
  worksheet.getRangeByIndex(1, 7).setText('Materiale');
  worksheet.getRangeByIndex(1, 8).setText('Materialkostnad');
  worksheet.getRangeByIndex(1, 9).setText('Totalpris');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfMaterial.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].toString());
      worksheet
          .getRangeByIndex(i + 2, 4)
          .setText(laborHours1List[i].toString());
      sumOfHours1 += laborHours1List[i];
      worksheet
          .getRangeByIndex(i + 2, 5)
          .setText(laborHours2List[i].toString());
      sumOfHours2 += laborHours2List[i];
      worksheet.getRangeByIndex(i + 2, 6).setText(laborCostList[i].toString());
      sumOfJobCost += laborCostList[i];
      worksheet.getRangeByIndex(i + 2, 7).setText(material1List[i].toString());
      sumOfMaterial += material1List[i];
      worksheet.getRangeByIndex(i + 2, 8).setText(material2List[i].toString());
      sumOfMaterialCost += material2List[i];
      worksheet.getRangeByIndex(i + 2, 9).setText(totalPriceList[i].toString());
      sumOfTotalPrice += totalPriceList[i];
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
  List<String> descriptionList,
  List<String> unitList,
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
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
    laborHours1List,
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
  List<String> descriptionList,
  List<String> unitList,
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
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
    laborHours1List,
    laborHours2List,
    laborCostList,
    material1List,
    material2List,
    totalPriceList,
  );

  final List<int> bytes = innerDoorWorkbook.saveAsStream();

  String? downloadPath = await getDownloadPath();
  String filePath = '$downloadPath/' + excelName + '.xlsx';
  File(filePath).writeAsBytes(bytes);
}

Future<void> generateOuterWallExcelDocument(
  String excelName,
  List<String> descriptionList,
  List<String> unitList,
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
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
    laborHours1List,
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

Future<void> generateWindowsOuterDoorExcelDocument(
  String excelName,
  List<String> descriptionList,
  List<String> unitList,
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
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
    laborHours1List,
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
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
  Workbook workbook,
) {
  double sumOfHours1 = 0;
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
  worksheet.getRangeByIndex(1, 6).setText('Sum. tid.');
  worksheet.getRangeByIndex(1, 7).setText('Arb.pris');
  worksheet.getRangeByIndex(1, 8).setText('Enh. mater.');
  worksheet.getRangeByIndex(1, 9).setText('Sum. material');
  worksheet.getRangeByIndex(1, 10).setText('Total pris');

  for (int i = 0; i <= descriptionList.length; i++) {
    if (i == descriptionList.length) {
      worksheet.getRangeByIndex(i + 2, 1).setText("Total sum");
      worksheet.getRangeByIndex(i + 2, 2).setText("");
      worksheet.getRangeByIndex(i + 2, 3).setText("");
      worksheet.getRangeByIndex(i + 2, 4).setText("");
      worksheet.getRangeByIndex(i + 2, 5).setText(sumOfHours1.toString());
      worksheet.getRangeByIndex(i + 2, 6).setText(sumOfHours2.toString());
      worksheet.getRangeByIndex(i + 2, 7).setText(sumOfJobCost.toString());
      worksheet.getRangeByIndex(i + 2, 8).setText(sumOfMaterial.toString());
      worksheet.getRangeByIndex(i + 2, 9).setText(sumOfMaterialCost.toString());
      worksheet.getRangeByIndex(i + 2, 10).setText(sumOfTotalPrice.toString());
    } else {
      worksheet.getRangeByIndex(i + 2, 1).setText(descriptionList[i]);
      worksheet.getRangeByIndex(i + 2, 2).setText(unitList[i]);
      worksheet.getRangeByIndex(i + 2, 3).setText(quantityLists[i].toString());

      worksheet
          .getRangeByIndex(i + 2, 5)
          .setText(laborHours1List[i].toString());
      sumOfHours1 += laborHours1List[i];
      worksheet
          .getRangeByIndex(i + 2, 6)
          .setText(laborHours2List[i].toString());
      sumOfHours2 += laborHours2List[i];
      worksheet.getRangeByIndex(i + 2, 7).setText(laborCostList[i].toString());
      sumOfJobCost += laborCostList[i];
      worksheet.getRangeByIndex(i + 2, 8).setText(material1List[i].toString());
      sumOfMaterial += material1List[i];
      worksheet.getRangeByIndex(i + 2, 9).setText(material2List[i].toString());
      sumOfMaterialCost += material2List[i];
      worksheet
          .getRangeByIndex(i + 2, 10)
          .setText(totalPriceList[i].toString());
      sumOfTotalPrice += totalPriceList[i];
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
  List<String> descriptionList,
  List<String> unitList,
  List<double> quantityLists,
  List<double> laborHours1List,
  List<double> laborHours2List,
  List<double> laborCostList,
  List<double> material1List,
  List<double> material2List,
  List<double> totalPriceList,
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
      laborHours1List,
      laborHours2List,
      laborCostList,
      material1List,
      material2List,
      totalPriceList,
      norwInnerWallWorkbook);

  final List<int> bytes = norwInnerWallWorkbook.saveAsStream();
  File(excelName + ".xlsx").writeAsBytes(bytes);
}
