List<String> calculatedNamesOrder = [
  'Windows and exterior doors', //1
  'Exterior walls', //2
  'Interior walls', //3
  'Interior door', //4
  "Covers", //4
  "Flooring", //5
  "Exterior roof", //6
  "Terrace/Railings", //7
  "Inner stairs", //8
  "Hull roofing", //9
  "Scaffolding", //10
  "Waste Management", //11
  "Support system", //12
  "Totals" //14
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
  "Wooden truss 47x87, double sound wall, double plaster": 0,
  "Wooden trusses 47x87, insulated, smooth panel": 0,
  "Wooden truss 47x87, precut h=2400, plaster": 0,
  "Steel trusses 2x64mm, double, insulated, plaster": 0,
  "Steel trusses 2x90mm, double, insulated, plaster": 0,
  "Steel trusses 2x64mm, double, insulated, double plaster": 0,
  "Masonry walls, rendered cladding duplex": 0,
  "Demolition of door in inner wall complete": 0,
};

Map<String, double> innerWallLaborCosts = {
  "Wooden truss 47x87, double sound wall, double plaster": 0,
  "Wooden trusses 47x87, insulated, smooth panel": 0,
  "Wooden truss 47x87, precut h=2400, plaster": 0,
  "Steel trusses 2x64mm, double, insulated, plaster": 0,
  "Steel trusses 2x90mm, double, insulated, plaster": 0,
  "Steel trusses 2x64mm, double, insulated, double plaster": 0,
  "Masonry walls, rendered cladding duplex": 0,
  "Demolition of door in inner wall complete": 0,
};

Map<String, double> innerWallMaterialCosts = {
  "Wooden truss 47x87, double sound wall, double plaster": 0,
  "Wooden trusses 47x87, insulated, smooth panel": 0,
  "Wooden truss 47x87, precut h=2400, plaster": 0,
  "Steel trusses 2x64mm, double, insulated, plaster": 0,
  "Steel trusses 2x90mm, double, insulated, plaster": 0,
  "Steel trusses 2x64mm, double, insulated, double plaster": 0,
  "Masonry walls, rendered cladding duplex": 0,
  "Demolition of door in inner wall complete": 0,
};

Map<String, double> innerWallBudgetSum = {
  "Wooden truss 47x87, double sound wall, double plaster": 0,
  "Wooden trusses 47x87, insulated, smooth panel": 0,
  "Wooden truss 47x87, precut h=2400, plaster": 0,
  "Steel trusses 2x64mm, double, insulated, plaster": 0,
  "Steel trusses 2x90mm, double, insulated, plaster": 0,
  "Steel trusses 2x64mm, double, insulated, double plaster": 0,
  "Masonry walls, rendered cladding duplex": 0,
  "Demolition of door in inner wall complete": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> outerWallHours = {
  "Timber truss 47x187, 40mm liner, standing double seam, plaster": 0,
  "Wooden timber frame, post-insulation. new panel": 0,
  "Demolition of door in external wall complete": 0,
};

Map<String, double> outerWallLaborCosts = {
  "Timber truss 47x187, 40mm liner, standing double seam, plaster": 0,
  "Wooden timber frame, post-insulation. new panel": 0,
  "Demolition of door in external wall complete": 0,
};

Map<String, double> outerWallMaterialCosts = {
  "Timber truss 47x187, 40mm liner, standing double seam, plaster": 0,
  "Wooden timber frame, post-insulation. new panel": 0,
  "Demolition of door in external wall complete": 0,
};

Map<String, double> outerWallBudgetSum = {
  "Timber truss 47x187, 40mm liner, standing double seam, plaster": 0,
  "Wooden timber frame, post-insulation. new panel": 0,
  "Demolition of door in external wall complete": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> innerDoorHours = {
  "Interior door, pine 8x21": 0,
};
Map<String, double> innerDoorLaborCosts = {
  "Interior door, pine 8x21": 0,
};
Map<String, double> innerDoorMaterialCosts = {
  "Interior door, pine 8x21": 0,
};
Map<String, double> innerDoorBudgetSum = {
  "Interior door, pine 8x21": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> windowsAndExteriorDoorHours = {
  "Window, wooden wall top swing 11x9": 0,
  "Exterior door of wood, in timber frame wall, white, 9x21": 0,
};
Map<String, double> windowsAndExteriorDoorLaborCosts = {
  "Window, wooden wall top swing 11x9": 0,
  "Exterior door of wood, in timber frame wall, white, 9x21": 0,
};
Map<String, double> windowsAndExteriorDoorMaterialCosts = {
  "Window, wooden wall top swing 11x9": 0,
  "Exterior door of wood, in timber frame wall, white, 9x21": 0,
};
Map<String, double> windowsAndExteriorDoorBudgetSum = {
  "Window, wooden wall top swing 11x9": 0,
  "Exterior door of wood, in timber frame wall, white, 9x21": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> deckHours = {
  "Floor on ground, poured, insulated, screeded": 0,
  "Wooden beams, insulation underneath": 0,
  "Flooring on the ground, removal of screed, linoleum": 0,
};

Map<String, double> deckLaborCosts = {
  "Floor on ground, poured, insulated, screeded": 0,
  "Wooden beams, insulation underneath": 0,
  "Flooring on the ground, removal of screed, linoleum": 0,
};

Map<String, double> deckMaterialCosts = {
  "Floor on ground, poured, insulated, screeded": 0,
  "Wooden beams, insulation underneath": 0,
  "Flooring on the ground, removal of screed, linoleum": 0,
};

Map<String, double> deckBudgetSum = {
  "Floor on ground, poured, insulated, screeded": 0,
  "Wooden beams, insulation underneath": 0,
  "Flooring on the ground, removal of screed, linoleum": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> flooringHours = {
  "Wet room wall w/panel - wet room tile + tile 25x33": 0,
  "Wet room wall w/panel/plaster + tile 20x30": 0,
};
Map<String, double> flooringLaborCosts = {
  "Wet room wall w/panel - wet room tile + tile 25x33": 0,
  "Wet room wall w/panel/plaster + tile 20x30": 0,
};
Map<String, double> flooringMaterialCosts = {
  "Wet room wall w/panel - wet room tile + tile 25x33": 0,
  "Wet room wall w/panel/plaster + tile 20x30": 0,
};
Map<String, double> flooringBudgetSum = {
  "Wet room wall w/panel - wet room tile + tile 25x33": 0,
  "Wet room wall w/panel/plaster + tile 20x30": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> roofHours = {
  "Barrier roof of wood, shingles, plasterboard,": 0,
  "Wooden joists, post-insulation outside + cardboard covering": 0,
  "Demolition flat rafter roof, insulated roofing, shingle/foil on flat roofs":
      0,
};

Map<String, double> roofLaborCosts = {
  "Barrier roof of wood, shingles, plasterboard,": 0,
  "Wooden joists, post-insulation outside + cardboard covering": 0,
  "Demolition flat rafter roof, insulated roofing, shingle/foil on flat roofs":
      0,
};

Map<String, double> roofMaterialCosts = {
  "Barrier roof of wood, shingles, plasterboard,": 0,
  "Wooden joists, post-insulation outside + cardboard covering": 0,
  "Demolition flat rafter roof, insulated roofing, shingle/foil on flat roofs":
      0,
};

Map<String, double> roofBudgetSum = {
  "Barrier roof of wood, shingles, plasterboard,": 0,
  "Wooden joists, post-insulation outside + cardboard covering": 0,
  "Demolition flat rafter roof, insulated roofing, shingle/foil on flat roofs":
      0,
};
/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> terraceHours = {
  "Railings in stainless steel and glass": 0,
};

Map<String, double> terraceLaborCosts = {
  "Railings in stainless steel and glass": 0,
};

Map<String, double> terraceMaterialCosts = {
  "Railings in stainless steel and glass": 0,
};

Map<String, double> terraceBudgetSum = {
  "Railings in stainless steel and glass": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> innerStairsHours = {
  "Stairs inside, three straight runs": 0,
};

Map<String, double> innerStairsLaborCosts = {
  "Stairs inside, three straight runs": 0,
};

Map<String, double> innerStairsMaterialCosts = {
  "Stairs inside, three straight runs": 0,
};

Map<String, double> innerStairsBudgetSum = {
  "Stairs inside, three straight runs": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> hullRoofingHours = {
  "Punched roofing single-family house 244m² GFA - 2 floors (Calculate quantity and select material type),":
      0,
};

Map<String, double> hullRoofingLaborCosts = {
  "Punched roofing single-family house 244m² GFA - 2 floors (Calculate quantity and select material type),":
      0,
};

Map<String, double> hullRoofingMaterialCosts = {
  "Punched roofing single-family house 244m² GFA - 2 floors (Calculate quantity and select material type),":
      0,
};

Map<String, double> hullRoofingBudgetSum = {
  "Punched roofing single-family house 244m² GFA - 2 floors (Calculate quantity and select material type),":
      0,
};
/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> scaffoldingHours = {
  "Beams and columns, glulam/steel - Detached house": 0,
};

Map<String, double> scaffoldingLaborCosts = {
  "Beams and columns, glulam/steel - Detached house": 0,
};

Map<String, double> scaffoldingMaterialCosts = {
  "Beams and columns, glulam/steel - Detached house": 0,
};

Map<String, double> scaffoldingBudgetSum = {
  "Beams and columns, glulam/steel - Detached house": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> wasteHours = {
  "Waste removal": 0,
};

Map<String, double> wasteLaborCosts = {
  "Waste removal": 0,
};

Map<String, double> wasteMaterialCosts = {
  "Waste removal": 0,
};

Map<String, double> wasteBudgetSum = {
  "Waste removal": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> supportSystemHours = {
  "Beams and columns, glulam / steel - Single-family house": 0,
};

Map<String, double> supportSystemLaborCosts = {
  "Beams and columns, glulam / steel - Single-family house": 0,
};

Map<String, double> supportSystemMaterialCosts = {
  "Beams and columns, glulam / steel - Single-family house": 0,
};

Map<String, double> supportSystemBudgetSum = {
  "Beams and columns, glulam / steel - Single-family house": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

void reCalculate() {
  totalHours[0] = windowsAndExteriorDoorHours.values.reduce((s, e) => s + e);
  totalLaborCosts[0] =
      windowsAndExteriorDoorLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[0] =
      windowsAndExteriorDoorMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[0] =
      windowsAndExteriorDoorBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[1] = outerWallHours.values.reduce((s, e) => s + e);
  totalLaborCosts[1] = outerWallLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[1] = outerWallMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[1] = outerWallBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[2] = innerWallHours.values.reduce((s, e) => s + e);
  totalLaborCosts[2] = innerWallLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[2] = innerWallMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[2] = innerWallBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[3] = innerDoorHours.values.reduce((s, e) => s + e);
  totalLaborCosts[3] = innerDoorLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[3] = innerDoorMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[3] = innerDoorBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[4] = deckHours.values.reduce((s, e) => s + e);
  totalLaborCosts[4] = deckLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[4] = deckMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[4] = deckBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[5] = flooringHours.values.reduce((s, e) => s + e);
  totalLaborCosts[5] = flooringLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[5] = flooringMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[5] = flooringBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[6] = roofHours.values.reduce((s, e) => s + e);
  totalLaborCosts[6] = roofLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[6] = roofMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[6] = roofBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[7] = terraceHours.values.reduce((s, e) => s + e);
  totalLaborCosts[7] = terraceLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[7] = terraceMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[7] = terraceBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[8] = innerStairsHours.values.reduce((s, e) => s + e);
  totalLaborCosts[8] = innerStairsLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[8] =
      innerStairsMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[8] = innerStairsBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[9] = hullRoofingHours.values.reduce((s, e) => s + e);
  totalLaborCosts[9] = hullRoofingLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[9] =
      hullRoofingMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[9] = hullRoofingBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[10] = scaffoldingHours.values.reduce((s, e) => s + e);
  totalLaborCosts[10] = scaffoldingLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[10] =
      scaffoldingMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[10] = scaffoldingBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[11] = wasteHours.values.reduce((s, e) => s + e);
  totalLaborCosts[11] = wasteLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[11] = wasteMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[11] = wasteBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[12] = supportSystemHours.values.reduce((s, e) => s + e);
  totalLaborCosts[12] = supportSystemLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[12] =
      supportSystemMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[12] = supportSystemBudgetSum.values.reduce((s, e) => s + e);
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
