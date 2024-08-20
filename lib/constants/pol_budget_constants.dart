List<String> calculatedNamesOrder = [
  "Okna i drzwi zewnętrzne",
  "Ściany zewnętrzne",
  "Ściany wewnętrzne",
  "Drzwi wewnętrzne",
  "Parkiet i laminat",
  "Razem",
];

List<double> totalHours = [0, 0, 0, 0, 0, 0];

List<double> totalLaborCosts = [0, 0, 0, 0, 0, 0];

List<double> totalMaterialCosts = [0, 0, 0, 0, 0, 0];

List<double> budgetSums = [0, 0, 0, 0, 0, 0];

Map<String, double> innerWallHours = {
  "Drewniana kratownica 48x98, podwójna ściana akustyczna, podwójny tynk": 0,
  "Więźba drewniana 48x98, ocieplona, boazeria gładka": 0,
  "Więźba drewniana 48x98, ścięta h=2400, tynk": 0,
  "Kratownica stalowa 2x75mm, podwójna, ocieplona, suche tynki": 0,
  "Kratownica stalowa 2x100mm, podwójna, izolowana, płyta gipsowo-kartonowa": 0,
  "Kratownica stalowa 2x75mm, podwójna, izolowana, podwójny tynk": 0,
};

Map<String, double> innerWallLaborCosts = {
  "Drewniana kratownica 48x98, podwójna ściana akustyczna, podwójny tynk": 0,
  "Więźba drewniana 48x98, ocieplona, boazeria gładka": 0,
  "Więźba drewniana 48x98, ścięta h=2400, tynk": 0,
  "Kratownica stalowa 2x75mm, podwójna, ocieplona, suche tynki": 0,
  "Kratownica stalowa 2x100mm, podwójna, izolowana, płyta gipsowo-kartonowa": 0,
  "Kratownica stalowa 2x75mm, podwójna, izolowana, podwójny tynk": 0,
};

Map<String, double> innerWallMaterialCosts = {
  "Drewniana kratownica 48x98, podwójna ściana akustyczna, podwójny tynk": 0,
  "Więźba drewniana 48x98, ocieplona, boazeria gładka": 0,
  "Więźba drewniana 48x98, ścięta h=2400, tynk": 0,
  "Kratownica stalowa 2x75mm, podwójna, ocieplona, suche tynki": 0,
  "Kratownica stalowa 2x100mm, podwójna, izolowana, płyta gipsowo-kartonowa": 0,
  "Kratownica stalowa 2x75mm, podwójna, izolowana, podwójny tynk": 0,
};

Map<String, double> innerWallBudgetSum = {
  "Drewniana kratownica 48x98, podwójna ściana akustyczna, podwójny tynk": 0,
  "Więźba drewniana 48x98, ocieplona, boazeria gładka": 0,
  "Więźba drewniana 48x98, ścięta h=2400, tynk": 0,
  "Kratownica stalowa 2x75mm, podwójna, ocieplona, suche tynki": 0,
  "Kratownica stalowa 2x100mm, podwójna, izolowana, płyta gipsowo-kartonowa": 0,
  "Kratownica stalowa 2x75mm, podwójna, izolowana, podwójny tynk": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> outerWallHours = {
  "Więźba drewniana 48x198, okładzina 50 mm, rąbek stojący, tynk": 0,
};

Map<String, double> outerWallLaborCosts = {
  "Więźba drewniana 48x198, okładzina 50 mm, rąbek stojący, tynk": 0,
};

Map<String, double> outerWallMaterialCosts = {
  "Więźba drewniana 48x198, okładzina 50 mm, rąbek stojący, tynk": 0,
};

Map<String, double> outerWallBudgetSum = {
  "Więźba drewniana 48x198, okładzina 50 mm, rąbek stojący, tynk": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> innerDoorHours = {
  "Drzwi wewnętrzne sosnowe 9x21": 0,
};
Map<String, double> innerDoorLaborCosts = {
  "Drzwi wewnętrzne sosnowe 9x21": 0,
};
Map<String, double> innerDoorMaterialCosts = {
  "Drzwi wewnętrzne sosnowe 9x21": 0,
};
Map<String, double> innerDoorBudgetSum = {
  "Drzwi wewnętrzne sosnowe 9x21": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> parquetAndLaminateHours = {
  "Parkiet powierzchniowy": 0,
  "Podłoga laminowana, dąb": 0,
};
Map<String, double> parquetAndLaminateLaborCosts = {
  "Parkiet powierzchniowy": 0,
  "Podłoga laminowana, dąb": 0,
};
Map<String, double> parquetAndLaminateMaterialCosts = {
  "Parkiet powierzchniowy": 0,
  "Podłoga laminowana, dąb": 0,
};
Map<String, double> parquetAndLaminateBudgetSum = {
  "Parkiet powierzchniowy": 0,
  "Podłoga laminowana, dąb": 0,
};
/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> windowsAndExteriorDoorHours = {
  "Okno, górna część drewnianej ściany 12x10": 0,
  "Drewniane drzwi tarasowe, ściana z drewnianą ramą, białe, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorLaborCosts = {
  "Okno, górna część drewnianej ściany 12x10": 0,
  "Drewniane drzwi tarasowe, ściana z drewnianą ramą, białe, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorMaterialCosts = {
  "Okno, górna część drewnianej ściany 12x10": 0,
  "Drewniane drzwi tarasowe, ściana z drewnianą ramą, białe, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorBudgetSum = {
  "Okno, górna część drewnianej ściany 12x10": 0,
  "Drewniane drzwi tarasowe, ściana z drewnianą ramą, białe, 10x21": 0,
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

  totalHours[4] = parquetAndLaminateHours.values.reduce((s, e) => s + e);
  totalLaborCosts[4] =
      parquetAndLaminateLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[4] =
      parquetAndLaminateMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[4] = parquetAndLaminateBudgetSum.values.reduce((s, e) => s + e);

  //
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
