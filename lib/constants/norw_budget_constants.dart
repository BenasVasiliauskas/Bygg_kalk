List<String> calculatedNamesOrder = [
  'Innerdører',
  'Yttervegger',
  'Innvendige vegger',
  'Kjøkken',
  'Parkett og laminat',
  'Vinduer og ytterdører',
];

List<double> totalHours = [0, 0, 0, 0, 0, 0];

List<double> totalLaborCosts = [0, 0, 0, 0, 0, 0];

List<double> totalMaterialCosts = [0, 0, 0, 0, 0, 0];

List<double> budgetSums = [0, 0, 0, 0, 0, 0];

Map<String, double> innerWallHours = {
  "Bindingsverk av tre 48x98, dobbel lydvegg, dobbel gips": 0,
  "Bindingsverk av tre 48x98, isolert, glattpanel": 0,
  "Bindingsverk av tre 48x98, kappet h=2400, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x100mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, dobbel gips": 0,
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
  "Bindingsverk av tre 48x98, dobbel lydvegg, dobbel gips": 0,
  "Bindingsverk av tre 48x98, isolert, glattpanel": 0,
  "Bindingsverk av tre 48x98, kappet h=2400, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x100mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, dobbel gips": 0,
};

Map<String, double> innerWallBudgetSum = {
  "Bindingsverk av tre 48x98, dobbel lydvegg, dobbel gips": 0,
  "Bindingsverk av tre 48x98, isolert, glattpanel": 0,
  "Bindingsverk av tre 48x98, kappet h=2400, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x100mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, dobbel gips": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> outerWallHours = {
  "Bindingsverk av tre 48x198, 50mm påforing, stående dobbelfals, gips": 0,
};

Map<String, double> outerWallLaborCosts = {
  "Bindingsverk av tre 48x198, 50mm påforing, stående dobbelfals, gips": 0,
};

Map<String, double> outerWallMaterialCosts = {
  "Bindingsverk av tre 48x198, 50mm påforing, stående dobbelfals, gips": 0,
};

Map<String, double> outerWallBudgetSum = {
  "Bindingsverk av tre 48x198, 50mm påforing, stående dobbelfals, gips": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> innerDoorHours = {
  "Innerdør, furu 9x21": 0,
};
Map<String, double> innerDoorLaborCosts = {
  "Innerdør, furu 9x21": 0,
};
Map<String, double> innerDoorMaterialCosts = {
  "Innerdør, furu 9x21": 0,
};
Map<String, double> innerDoorBudgetSum = {
  "Innerdør, furu 9x21": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> kitchenHours = {
  "Innredning i bolig, kjøkken overskap": 0,
};
Map<String, double> kitchenLaborCosts = {
  "Innredning i bolig, kjøkken overskap": 0
};
Map<String, double> kitchenMaterialCosts = {
  "Innredning i bolig, kjøkken overskap": 0
};
Map<String, double> kitchenBudgetSum = {
  "Innredning i bolig, kjøkken overskap": 0
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> parquetAndLaminateHours = {
  "Overflate dekker parkett": 0,
  "Laminat gulv, eik": 0,
};
Map<String, double> parquetAndLaminateLaborCosts = {
  "Overflate dekker parkett": 0,
  "Laminat gulv, eik": 0,
};
Map<String, double> parquetAndLaminateMaterialCosts = {
  "Overflate dekker parkett": 0,
  "Laminat gulv, eik": 0,
};
Map<String, double> parquetAndLaminateBudgetSum = {
  "Overflate dekker parkett": 0,
  "Laminat gulv, eik": 0,
};
/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> windowsAndExteriorDoorHours = {
  "Vindu, trevegg toppsving 12x10": 0,
  "Ytterdør av tre, i bindingsverksvegg, hvit, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorLaborCosts = {
  "Vindu, trevegg toppsving 12x10": 0,
  "Ytterdør av tre, i bindingsverksvegg, hvit, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorMaterialCosts = {
  "Vindu, trevegg toppsving 12x10": 0,
  "Ytterdør av tre, i bindingsverksvegg, hvit, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorBudgetSum = {
  "Vindu, trevegg toppsving 12x10": 0,
  "Ytterdør av tre, i bindingsverksvegg, hvit, 10x21": 0,
};

void reCalculate() {
  totalHours[0] = innerDoorHours.values.reduce((s, e) => s + e);
  totalLaborCosts[0] = innerDoorLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[0] = innerDoorMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[0] = innerDoorBudgetSum.values.reduce((s, e) => s + e);

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
  totalHours[3] = kitchenHours.values.reduce((s, e) => s + e);
  totalLaborCosts[3] = kitchenLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[3] = kitchenMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[3] = kitchenBudgetSum.values.reduce((s, e) => s + e);
  //
  totalHours[4] = parquetAndLaminateHours.values.reduce((s, e) => s + e);
  totalLaborCosts[4] =
      parquetAndLaminateLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[4] =
      parquetAndLaminateMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[4] = parquetAndLaminateBudgetSum.values.reduce((s, e) => s + e);

  //
  totalHours[5] = windowsAndExteriorDoorHours.values.reduce((s, e) => s + e);
  totalLaborCosts[5] =
      windowsAndExteriorDoorLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[5] =
      windowsAndExteriorDoorMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[5] =
      windowsAndExteriorDoorBudgetSum.values.reduce((s, e) => s + e);
}

void addHours(String name, double hours) {
  if (innerWallHours.containsKey(name)) {
    innerWallHours[name] = hours;
  } else if (outerWallHours.containsKey(name)) {
    outerWallHours[name] = hours;
  } else if (innerDoorHours.containsKey(name)) {
    innerDoorHours[name] = hours;
  } else if (kitchenHours.containsKey(name)) {
    kitchenHours[name] = hours;
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
  } else if (kitchenLaborCosts.containsKey(name)) {
    kitchenLaborCosts[name] = laborCosts;
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
  } else if (kitchenMaterialCosts.containsKey(name)) {
    kitchenMaterialCosts[name] = materialCosts;
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
  } else if (kitchenBudgetSum.containsKey(name)) {
    kitchenBudgetSum[name] = budgetSum;
  } else if (parquetAndLaminateBudgetSum.containsKey(name)) {
    parquetAndLaminateBudgetSum[name] = budgetSum;
  } else if (windowsAndExteriorDoorBudgetSum.containsKey(name)) {
    windowsAndExteriorDoorBudgetSum[name] = budgetSum;
  }
  reCalculate();
}
