import 'package:cost_calculator/data/english_data_folder/data.dart';
import 'package:cost_calculator/models/waste_data_model.dart';

List<String> calculatedNamesOrder = [
  "Load-bearing structures",
  "Exterior walls",
  "Windows doors",
  "Interior walls",
  "Interior door",
  "Floor structure",
  "Flooring",
  "Roof",
  "Terrace/Railings",
  "Indoor stairs",
  "Holes",
  "Scaffolding",
  "Waste",
  "Totals"
];

List<double> totalHours = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
];

List<double> totalLaborCosts = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
];

List<double> totalMaterialCosts = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
];

List<double> budgetSums = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
];

Map<String, double> innerWallHours = {
  for (var i = 0; i < dataInnerWallData.length; i++)
    dataInnerWallData[i].name: 0,
};

Map<String, double> innerWallLaborCosts = {
  for (var i = 0; i < dataInnerWallData.length; i++)
    dataInnerWallData[i].name: 0,
};

Map<String, double> innerWallMaterialCosts = {
  for (var i = 0; i < dataInnerWallData.length; i++)
    dataInnerWallData[i].name: 0,
};

Map<String, double> innerWallBudgetSum = {
  for (var i = 0; i < dataInnerWallData.length; i++)
    dataInnerWallData[i].name: 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> outerWallHours = {
  for (var i = 0; i < exteriorWallData.length; i++) exteriorWallData[i].name: 0,
};

Map<String, double> outerWallLaborCosts = {
  for (var i = 0; i < exteriorWallData.length; i++) exteriorWallData[i].name: 0,
};

Map<String, double> outerWallMaterialCosts = {
  for (var i = 0; i < exteriorWallData.length; i++) exteriorWallData[i].name: 0,
};

Map<String, double> outerWallBudgetSum = {
  for (var i = 0; i < exteriorWallData.length; i++) exteriorWallData[i].name: 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> innerDoorHours = {
  for (var i = 0; i < innerDoor.length; i++) innerDoor[i].name: 0,
};
Map<String, double> innerDoorLaborCosts = {
  for (var i = 0; i < innerDoor.length; i++) innerDoor[i].name: 0,
};
Map<String, double> innerDoorMaterialCosts = {
  for (var i = 0; i < innerDoor.length; i++) innerDoor[i].name: 0,
};
Map<String, double> innerDoorBudgetSum = {
  for (var i = 0; i < innerDoor.length; i++) innerDoor[i].name: 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> windowsAndExteriorDoorHours = {
  for (var i = 0; i < windowsExteriorDoors.length; i++)
    windowsExteriorDoors[i].name: 0,
};
Map<String, double> windowsAndExteriorDoorLaborCosts = {
  for (var i = 0; i < windowsExteriorDoors.length; i++)
    windowsExteriorDoors[i].name: 0,
};
Map<String, double> windowsAndExteriorDoorMaterialCosts = {
  for (var i = 0; i < windowsExteriorDoors.length; i++)
    windowsExteriorDoors[i].name: 0,
};
Map<String, double> windowsAndExteriorDoorBudgetSum = {
  for (var i = 0; i < windowsExteriorDoors.length; i++)
    windowsExteriorDoors[i].name: 0,
};
/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> deckHours = {
  for (var i = 0; i < deckData.length; i++) deckData[i].name: 0,
};

Map<String, double> deckLaborCosts = {
  for (var i = 0; i < deckData.length; i++) deckData[i].name: 0,
};

Map<String, double> deckMaterialCosts = {
  for (var i = 0; i < deckData.length; i++) deckData[i].name: 0,
};

Map<String, double> deckBudgetSum = {
  for (var i = 0; i < deckData.length; i++) deckData[i].name: 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> flooringHours = {
  for (var i = 0; i < flooringData.length; i++) flooringData[i].name: 0,
};

Map<String, double> flooringLaborCosts = {
  for (var i = 0; i < flooringData.length; i++) flooringData[i].name: 0,
};

Map<String, double> flooringMaterialCosts = {
  for (var i = 0; i < flooringData.length; i++) flooringData[i].name: 0,
};

Map<String, double> flooringBudgetSum = {
  for (var i = 0; i < flooringData.length; i++) flooringData[i].name: 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> roofHours = {
  for (var i = 0; i < outerRoofData.length; i++) outerRoofData[i].name: 0,
};

Map<String, double> roofLaborCosts = {
  for (var i = 0; i < outerRoofData.length; i++) outerRoofData[i].name: 0,
};

Map<String, double> roofMaterialCosts = {
  for (var i = 0; i < outerRoofData.length; i++) outerRoofData[i].name: 0,
};

Map<String, double> roofBudgetSum = {
  for (var i = 0; i < outerRoofData.length; i++) outerRoofData[i].name: 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> terraceHours = {
  for (var i = 0; i < terraceData.length; i++) terraceData[i].name: 0,
};

Map<String, double> terraceLaborCosts = {
  for (var i = 0; i < terraceData.length; i++) terraceData[i].name: 0,
};

Map<String, double> terraceMaterialCosts = {
  for (var i = 0; i < terraceData.length; i++) terraceData[i].name: 0,
};

Map<String, double> terraceBudgetSum = {
  for (var i = 0; i < terraceData.length; i++) terraceData[i].name: 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> innerStairsHours = {
  for (var i = 0; i < innerStairsData.length; i++) innerStairsData[i].name: 0,
};

Map<String, double> innerStairsLaborCosts = {
  for (var i = 0; i < innerStairsData.length; i++) innerStairsData[i].name: 0,
};

Map<String, double> innerStairsMaterialCosts = {
  for (var i = 0; i < innerStairsData.length; i++) innerStairsData[i].name: 0,
};

Map<String, double> innerStairsBudgetSum = {
  for (var i = 0; i < innerStairsData.length; i++) innerStairsData[i].name: 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> hullRoofingHours = {
  for (var i = 0; i < hullRoofingData.length; i++) hullRoofingData[i].name: 0,
};

Map<String, double> hullRoofingLaborCosts = {
  for (var i = 0; i < hullRoofingData.length; i++) hullRoofingData[i].name: 0,
};

Map<String, double> hullRoofingMaterialCosts = {
  for (var i = 0; i < hullRoofingData.length; i++) hullRoofingData[i].name: 0,
};

Map<String, double> hullRoofingBudgetSum = {
  for (var i = 0; i < hullRoofingData.length; i++) hullRoofingData[i].name: 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> scaffoldingHours = {
  for (var i = 0; i < scaffoldingData.length; i++) scaffoldingData[i].name: 0,
};

Map<String, double> scaffoldingLaborCosts = {
  for (var i = 0; i < scaffoldingData.length; i++) scaffoldingData[i].name: 0,
};

Map<String, double> scaffoldingMaterialCosts = {
  for (var i = 0; i < scaffoldingData.length; i++) scaffoldingData[i].name: 0,
};

Map<String, double> scaffoldingBudgetSum = {
  for (var i = 0; i < scaffoldingData.length; i++) scaffoldingData[i].name: 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> wasteHours = {
  for (var i = 0; i < wasteData.length; i++) wasteData[i].name: 0,
};

Map<String, double> wasteLaborCosts = {
  for (var i = 0; i < wasteData.length; i++) wasteData[i].name: 0,
};

Map<String, double> wasteMaterialCosts = {
  for (var i = 0; i < wasteData.length; i++) wasteData[i].name: 0,
};

Map<String, double> wasteBudgetSum = {
  for (var i = 0; i < wasteData.length; i++) wasteData[i].name: 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> supportSystemHours = {
  for (var i = 0; i < supportSystem.length; i++) supportSystem[i].name: 0,
};

Map<String, double> supportSystemLaborCosts = {
  for (var i = 0; i < supportSystem.length; i++) supportSystem[i].name: 0,
};

Map<String, double> supportSystemMaterialCosts = {
  for (var i = 0; i < supportSystem.length; i++) supportSystem[i].name: 0,
};

Map<String, double> supportSystemBudgetSum = {
  for (var i = 0; i < supportSystem.length; i++) supportSystem[i].name: 0,
};
/////////////////////////////////////////////////////////////////////////////////////

void reCalculate() {
  totalHours[0] = supportSystemHours.values.reduce((s, e) => s + e);
  totalLaborCosts[0] = supportSystemLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[0] =
      supportSystemMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[0] = supportSystemBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[1] = outerWallHours.values.reduce((s, e) => s + e);
  totalLaborCosts[1] = outerWallLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[1] = outerWallMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[1] = outerWallBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[2] = windowsAndExteriorDoorHours.values.reduce((s, e) => s + e);
  totalLaborCosts[2] =
      windowsAndExteriorDoorLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[2] =
      windowsAndExteriorDoorMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[2] =
      windowsAndExteriorDoorBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[3] = innerWallHours.values.reduce((s, e) => s + e);
  totalLaborCosts[3] = innerWallLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[3] = innerWallMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[3] = innerWallBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[4] = innerDoorHours.values.reduce((s, e) => s + e);
  totalLaborCosts[4] = innerDoorLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[4] = innerDoorMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[4] = innerDoorBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[5] = deckHours.values.reduce((s, e) => s + e);
  totalLaborCosts[5] = deckLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[5] = deckMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[5] = deckBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[6] = flooringHours.values.reduce((s, e) => s + e);
  totalLaborCosts[6] = flooringLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[6] = flooringMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[6] = flooringBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[7] = roofHours.values.reduce((s, e) => s + e);
  totalLaborCosts[7] = roofLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[7] = roofMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[7] = roofBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[8] = terraceHours.values.reduce((s, e) => s + e);
  totalLaborCosts[8] = terraceLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[8] = terraceMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[8] = terraceBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[9] = innerStairsHours.values.reduce((s, e) => s + e);
  totalLaborCosts[9] = innerStairsLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[9] =
      innerStairsMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[9] = innerStairsBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[10] = hullRoofingHours.values.reduce((s, e) => s + e);
  totalLaborCosts[10] = hullRoofingLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[10] =
      hullRoofingMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[10] = hullRoofingBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[11] = scaffoldingHours.values.reduce((s, e) => s + e);
  totalLaborCosts[11] = scaffoldingLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[11] =
      scaffoldingMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[11] = scaffoldingBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[12] = wasteHours.values.reduce((s, e) => s + e);
  totalLaborCosts[12] = wasteLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[12] = wasteMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[12] = wasteBudgetSum.values.reduce((s, e) => s + e);
  //
}

void addHours(String name, double hours) {
  if (innerWallHours.containsKey(name)) {
    innerWallHours[name] = hours;
  } else if (outerWallHours.containsKey(name)) {
    outerWallHours[name] = hours;
  } else if (innerDoorHours.containsKey(name)) {
    innerDoorHours[name] = hours;
  } else if (windowsAndExteriorDoorHours.containsKey(name)) {
    windowsAndExteriorDoorHours[name] = hours;
  } else if (deckHours.containsKey(name)) {
    deckHours[name] = hours;
  } else if (flooringHours.containsKey(name)) {
    flooringHours[name] = hours;
  } else if (roofHours.containsKey(name)) {
    roofHours[name] = hours;
  } else if (terraceHours.containsKey(name)) {
    terraceHours[name] = hours;
  } else if (innerStairsHours.containsKey(name)) {
    innerStairsHours[name] = hours;
  } else if (hullRoofingHours.containsKey(name)) {
    hullRoofingHours[name] = hours;
  } else if (scaffoldingHours.containsKey(name)) {
    scaffoldingHours[name] = hours;
  } else if (wasteHours.containsKey(name)) {
    wasteHours[name] = hours;
  } else if (supportSystemHours.containsKey(name)) {
    supportSystemHours[name] = hours;
  }
  reCalculate();
}

void addLaborCosts(String name, double laborCosts) {
  if (innerWallLaborCosts.containsKey(name)) {
    innerWallLaborCosts[name] = laborCosts;
  } else if (outerWallLaborCosts.containsKey(name)) {
    outerWallLaborCosts[name] = laborCosts;
  } else if (innerDoorLaborCosts.containsKey(name)) {
    innerDoorLaborCosts[name] = laborCosts;
  } else if (windowsAndExteriorDoorLaborCosts.containsKey(name)) {
    windowsAndExteriorDoorLaborCosts[name] = laborCosts;
  } else if (deckLaborCosts.containsKey(name)) {
    deckLaborCosts[name] = laborCosts;
  } else if (flooringLaborCosts.containsKey(name)) {
    flooringLaborCosts[name] = laborCosts;
  } else if (roofLaborCosts.containsKey(name)) {
    roofLaborCosts[name] = laborCosts;
  } else if (terraceLaborCosts.containsKey(name)) {
    terraceLaborCosts[name] = laborCosts;
  } else if (innerStairsLaborCosts.containsKey(name)) {
    innerStairsLaborCosts[name] = laborCosts;
  } else if (hullRoofingLaborCosts.containsKey(name)) {
    hullRoofingLaborCosts[name] = laborCosts;
  } else if (scaffoldingLaborCosts.containsKey(name)) {
    scaffoldingLaborCosts[name] = laborCosts;
  } else if (wasteLaborCosts.containsKey(name)) {
    wasteLaborCosts[name] = laborCosts;
  } else if (supportSystemLaborCosts.containsKey(name)) {
    supportSystemLaborCosts[name] = laborCosts;
  }
  reCalculate();
}

void addMaterialCosts(String name, double materialCosts) {
  if (innerWallMaterialCosts.containsKey(name)) {
    innerWallMaterialCosts[name] = materialCosts;
  } else if (outerWallMaterialCosts.containsKey(name)) {
    outerWallMaterialCosts[name] = materialCosts;
  } else if (innerDoorMaterialCosts.containsKey(name)) {
    innerDoorMaterialCosts[name] = materialCosts;
  } else if (windowsAndExteriorDoorMaterialCosts.containsKey(name)) {
    windowsAndExteriorDoorMaterialCosts[name] = materialCosts;
  } else if (deckMaterialCosts.containsKey(name)) {
    deckMaterialCosts[name] = materialCosts;
  } else if (flooringMaterialCosts.containsKey(name)) {
    flooringMaterialCosts[name] = materialCosts;
  } else if (roofMaterialCosts.containsKey(name)) {
    roofMaterialCosts[name] = materialCosts;
  } else if (terraceMaterialCosts.containsKey(name)) {
    terraceMaterialCosts[name] = materialCosts;
  } else if (innerStairsMaterialCosts.containsKey(name)) {
    innerStairsMaterialCosts[name] = materialCosts;
  } else if (hullRoofingMaterialCosts.containsKey(name)) {
    hullRoofingMaterialCosts[name] = materialCosts;
  } else if (scaffoldingMaterialCosts.containsKey(name)) {
    scaffoldingMaterialCosts[name] = materialCosts;
  } else if (wasteMaterialCosts.containsKey(name)) {
    wasteMaterialCosts[name] = materialCosts;
  } else if (supportSystemMaterialCosts.containsKey(name)) {
    supportSystemMaterialCosts[name] = materialCosts;
  }
  reCalculate();
}

void addBudgetSum(String name, double budgetSum) {
  if (innerWallBudgetSum.containsKey(name)) {
    innerWallBudgetSum[name] = budgetSum;
  } else if (outerWallBudgetSum.containsKey(name)) {
    outerWallBudgetSum[name] = budgetSum;
  } else if (innerDoorBudgetSum.containsKey(name)) {
    innerDoorBudgetSum[name] = budgetSum;
  } else if (windowsAndExteriorDoorBudgetSum.containsKey(name)) {
    windowsAndExteriorDoorBudgetSum[name] = budgetSum;
  } else if (deckBudgetSum.containsKey(name)) {
    deckBudgetSum[name] = budgetSum;
  } else if (flooringBudgetSum.containsKey(name)) {
    flooringBudgetSum[name] = budgetSum;
  } else if (roofBudgetSum.containsKey(name)) {
    roofBudgetSum[name] = budgetSum;
  } else if (terraceBudgetSum.containsKey(name)) {
    terraceBudgetSum[name] = budgetSum;
  } else if (innerStairsBudgetSum.containsKey(name)) {
    innerStairsBudgetSum[name] = budgetSum;
  } else if (hullRoofingBudgetSum.containsKey(name)) {
    hullRoofingBudgetSum[name] = budgetSum;
  } else if (scaffoldingBudgetSum.containsKey(name)) {
    scaffoldingBudgetSum[name] = budgetSum;
  } else if (wasteBudgetSum.containsKey(name)) {
    wasteBudgetSum[name] = budgetSum;
  } else if (supportSystemBudgetSum.containsKey(name)) {
    supportSystemBudgetSum[name] = budgetSum;
  }
  reCalculate();
}

double calculateTotalWaste(List<WasteModel> wasteList) {
  double totalSum = 0.0;

  for (var wasteModel in wasteList) {
    totalSum +=
        wasteModel.totalPrice.fold(0.0, (prev, element) => prev + element);
  }

  return totalSum;
}
