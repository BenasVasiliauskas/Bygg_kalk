import 'package:syncfusion_flutter_xlsio/xlsio.dart';

List<double> createList(int size) {
  List<double> customList = [];
  for (int i = 0; i < size; i++) {
    customList.add(0);
  }
  return customList;
}

bool innerWallCalled = false;

Workbook norwInnerWallWorkbook = new Workbook();

Workbook innerWallWorkbook = Workbook();
Worksheet innerWallWorksheet1 = innerWallWorkbook.worksheets[0];
Worksheet innerWallWorksheet2 = Worksheet(innerWallWorkbook);
Worksheet innerWallWorksheet3 = Worksheet(innerWallWorkbook);
Worksheet innerWallWorksheet4 = Worksheet(innerWallWorkbook);
Worksheet innerWallWorksheet5 = Worksheet(innerWallWorkbook);
Worksheet innerWallWorksheet6 = Worksheet(innerWallWorkbook);

Workbook exteriorWallWorkbook = new Workbook();
Workbook norwExteriorWallWorkbook = new Workbook();

Workbook innerDoorWorkbook = new Workbook();
Workbook norwInnerDoorWorkbook = new Workbook();

Workbook kitchenWorkbook = new Workbook();
Workbook norwKitchenWorkbook = new Workbook();

Workbook outerWallWorkbook = new Workbook();
Workbook norwOuterWallWorkbook = new Workbook();

Workbook windowsExteriorDoorsWorkbook = new Workbook();
Workbook norwWindowsExteriorDoorsWorkbook = new Workbook();
