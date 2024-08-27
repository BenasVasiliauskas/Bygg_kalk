List<String> calculatedNamesOrder = [
  "Vinduer og ytterdører", //1
  "Yttervegger", //2
  "Innvendige vegger", //3
  "Innvendig dør", //4
  "Parkett og laminat", //5
  "Dekker", //6
  "Gulvbelegg", //7
  "Yttertak", //8
  "Terrasse/rekkverk", //9
  "Innvendige trapper", //10
  "Hulltaking", //11
  "Stillas", //12
  "Avfallshåndtering", //13
  "Bæresystem", //14
  "Totaler", //15
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
  0,
];

Map<String, double> innerWallHours = {
  "Bindingsverk av tre 48x98, dobbel lydvegg, dobbel gips": 0,
  "Bindingsverk av tre 48x98, isolert, glattpanel": 0,
  "Bindingsverk av tre 48x98, kappet h=2400, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x100mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, dobbel gips": 0,
  "Brick walls, exposed cladding on two sides": 0,
  "Demolition of door in inner wall complete": 0,
};

Map<String, double> innerWallLaborCosts = {
  "Bindingsverk av tre 48x98, dobbel lydvegg, dobbel gips": 0,
  "Bindingsverk av tre 48x98, isolert, glattpanel": 0,
  "Bindingsverk av tre 48x98, kappet h=2400, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x100mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, dobbel gips": 0,
  "Brick walls, exposed cladding on two sides": 0,
  "Demolition of door in inner wall complete": 0,
};

Map<String, double> innerWallMaterialCosts = {
  "Bindingsverk av tre 48x98, dobbel lydvegg, dobbel gips": 0,
  "Bindingsverk av tre 48x98, isolert, glattpanel": 0,
  "Bindingsverk av tre 48x98, kappet h=2400, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x100mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, dobbel gips": 0,
  "Brick walls, exposed cladding on two sides": 0,
  "Demolition of door in inner wall complete": 0,
};

Map<String, double> innerWallBudgetSum = {
  "Bindingsverk av tre 48x98, dobbel lydvegg, dobbel gips": 0,
  "Bindingsverk av tre 48x98, isolert, glattpanel": 0,
  "Bindingsverk av tre 48x98, kappet h=2400, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x100mm, dobbelt, isolert, gips": 0,
  "Bindingsverk av stål 2x75mm, dobbelt, isolert, dobbel gips": 0,
  "Brick walls, exposed cladding on two sides": 0,
  "Demolition of door in inner wall complete": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> outerWallHours = {
  "Bindingsverk av tre 48x198, 50mm påforing, stående dobbelfals, gips": 0,
  "Wooden timber frame, post-insulation. new panel": 0,
  "Riving av dør i yttervegg komplett": 0,
};

Map<String, double> outerWallLaborCosts = {
  "Bindingsverk av tre 48x198, 50mm påforing, stående dobbelfals, gips": 0,
  "Wooden timber frame, post-insulation. new panel": 0,
  "Riving av dør i yttervegg komplett": 0,
};

Map<String, double> outerWallMaterialCosts = {
  "Bindingsverk av tre 48x198, 50mm påforing, stående dobbelfals, gips": 0,
  "Wooden timber frame, post-insulation. new panel": 0,
  "Riving av dør i yttervegg komplett": 0,
};

Map<String, double> outerWallBudgetSum = {
  "Bindingsverk av tre 48x198, 50mm påforing, stående dobbelfals, gips": 0,
  "Wooden timber frame, post-insulation. new panel": 0,
  "Riving av dør i yttervegg komplett": 0,
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
/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> deckHours = {
  "Gulv på grunn, plasstøpt, isolert, påstøp": 0,
  "Trebjelker, isolasjon på undersiden": 0,
  "Gulvbelegg på bakken, fjerning av avrettingsmasse, linoleum": 0,
};

Map<String, double> deckLaborCosts = {
  "Gulv på grunn, plasstøpt, isolert, påstøp": 0,
  "Trebjelker, isolasjon på undersiden": 0,
  "Gulvbelegg på bakken, fjerning av avrettingsmasse, linoleum": 0,
};

Map<String, double> deckMaterialCosts = {
  "Gulv på grunn, plasstøpt, isolert, påstøp": 0,
  "Trebjelker, isolasjon på undersiden": 0,
  "Gulvbelegg på bakken, fjerning av avrettingsmasse, linoleum": 0,
};

Map<String, double> deckBudgetSum = {
  "Gulv på grunn, plasstøpt, isolert, påstøp": 0,
  "Trebjelker, isolasjon på undersiden": 0,
  "Gulvbelegg på bakken, fjerning av avrettingsmasse, linoleum": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> flooringHours = {
  "Våtromsvegg m/panel - våtromsfliser + fliser 25x33": 0,
};

Map<String, double> flooringLaborCosts = {
  "Våtromsvegg m/panel - våtromsfliser + fliser 25x33": 0,
};

Map<String, double> flooringMaterialCosts = {
  "Våtromsvegg m/panel - våtromsfliser + fliser 25x33": 0,
};

Map<String, double> flooringBudgetSum = {
  "Våtromsvegg m/panel - våtromsfliser + fliser 25x33": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> roofHours = {
  "Sperretak av tre, takspon, gipsplater": 0,
  "Bjelkelag av tre, etterisol utv.+papptekking": 0,
  "Riving flatt sperretak, isolert tekking, singel/folie på flate tak": 0,
};

Map<String, double> roofLaborCosts = {
  "Sperretak av tre, takspon, gipsplater": 0,
  "Bjelkelag av tre, etterisol utv.+papptekking": 0,
  "Riving flatt sperretak, isolert tekking, singel/folie på flate tak": 0,
};

Map<String, double> roofMaterialCosts = {
  "Sperretak av tre, takspon, gipsplater": 0,
  "Bjelkelag av tre, etterisol utv.+papptekking": 0,
  "Riving flatt sperretak, isolert tekking, singel/folie på flate tak": 0,
};

Map<String, double> roofBudgetSum = {
  "Sperretak av tre, takspon, gipsplater": 0,
  "Bjelkelag av tre, etterisol utv.+papptekking": 0,
  "Riving flatt sperretak, isolert tekking, singel/folie på flate tak": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> terraceHours = {
  "Rekkverk i rustfritt stål og glass": 0,
};

Map<String, double> terraceLaborCosts = {
  "Rekkverk i rustfritt stål og glass": 0,
};

Map<String, double> terraceMaterialCosts = {
  "Rekkverk i rustfritt stål og glass": 0,
};

Map<String, double> terraceBudgetSum = {
  "Rekkverk i rustfritt stål og glass": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> innerStairsHours = {
  "Trapper innvendig, tre rettløp": 0,
};

Map<String, double> innerStairsLaborCosts = {
  "Trapper innvendig, tre rettløp": 0,
};

Map<String, double> innerStairsMaterialCosts = {
  "Trapper innvendig, tre rettløp": 0,
};

Map<String, double> innerStairsBudgetSum = {
  "Trapper innvendig, tre rettløp": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> hullRoofingHours = {
  "Stanset taktekking av enebolig 245m² BTA - 2 etasjer (Beregn mengde og velg materialtype),":
      0,
};

Map<String, double> hullRoofingLaborCosts = {
  "Stanset taktekking av enebolig 245m² BTA - 2 etasjer (Beregn mengde og velg materialtype),":
      0,
};

Map<String, double> hullRoofingMaterialCosts = {
  "Stanset taktekking av enebolig 245m² BTA - 2 etasjer (Beregn mengde og velg materialtype),":
      0,
};

Map<String, double> hullRoofingBudgetSum = {
  "Stanset taktekking av enebolig 245m² BTA - 2 etasjer (Beregn mengde og velg materialtype),":
      0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> scaffoldingHours = {
  "Dragere og søyler, limtre / stål - Enebolig": 0,
};

Map<String, double> scaffoldingLaborCosts = {
  "Dragere og søyler, limtre / stål - Enebolig": 0,
};

Map<String, double> scaffoldingMaterialCosts = {
  "Dragere og søyler, limtre / stål - Enebolig": 0,
};

Map<String, double> scaffoldingBudgetSum = {
  "Dragere og søyler, limtre / stål - Enebolig": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> wasteHours = {
  "Avfall flytting": 0,
};

Map<String, double> wasteLaborCosts = {
  "Avfall flytting": 0,
};

Map<String, double> wasteMaterialCosts = {
  "Avfall flytting": 0,
};

Map<String, double> wasteBudgetSum = {
  "Avfall flytting": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> supportSystemHours = {
  "Bjelker og søyler, limtre / stål - Enebolig": 0,
};

Map<String, double> supportSystemLaborCosts = {
  "Bjelker og søyler, limtre / stål - Enebolig": 0,
};

Map<String, double> supportSystemMaterialCosts = {
  "Bjelker og søyler, limtre / stål - Enebolig": 0,
};

Map<String, double> supportSystemBudgetSum = {
  "Bjelker og søyler, limtre / stål - Enebolig": 0,
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
  totalHours[4] = parquetAndLaminateHours.values.reduce((s, e) => s + e);
  totalLaborCosts[4] =
      parquetAndLaminateLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[4] =
      parquetAndLaminateMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[4] = parquetAndLaminateBudgetSum.values.reduce((s, e) => s + e);
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
  totalHours[13] = supportSystemHours.values.reduce((s, e) => s + e);
  totalLaborCosts[13] = supportSystemLaborCosts.values.reduce((s, e) => s + e);
  totalMaterialCosts[13] =
      supportSystemMaterialCosts.values.reduce((s, e) => s + e);
  budgetSums[13] = supportSystemBudgetSum.values.reduce((s, e) => s + e);
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
  } else if (parquetAndLaminateLaborCosts.containsKey(name)) {
    parquetAndLaminateLaborCosts[name] = laborCosts;
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
  } else if (parquetAndLaminateMaterialCosts.containsKey(name)) {
    parquetAndLaminateMaterialCosts[name] = materialCosts;
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
  } else if (parquetAndLaminateBudgetSum.containsKey(name)) {
    parquetAndLaminateBudgetSum[name] = budgetSum;
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
