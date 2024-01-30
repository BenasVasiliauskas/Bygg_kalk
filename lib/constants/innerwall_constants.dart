import 'package:syncfusion_flutter_xlsio/xlsio.dart';

double calculationQuantity = 1;
double hourlyRateConstructionRemodeling = 550;
double hourlyRateDemolition = 550;
double hourlyRatePainting = 500;

List<double> createList(int size) {
  List<double> customList = [];
  for (int i = 0; i < size; i++) {
    customList.add(0);
  }
  return customList;
}

bool customColumn = false;

Workbook innerWallWorkbook = new Workbook();
Workbook norwInnerWallWorkbook = new Workbook();

Workbook exteriorWallWorkbook = new Workbook();
Workbook norwExteriorWallWorkbook = new Workbook();

Workbook innerDoorWorkbook = new Workbook();
Workbook norwInnerDoorWorkbook = new Workbook();

Workbook kitchenWorkbook = new Workbook();
Workbook norwKitchenWorkbook = new Workbook();

Workbook outerWallWorkbook = new Workbook();
Workbook norwOuterWallWorkbook = new Workbook();

Workbook parquetAndLaminateWorkbook = new Workbook();
Workbook norwParquetAndLaminateWorkbook = new Workbook();

Workbook windowsExteriorDoorsWorkbook = new Workbook();
Workbook norwWindowsExteriorDoorsWorkbook = new Workbook();
