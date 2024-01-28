import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/innerwall_constants.dart';

void createTextFile() {
  final Directory directory = Directory.current;
  final File file = File('${directory.path}/my_file.txt');
  file.writeAsString('Hello Folks');
}

void addData(
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
  final Range range = worksheet.getRangeByName('A1:K1');
  final Range range1 = worksheet.getRangeByName('A1:A14');

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

  innerWallWorkbook.worksheets.addWithSheet(worksheet);
}

Future<void> generateExcelDocument(
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
  final Worksheet worksheet = innerWallWorkbook.worksheets[0];
  final Worksheet worksheet2 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet3 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet4 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet5 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet6 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet7 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet8 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet9 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet10 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet11 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet12 = new Worksheet(innerWallWorkbook);
  addData(
      switch (tabletName) {
        "Wooden truss 48x98, double sound wall, double plaster" => worksheet,
        "Wooden trusses 48x98, insulated, smooth panel" => worksheet2,
        "Wooden truss 48x98, precut h=2400, plaster" => worksheet3,
        "Steel trusses 2x75mm, double, insulated, plaster" => worksheet4,
        "Steel trusses 2x100mm, double, insulated, plaster" => worksheet5,
        "Steel trusses 2x75mm, double, insulated, double plaster" => worksheet6,
        "Interior design in housing, kitchen cabinets" => worksheet7,
        "Interior door, pine 9x21" => worksheet8,
        "Surface covering parquet" =>
          worksheet9, // repeats twice maybe do smth?
        "Window, wooden wall top swing 12x10" => worksheet10,
        "Exterior door of wood, in timber frame wall, white, 10x21" =>
          worksheet11,
        "Timber truss 48x198, 50mm liner, standing double seam, plaster" =>
          worksheet12,
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
      totalPriceList);

  final List<int> bytes = innerWallWorkbook.saveAsStream();
  File(excelName + ".xlsx").writeAsBytes(bytes);
  innerWallWorkbook.dispose();
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

  norwInnerWallWorkbook.worksheets.addWithSheet(worksheet);
}

///
Future<void> generateNorwExcelDocument(
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
  final Worksheet worksheet = innerWallWorkbook.worksheets[0];
  final Worksheet worksheet2 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet3 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet4 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet5 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet6 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet7 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet8 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet9 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet10 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet11 = new Worksheet(innerWallWorkbook);
  final Worksheet worksheet12 = new Worksheet(innerWallWorkbook);
  addNorwData(
      switch (tabletName) {
        "Bindingsverk av tre 48x98, dobbel lydvegg, dobbel gips" => worksheet,
        "Bindingsverk av tre 48x98, isolert, glattpanel" => worksheet2,
        "Bindingsverk av tre 48x98, kappet h=2400, gips" => worksheet3,
        "Bindingsverk av stål 2x75mm, dobbelt, isolert, gips" => worksheet4,
        "Bindingsverk av stål 2x100mm, dobbelt, isolert, gips" => worksheet5,
        "Bindingsverk av stål 2x75mm, dobbelt, isolert, dobbel gips" =>
          worksheet6,
        "Innredning i bolig, kjøkken overskap" => worksheet7,
        "Innerdør, furu 9x21" => worksheet8,
        "Overflate dekker parkett" =>
          worksheet9, // repeats twice maybe do smth?
        "Vindu, trevegg toppsving 12x10" => worksheet10,
        "Ytterdør av tre, i bindingsverksvegg, hvit, 10x21" => worksheet11,
        "Bindingsverk av tre 48x198, 50mm påforing, stående dobbelfals, gips" =>
          worksheet12,
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
      totalPriceList);

  final List<int> bytes = norwInnerWallWorkbook.saveAsStream();
  File("norw" + excelName + ".xlsx").writeAsBytes(bytes);
  norwInnerWallWorkbook.dispose();
}
