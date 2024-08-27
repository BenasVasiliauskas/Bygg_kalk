List<String> calculatedNamesOrder = [
  "Langai ir išorinės durys", //1
  "Išorės sienos", //2
  "Vidaus sienos", //3
  "Vidaus durys", //4
  "Parketas ir laminatas", //5
  "Dangos", //6
  "Grindys", //7
  "Išorinis stogas", //8
  "Terasos ir (arba) turėklai", //9
  "Vidiniai laiptai", //10
  "Korpuso stogo danga", //11
  "Pastoliai", //12
  "Atliekų tvarkymas", //13
  "Atraminė sistema", //14
  "Iš viso", //15
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
  "48x98 medinis karkasas, dviguba akustinė siena, dvigubas tinkas": 0,
  "Medinės santvaros 48x98, apšiltintos, paprastos plokštės": 0,
  "Medinis rėmas 48x98, pjūvis h=2400, gipso kartonas": 0,
  "2x75 mm plieninė santvara, dviguba, apšiltinta, gipsinė": 0,
  "2x100 mm plieninė santvara, dviguba, apšiltinta, gipsinė": 0,
  "2x75 mm plieninė santvara, dvigubai apšiltinta, dvigubai tinkuota": 0,
  "Mūrinės sienos, tinkuota apdaila, dvibutis": 0,
  "Durų vidinėje sienoje griovimas baigtas": 0,
};

Map<String, double> innerWallLaborCosts = {
  "48x98 medinis karkasas, dviguba akustinė siena, dvigubas tinkas": 0,
  "Medinės santvaros 48x98, apšiltintos, paprastos plokštės": 0,
  "Medinis rėmas 48x98, pjūvis h=2400, gipso kartonas": 0,
  "2x75 mm plieninė santvara, dviguba, apšiltinta, gipsinė": 0,
  "2x100 mm plieninė santvara, dviguba, apšiltinta, gipsinė": 0,
  "2x75 mm plieninė santvara, dvigubai apšiltinta, dvigubai tinkuota": 0,
  "Mūrinės sienos, tinkuota apdaila, dvibutis": 0,
  "Durų vidinėje sienoje griovimas baigtas": 0,
};

Map<String, double> innerWallMaterialCosts = {
  "48x98 medinis karkasas, dviguba akustinė siena, dvigubas tinkas": 0,
  "Medinės santvaros 48x98, apšiltintos, paprastos plokštės": 0,
  "Medinis rėmas 48x98, pjūvis h=2400, gipso kartonas": 0,
  "2x75 mm plieninė santvara, dviguba, apšiltinta, gipsinė": 0,
  "2x100 mm plieninė santvara, dviguba, apšiltinta, gipsinė": 0,
  "2x75 mm plieninė santvara, dvigubai apšiltinta, dvigubai tinkuota": 0,
  "Mūrinės sienos, tinkuota apdaila, dvibutis": 0,
  "Durų vidinėje sienoje griovimas baigtas": 0,
};

Map<String, double> innerWallBudgetSum = {
  "48x98 medinis karkasas, dviguba akustinė siena, dvigubas tinkas": 0,
  "Medinės santvaros 48x98, apšiltintos, paprastos plokštės": 0,
  "Medinis rėmas 48x98, pjūvis h=2400, gipso kartonas": 0,
  "2x75 mm plieninė santvara, dviguba, apšiltinta, gipsinė": 0,
  "2x100 mm plieninė santvara, dviguba, apšiltinta, gipsinė": 0,
  "2x75 mm plieninė santvara, dvigubai apšiltinta, dvigubai tinkuota": 0,
  "Mūrinės sienos, tinkuota apdaila, dvibutis": 0,
  "Durų vidinėje sienoje griovimas baigtas": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> outerWallHours = {
  "48x198 medinis karkasas, 50 mm dailylentės, stovinčios siūlės, tinkas": 0,
  "Medinis karkasas, po apšiltinimo. nauja plokštė": 0,
  "Išorinėje sienoje esančių durų griovimas baigtas": 0,
};

Map<String, double> outerWallLaborCosts = {
  "48x198 medinis karkasas, 50 mm dailylentės, stovinčios siūlės, tinkas": 0,
  "Medinis karkasas, po apšiltinimo. nauja plokštė": 0,
  "Išorinėje sienoje esančių durų griovimas baigtas": 0,
};

Map<String, double> outerWallMaterialCosts = {
  "48x198 medinis karkasas, 50 mm dailylentės, stovinčios siūlės, tinkas": 0,
  "Medinis karkasas, po apšiltinimo. nauja plokštė": 0,
  "Išorinėje sienoje esančių durų griovimas baigtas": 0,
};

Map<String, double> outerWallBudgetSum = {
  "48x198 medinis karkasas, 50 mm dailylentės, stovinčios siūlės, tinkas": 0,
  "Medinis karkasas, po apšiltinimo. nauja plokštė": 0,
  "Išorinėje sienoje esančių durų griovimas baigtas": 0,
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
  "Parketo grindų danga": 0,
  "Laminuota grindų danga, ąžuolas": 0,
};
Map<String, double> parquetAndLaminateLaborCosts = {
  "Parketo grindų danga": 0,
  "Laminuota grindų danga, ąžuolas": 0,
};
Map<String, double> parquetAndLaminateMaterialCosts = {
  "Parketo grindų danga": 0,
  "Laminuota grindų danga, ąžuolas": 0,
};
Map<String, double> parquetAndLaminateBudgetSum = {
  "Parketo grindų danga": 0,
  "Laminuota grindų danga, ąžuolas": 0,
};
/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> windowsAndExteriorDoorHours = {
  "Langas, medinė viršutinė siena 12x10 posūkis": 0,
  "Medinės lauko durys pusrūsio sienoje, baltos, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorLaborCosts = {
  "Langas, medinė viršutinė siena 12x10 posūkis": 0,
  "Medinės lauko durys pusrūsio sienoje, baltos, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorMaterialCosts = {
  "Langas, medinė viršutinė siena 12x10 posūkis": 0,
  "Medinės lauko durys pusrūsio sienoje, baltos, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorBudgetSum = {
  "Langas, medinė viršutinė siena 12x10 posūkis": 0,
  "Medinės lauko durys pusrūsio sienoje, baltos, 10x21": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> deckHours = {
  "Grindys ant žemės, išlietos, apšiltintos, išlietos": 0,
  "Medinės sijos, izoliacija po jomis": 0,
  "Grindys ant žemės, išlyginamojo sluoksnio, linoleumo pašalinimas": 0,
};
Map<String, double> deckLaborCosts = {
  "Grindys ant žemės, išlietos, apšiltintos, išlietos": 0,
  "Medinės sijos, izoliacija po jomis": 0,
  "Grindys ant žemės, išlyginamojo sluoksnio, linoleumo pašalinimas": 0,
};
Map<String, double> deckMaterialCosts = {
  "Grindys ant žemės, išlietos, apšiltintos, išlietos": 0,
  "Medinės sijos, izoliacija po jomis": 0,
  "Grindys ant žemės, išlyginamojo sluoksnio, linoleumo pašalinimas": 0,
};
Map<String, double> deckBudgetSum = {
  "Grindys ant žemės, išlietos, apšiltintos, išlietos": 0,
  "Medinės sijos, izoliacija po jomis": 0,
  "Grindys ant žemės, išlyginamojo sluoksnio, linoleumo pašalinimas": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> flooringHours = {
  "Drėgno kambario siena su plokštėmis - drėgno kambario plytelės + 25x33 plytelės":
      0,
};
Map<String, double> flooringLaborCosts = {
  "Drėgno kambario siena su plokštėmis - drėgno kambario plytelės + 25x33 plytelės":
      0,
};
Map<String, double> flooringMaterialCosts = {
  "Drėgno kambario siena su plokštėmis - drėgno kambario plytelės + 25x33 plytelės":
      0,
};
Map<String, double> flooringBudgetSum = {
  "Drėgno kambario siena su plokštėmis - drėgno kambario plytelės + 25x33 plytelės":
      0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> roofHours = {
  "Barjerinis stogas iš medžio, čerpių, gipso kartono plokščių": 0,
  "Medinės sijos, išorinė izoliacija + kartoninė danga": 0,
  "Plokščiųjų stogų griovimas, apšiltinti stogai, čerpės/plėvelė ant plokščiųjų stogų":
      0,
};
Map<String, double> roofLaborCosts = {
  "Barjerinis stogas iš medžio, čerpių, gipso kartono plokščių": 0,
  "Medinės sijos, išorinė izoliacija + kartoninė danga": 0,
  "Plokščiųjų stogų griovimas, apšiltinti stogai, čerpės/plėvelė ant plokščiųjų stogų":
      0,
};
Map<String, double> roofMaterialCosts = {
  "Barjerinis stogas iš medžio, čerpių, gipso kartono plokščių": 0,
  "Medinės sijos, išorinė izoliacija + kartoninė danga": 0,
  "Plokščiųjų stogų griovimas, apšiltinti stogai, čerpės/plėvelė ant plokščiųjų stogų":
      0,
};
Map<String, double> roofBudgetSum = {
  "Barjerinis stogas iš medžio, čerpių, gipso kartono plokščių": 0,
  "Medinės sijos, išorinė izoliacija + kartoninė danga": 0,
  "Plokščiųjų stogų griovimas, apšiltinti stogai, čerpės/plėvelė ant plokščiųjų stogų":
      0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> terraceHours = {
  "Nerūdijančio plieno ir stiklo turėklai": 0,
};
Map<String, double> terraceLaborCosts = {
  "Nerūdijančio plieno ir stiklo turėklai": 0,
};
Map<String, double> terraceMaterialCosts = {
  "Nerūdijančio plieno ir stiklo turėklai": 0,
};
Map<String, double> terraceBudgetSum = {
  "Nerūdijančio plieno ir stiklo turėklai": 0,
};
/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> innerStairsHours = {
  "Laiptai viduryje, trys važiavimai iš eilės": 0,
};
Map<String, double> innerStairsLaborCosts = {
  "Laiptai viduryje, trys važiavimai iš eilės": 0,
};
Map<String, double> innerStairsMaterialCosts = {
  "Laiptai viduryje, trys važiavimai iš eilės": 0,
};
Map<String, double> innerStairsBudgetSum = {
  "Laiptai viduryje, trys važiavimai iš eilės": 0,
};
/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> hullRoofingHours = {
  "245 m² ploto vienbučio namo - 2 aukštų - denginio stogo danga (apskaičiuokite kiekį ir pasirinkite medžiagos tipą)":
      0,
};
Map<String, double> hullRoofingLaborCosts = {
  "245 m² ploto vienbučio namo - 2 aukštų - denginio stogo danga (apskaičiuokite kiekį ir pasirinkite medžiagos tipą)":
      0,
};
Map<String, double> hullRoofingMaterialCosts = {
  "245 m² ploto vienbučio namo - 2 aukštų - denginio stogo danga (apskaičiuokite kiekį ir pasirinkite medžiagos tipą)":
      0,
};
Map<String, double> hullRoofingBudgetSum = {
  "245 m² ploto vienbučio namo - 2 aukštų - denginio stogo danga (apskaičiuokite kiekį ir pasirinkite medžiagos tipą)":
      0,
};
/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> scaffoldingHours = {
  "Sijos ir kolonos, klijuotos medienos ir plieno - Individualus namas": 0,
};
Map<String, double> scaffoldingLaborCosts = {
  "Sijos ir kolonos, klijuotos medienos ir plieno - Individualus namas": 0,
};
Map<String, double> scaffoldingMaterialCosts = {
  "Sijos ir kolonos, klijuotos medienos ir plieno - Individualus namas": 0,
};
Map<String, double> scaffoldingBudgetSum = {
  "Sijos ir kolonos, klijuotos medienos ir plieno - Individualus namas": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> wasteHours = {
  "Atliekų šalinimas": 0,
};
Map<String, double> wasteLaborCosts = {
  "Atliekų šalinimas": 0,
};
Map<String, double> wasteMaterialCosts = {
  "Atliekų šalinimas": 0,
};
Map<String, double> wasteBudgetSum = {
  "Atliekų šalinimas": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> supportSystemHours = {
  "Sijos ir kolonos, klijuotosios medienos / plieno - Vienbutis namas": 0,
};
Map<String, double> supportSystemLaborCosts = {
  "Sijos ir kolonos, klijuotosios medienos / plieno - Vienbutis namas": 0,
};
Map<String, double> supportSystemMaterialCosts = {
  "Sijos ir kolonos, klijuotosios medienos / plieno - Vienbutis namas": 0,
};
Map<String, double> supportSystemBudgetSum = {
  "Sijos ir kolonos, klijuotosios medienos / plieno - Vienbutis namas": 0,
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
