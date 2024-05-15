List<String> calculatedNamesOrder = [
  'Windows and exterior doors',
  'Exterior walls',
  'Interior walls',
  'Interior door',
  'Parquet and laminate',
];

List<double> totalHours = [0, 0, 0, 0, 0, 0];

List<double> totalLaborCosts = [0, 0, 0, 0, 0, 0];

List<double> totalMaterialCosts = [0, 0, 0, 0, 0, 0];

List<double> budgetSums = [0, 0, 0, 0, 0, 0];

Map<String, double> innerWallHours = {
  "Wooden truss 48x98, double sound wall, double plaster": 0,
  "Wooden trusses 48x98, insulated, smooth panel": 0,
  "Wooden truss 48x98, precut h=2400, plaster": 0,
  "Steel trusses 2x75mm, double, insulated, plaster": 0,
  "Steel trusses 2x100mm, double, insulated, plaster": 0,
  "Steel trusses 2x75mm, double, insulated, double plaster": 0,
};

Map<String, double> innerWallLaborCosts = {
  "Wooden truss 48x98, double sound wall, double plaster": 0,
  "Wooden trusses 48x98, insulated, smooth panel": 0,
  "Wooden truss 48x98, precut h=2400, plaster": 0,
  "Steel trusses 2x75mm, double, insulated, plaster": 0,
  "Steel trusses 2x100mm, double, insulated, plaster": 0,
  "Steel trusses 2x75mm, double, insulated, double plaster": 0,
};

Map<String, double> innerWallMaterialCosts = {
  "Wooden truss 48x98, double sound wall, double plaster": 0,
  "Wooden trusses 48x98, insulated, smooth panel": 0,
  "Wooden truss 48x98, precut h=2400, plaster": 0,
  "Steel trusses 2x75mm, double, insulated, plaster": 0,
  "Steel trusses 2x100mm, double, insulated, plaster": 0,
  "Steel trusses 2x75mm, double, insulated, double plaster": 0,
};

Map<String, double> innerWallBudgetSum = {
  "Wooden truss 48x98, double sound wall, double plaster": 0,
  "Wooden trusses 48x98, insulated, smooth panel": 0,
  "Wooden truss 48x98, precut h=2400, plaster": 0,
  "Steel trusses 2x75mm, double, insulated, plaster": 0,
  "Steel trusses 2x100mm, double, insulated, plaster": 0,
  "Steel trusses 2x75mm, double, insulated, double plaster": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> outerWallHours = {
  "Timber truss 48x198, 50mm liner, standing double seam, plaster": 0,
};

Map<String, double> outerWallLaborCosts = {
  "Timber truss 48x198, 50mm liner, standing double seam, plaster": 0,
};

Map<String, double> outerWallMaterialCosts = {
  "Timber truss 48x198, 50mm liner, standing double seam, plaster": 0,
};

Map<String, double> outerWallBudgetSum = {
  "Timber truss 48x198, 50mm liner, standing double seam, plaster": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> innerDoorHours = {
  "Interior door, pine 9x21": 0,
};
Map<String, double> innerDoorLaborCosts = {
  "Interior door, pine 9x21": 0,
};
Map<String, double> innerDoorMaterialCosts = {
  "Interior door, pine 9x21": 0,
};
Map<String, double> innerDoorBudgetSum = {
  "Interior door, pine 9x21": 0,
};
/////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> parquetAndLaminateHours = {
  "Surface covering parquet": 0,
  "Laminate flooring, oak": 0,
};
Map<String, double> parquetAndLaminateLaborCosts = {
  "Surface covering parquet": 0,
  "Laminate flooring, oak": 0,
};
Map<String, double> parquetAndLaminateMaterialCosts = {
  "Surface covering parquet": 0,
  "Laminate flooring, oak": 0,
};
Map<String, double> parquetAndLaminateBudgetSum = {
  "Surface covering parquet": 0,
  "Laminate flooring, oak": 0,
};
/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> windowsAndExteriorDoorHours = {
  "Window, wooden wall top swing 12x10": 0,
  "Exterior door of wood, in timber frame wall, white, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorLaborCosts = {
  "Window, wooden wall top swing 12x10": 0,
  "Exterior door of wood, in timber frame wall, white, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorMaterialCosts = {
  "Window, wooden wall top swing 12x10": 0,
  "Exterior door of wood, in timber frame wall, white, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorBudgetSum = {
  "Window, wooden wall top swing 12x10": 0,
  "Exterior door of wood, in timber frame wall, white, 10x21": 0,
};

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
  totalHours[4] = parquetAndLaminateHours.values.reduce((s, e) => s + e);
  totalLaborCosts[4] =
      parquetAndLaminateLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[4] =
      parquetAndLaminateMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[4] = parquetAndLaminateBudgetSum.values.reduce((s, e) => s + e);
}

void addHours(String name, double hours) {
  if (innerWallHours.containsKey(name)) {
    innerWallHours[name] = hours;
  } else if (outerWallHours.containsKey(name)) {
    outerWallHours[name] = hours;
  } else if (innerDoorHours.containsKey(name)) {
    innerDoorHours[name] = hours;
  } else if (parquetAndLaminateHours.containsKey(name)) {
    parquetAndLaminateHours[name] = hours;
  } else if (windowsAndExteriorDoorHours.containsKey(name)) {
    windowsAndExteriorDoorHours[name] = hours;
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
  } else if (parquetAndLaminateLaborCosts.containsKey(name)) {
    parquetAndLaminateLaborCosts[name] = laborCosts;
  } else if (windowsAndExteriorDoorLaborCosts.containsKey(name)) {
    windowsAndExteriorDoorLaborCosts[name] = laborCosts;
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
  } else if (parquetAndLaminateMaterialCosts.containsKey(name)) {
    parquetAndLaminateMaterialCosts[name] = materialCosts;
  } else if (windowsAndExteriorDoorMaterialCosts.containsKey(name)) {
    windowsAndExteriorDoorMaterialCosts[name] = materialCosts;
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
  } else if (parquetAndLaminateBudgetSum.containsKey(name)) {
    parquetAndLaminateBudgetSum[name] = budgetSum;
  } else if (windowsAndExteriorDoorBudgetSum.containsKey(name)) {
    windowsAndExteriorDoorBudgetSum[name] = budgetSum;
  }
  reCalculate();
}
