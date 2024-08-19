List<String> calculatedNamesOrder = [
  "Langai ir išorinės durys",
  "Išorės sienos",
  "Vidaus sienos",
  "Vidaus durys",
  "Parketas ir laminatas",
  "Iš viso",
];

List<double> totalHours = [0, 0, 0, 0, 0, 0];

List<double> totalLaborCosts = [0, 0, 0, 0, 0, 0];

List<double> totalMaterialCosts = [0, 0, 0, 0, 0, 0];

List<double> budgetSums = [0, 0, 0, 0, 0, 0];

Map<String, double> innerWallHours = {
  "Medinė santvara 48x98, dviguba garso siena, dvigubas tinkas": 0,
  "Medinis medinis karkasas 48x98, apšiltintas, lygus apkalimas": 0,
  "Medinis karkasas 48x98, pjautas h=2400, tinkas": 0,
  "Plieninė santvara 2x75 mm, dviguba, apšiltinta, gipso kartonas": 0,
  "Plieninė santvara 2x100 mm, dviguba, apšiltinta, gipskartonio plokštė": 0,
  "Plieninė santvara 2x75 mm, dviguba, apšiltinta, dvigubas tinkas": 0,
};

Map<String, double> innerWallLaborCosts = {
  "Bindingsverk av tre 48x98, dobbel lydvegg, dobbel gips": 0,
  "Bindingsverk av tre 48x98, isolert, glattpanel": 0,
  "Bindingsverk av tre 48x98, kappet h=2400, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x100mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, dobbel gips": 0,
};

Map<String, double> innerWallMaterialCosts = {
  "Medinė santvara 48x98, dviguba garso siena, dvigubas tinkas": 0,
  "Medinis medinis karkasas 48x98, apšiltintas, lygus apkalimas": 0,
  "Medinis karkasas 48x98, pjautas h=2400, tinkas": 0,
  "Plieninė santvara 2x75 mm, dviguba, apšiltinta, gipso kartonas": 0,
  "Plieninė santvara 2x100 mm, dviguba, apšiltinta, gipskartonio plokštė": 0,
  "Plieninė santvara 2x75 mm, dviguba, apšiltinta, dvigubas tinkas": 0,
};

Map<String, double> innerWallBudgetSum = {
  "Medinė santvara 48x98, dviguba garso siena, dvigubas tinkas": 0,
  "Medinis medinis karkasas 48x98, apšiltintas, lygus apkalimas": 0,
  "Medinis karkasas 48x98, pjautas h=2400, tinkas": 0,
  "Plieninė santvara 2x75 mm, dviguba, apšiltinta, gipso kartonas": 0,
  "Plieninė santvara 2x100 mm, dviguba, apšiltinta, gipskartonio plokštė": 0,
  "Plieninė santvara 2x75 mm, dviguba, apšiltinta, dvigubas tinkas": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> outerWallHours = {
  "Medinė santvara 48x198, 50 mm pamušalas, stovinti siūlė, tinkas": 0,
};

Map<String, double> outerWallLaborCosts = {
  "Medinė santvara 48x198, 50 mm pamušalas, stovinti siūlė, tinkas": 0,
};

Map<String, double> outerWallMaterialCosts = {
  "Medinė santvara 48x198, 50 mm pamušalas, stovinti siūlė, tinkas": 0,
};

Map<String, double> outerWallBudgetSum = {
  "Medinė santvara 48x198, 50 mm pamušalas, stovinti siūlė, tinkas": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> innerDoorHours = {
  "Vidaus durys, pušies 9x21": 0,
};
Map<String, double> innerDoorLaborCosts = {
  "Vidaus durys, pušies 9x21": 0,
};
Map<String, double> innerDoorMaterialCosts = {
  "Vidaus durys, pušies 9x21": 0,
};
Map<String, double> innerDoorBudgetSum = {
  "Vidaus durys, pušies 9x21": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> parquetAndLaminateHours = {
  "Paviršiaus dangos parketas": 0,
  "Laminuota grindų danga, ąžuolas": 0,
};
Map<String, double> parquetAndLaminateLaborCosts = {
  "Paviršiaus dangos parketas": 0,
  "Laminuota grindų danga, ąžuolas": 0,
};
Map<String, double> parquetAndLaminateMaterialCosts = {
  "Paviršiaus dangos parketas": 0,
  "Laminuota grindų danga, ąžuolas": 0,
};
Map<String, double> parquetAndLaminateBudgetSum = {
  "Paviršiaus dangos parketas": 0,
  "Laminuota grindų danga, ąžuolas": 0,
};
/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> windowsAndExteriorDoorHours = {
  "Langas, medinės sienos viršus 12x10": 0,
  "Medinės lauko durys, medinio karkaso sienoje, baltos, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorLaborCosts = {
  "Langas, medinės sienos viršus 12x10": 0,
  "Medinės lauko durys, medinio karkaso sienoje, baltos, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorMaterialCosts = {
  "Langas, medinės sienos viršus 12x10": 0,
  "Medinės lauko durys, medinio karkaso sienoje, baltos, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorBudgetSum = {
  "Langas, medinės sienos viršus 12x10": 0,
  "Medinės lauko durys, medinio karkaso sienoje, baltos, 10x21": 0,
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
