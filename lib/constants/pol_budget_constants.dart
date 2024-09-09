import 'dart:core';

List<String> calculatedNamesOrder = [
  "System wsparcia", //13
  "Ściany zewnętrzne", //2
  "Okna i drzwi zewnętrzne", //1
  "Ściany wewnętrzne", //3
  "Drzwi wewnętrzne", //4
  "Pokrycia", //5
  "Podłogi", //6
  "Dach zewnętrzny", //7
  "Taras/Railings", //8
  "Schody wewnętrzne", //9
  "Zadaszenie kadłuba", //10
  "Rusztowania", //11
  "Gospodarka odpadami", //12
  "Razem" //14
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
  "Drewniana rama 48x98, podwójna ściana akustyczna, podwójny tynk": 0,
  "Kratownice drewniane 48x98, izolowane, panel gładki": 0,
  "Rama drewniana 48x98, cięcie h=2400, płyta gipsowo-kartonowa": 0,
  "Kratownica stalowa 2x75mm, podwójna, izolowana, gipsowa": 0,
  "Kratownica stalowa 2x100mm, podwójna, izolowana, gipsowa": 0,
  "Kratownica stalowa 2x75mm, podwójna, izolowana, podwójny tynk": 0,
  "Ściany murowane, okładzina tynkowa duplex": 0,
  "Rozbiórka drzwi w ścianie wewnętrznej zakończona": 0,
};

Map<String, double> innerWallLaborCosts = {
  "Drewniana rama 48x98, podwójna ściana akustyczna, podwójny tynk": 0,
  "Kratownice drewniane 48x98, izolowane, panel gładki": 0,
  "Rama drewniana 48x98, cięcie h=2400, płyta gipsowo-kartonowa": 0,
  "Kratownica stalowa 2x75mm, podwójna, izolowana, gipsowa": 0,
  "Kratownica stalowa 2x100mm, podwójna, izolowana, gipsowa": 0,
  "Kratownica stalowa 2x75mm, podwójna, izolowana, podwójny tynk": 0,
  "Ściany murowane, okładzina tynkowa duplex": 0,
  "Rozbiórka drzwi w ścianie wewnętrznej zakończona": 0,
};

Map<String, double> innerWallMaterialCosts = {
  "Drewniana rama 48x98, podwójna ściana akustyczna, podwójny tynk": 0,
  "Kratownice drewniane 48x98, izolowane, panel gładki": 0,
  "Rama drewniana 48x98, cięcie h=2400, płyta gipsowo-kartonowa": 0,
  "Kratownica stalowa 2x75mm, podwójna, izolowana, gipsowa": 0,
  "Kratownica stalowa 2x100mm, podwójna, izolowana, gipsowa": 0,
  "Kratownica stalowa 2x75mm, podwójna, izolowana, podwójny tynk": 0,
  "Ściany murowane, okładzina tynkowa duplex": 0,
  "Rozbiórka drzwi w ścianie wewnętrznej zakończona": 0,
};

Map<String, double> innerWallBudgetSum = {
  "Drewniana rama 48x98, podwójna ściana akustyczna, podwójny tynk": 0,
  "Kratownice drewniane 48x98, izolowane, panel gładki": 0,
  "Rama drewniana 48x98, cięcie h=2400, płyta gipsowo-kartonowa": 0,
  "Kratownica stalowa 2x75mm, podwójna, izolowana, gipsowa": 0,
  "Kratownica stalowa 2x100mm, podwójna, izolowana, gipsowa": 0,
  "Kratownica stalowa 2x75mm, podwójna, izolowana, podwójny tynk": 0,
  "Ściany murowane, okładzina tynkowa duplex": 0,
  "Rozbiórka drzwi w ścianie wewnętrznej zakończona": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> outerWallHours = {
  "Rama drewniana 48x198, okładzina 50 mm, rąbek stojący, tynk": 0,
  "Drewniana rama drewniana, po izolacji. nowe panele": 0,
  "Rozbiórka drzwi w ścianie zewnętrznej zakończona": 0,
};

Map<String, double> outerWallLaborCosts = {
  "Rama drewniana 48x198, okładzina 50 mm, rąbek stojący, tynk": 0,
  "Drewniana rama drewniana, po izolacji. nowe panele": 0,
  "Rozbiórka drzwi w ścianie zewnętrznej zakończona": 0,
};

Map<String, double> outerWallMaterialCosts = {
  "Rama drewniana 48x198, okładzina 50 mm, rąbek stojący, tynk": 0,
  "Drewniana rama drewniana, po izolacji. nowe panele": 0,
  "Rozbiórka drzwi w ścianie zewnętrznej zakończona": 0,
};

Map<String, double> outerWallBudgetSum = {
  "Rama drewniana 48x198, okładzina 50 mm, rąbek stojący, tynk": 0,
  "Drewniana rama drewniana, po izolacji. nowe panele": 0,
  "Rozbiórka drzwi w ścianie zewnętrznej zakończona": 0,
};
/////////////////////////////////////////////////////////////////////////////////////
Map<String, double> innerDoorHours = {
  "Drzwi wewnętrzne, sosna 9x21": 0,
};
Map<String, double> innerDoorLaborCosts = {
  "Drzwi wewnętrzne, sosna 9x21": 0,
};
Map<String, double> innerDoorMaterialCosts = {
  "Drzwi wewnętrzne, sosna 9x21": 0,
};
Map<String, double> innerDoorBudgetSum = {
  "Drzwi wewnętrzne, sosna 9x21": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> windowsAndExteriorDoorHours = {
  "Okno, drewniana ściana górna obrót 12x10": 0,
  "Drzwi zewnętrzne z drewna, w ścianie z muru pruskiego, białe, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorLaborCosts = {
  "Okno, drewniana ściana górna obrót 12x10": 0,
  "Drzwi zewnętrzne z drewna, w ścianie z muru pruskiego, białe, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorMaterialCosts = {
  "Okno, drewniana ściana górna obrót 12x10": 0,
  "Drzwi zewnętrzne z drewna, w ścianie z muru pruskiego, białe, 10x21": 0,
};
Map<String, double> windowsAndExteriorDoorBudgetSum = {
  "Okno, drewniana ściana górna obrót 12x10": 0,
  "Drzwi zewnętrzne z drewna, w ścianie z muru pruskiego, białe, 10x21": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> deckHours = {
  "Podłoga na gruncie, wylewana, izolowana, wylewana": 0,
  "Drewniane belki, izolacja od spodu": 0,
  "Podłogi na gruncie, usuwanie jastrychu, linoleum": 0,
};

Map<String, double> deckLaborCosts = {
  "Podłoga na gruncie, wylewana, izolowana, wylewana": 0,
  "Drewniane belki, izolacja od spodu": 0,
  "Podłogi na gruncie, usuwanie jastrychu, linoleum": 0,
};

Map<String, double> deckMaterialCosts = {
  "Podłoga na gruncie, wylewana, izolowana, wylewana": 0,
  "Drewniane belki, izolacja od spodu": 0,
  "Podłogi na gruncie, usuwanie jastrychu, linoleum": 0,
};

Map<String, double> deckBudgetSum = {
  "Podłoga na gruncie, wylewana, izolowana, wylewana": 0,
  "Drewniane belki, izolacja od spodu": 0,
  "Podłogi na gruncie, usuwanie jastrychu, linoleum": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> flooringHours = {
  "Ściana w pomieszczeniu mokrym z panelami - płytki w pomieszczeniu mokrym + płytki 25x33":
      0,
};

Map<String, double> flooringLaborCosts = {
  "Ściana w pomieszczeniu mokrym z panelami - płytki w pomieszczeniu mokrym + płytki 25x33":
      0,
};

Map<String, double> flooringMaterialCosts = {
  "Ściana w pomieszczeniu mokrym z panelami - płytki w pomieszczeniu mokrym + płytki 25x33":
      0,
};

Map<String, double> flooringBudgetSum = {
  "Ściana w pomieszczeniu mokrym z panelami - płytki w pomieszczeniu mokrym + płytki 25x33":
      0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> roofHours = {
  "Dach barierowy wykonany z drewna, gontów, płyt gipsowo-kartonowych": 0,
  "Drewniane legary, zewnętrzna izolacja + kartonowe pokrycie dachu": 0,
  "Rozbiórka płaskiego dachu krokwiowego, izolowane pokrycie dachowe, gont / folia na płaskich dachach":
      0,
};

Map<String, double> roofLaborCosts = {
  "Dach barierowy wykonany z drewna, gontów, płyt gipsowo-kartonowych": 0,
  "Drewniane legary, zewnętrzna izolacja + kartonowe pokrycie dachu": 0,
  "Rozbiórka płaskiego dachu krokwiowego, izolowane pokrycie dachowe, gont / folia na płaskich dachach":
      0,
};

Map<String, double> roofMaterialCosts = {
  "Dach barierowy wykonany z drewna, gontów, płyt gipsowo-kartonowych": 0,
  "Drewniane legary, zewnętrzna izolacja + kartonowe pokrycie dachu": 0,
  "Rozbiórka płaskiego dachu krokwiowego, izolowane pokrycie dachowe, gont / folia na płaskich dachach":
      0,
};

Map<String, double> roofBudgetSum = {
  "Dach barierowy wykonany z drewna, gontów, płyt gipsowo-kartonowych": 0,
  "Drewniane legary, zewnętrzna izolacja + kartonowe pokrycie dachu": 0,
  "Rozbiórka płaskiego dachu krokwiowego, izolowane pokrycie dachowe, gont / folia na płaskich dachach":
      0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> terraceHours = {
  "Balustrady ze stali nierdzewnej i szkła": 0,
};

Map<String, double> terraceLaborCosts = {
  "Balustrady ze stali nierdzewnej i szkła": 0,
};

Map<String, double> terraceMaterialCosts = {
  "Balustrady ze stali nierdzewnej i szkła": 0,
};

Map<String, double> terraceBudgetSum = {
  "Balustrady ze stali nierdzewnej i szkła": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> innerStairsHours = {
  "Schody w środku, trzy biegi z rzędu": 0,
};

Map<String, double> innerStairsLaborCosts = {
  "Schody w środku, trzy biegi z rzędu": 0,
};

Map<String, double> innerStairsMaterialCosts = {
  "Schody w środku, trzy biegi z rzędu": 0,
};

Map<String, double> innerStairsBudgetSum = {
  "Schody w środku, trzy biegi z rzędu": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> hullRoofingHours = {
  "Dziurkowane pokrycie dachowe domu jednorodzinnego 245m² GFA - 2 kondygnacje (Oblicz ilość i wybierz rodzaj materiału)":
      0,
};

Map<String, double> hullRoofingLaborCosts = {
  "Dziurkowane pokrycie dachowe domu jednorodzinnego 245m² GFA - 2 kondygnacje (Oblicz ilość i wybierz rodzaj materiału)":
      0,
};

Map<String, double> hullRoofingMaterialCosts = {
  "Dziurkowane pokrycie dachowe domu jednorodzinnego 245m² GFA - 2 kondygnacje (Oblicz ilość i wybierz rodzaj materiału)":
      0,
};

Map<String, double> hullRoofingBudgetSum = {
  "Dziurkowane pokrycie dachowe domu jednorodzinnego 245m² GFA - 2 kondygnacje (Oblicz ilość i wybierz rodzaj materiału)":
      0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> scaffoldingHours = {
  "Belki i słupy, drewno klejone / stal - Dom wolnostojący": 0,
};

Map<String, double> scaffoldingLaborCosts = {
  "Belki i słupy, drewno klejone / stal - Dom wolnostojący": 0,
};

Map<String, double> scaffoldingMaterialCosts = {
  "Belki i słupy, drewno klejone / stal - Dom wolnostojący": 0,
};

Map<String, double> scaffoldingBudgetSum = {
  "Belki i słupy, drewno klejone / stal - Dom wolnostojący": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> wasteHours = {
  "Usuwanie odpadów": 0,
};

Map<String, double> wasteLaborCosts = {
  "Usuwanie odpadów": 0,
};

Map<String, double> wasteMaterialCosts = {
  "Usuwanie odpadów": 0,
};

Map<String, double> wasteBudgetSum = {
  "Usuwanie odpadów": 0,
};

/////////////////////////////////////////////////////////////////////////////////////

Map<String, double> supportSystemHours = {
  "Belki i słupy, drewno klejone / stal - Dom jednorodzinny": 0,
};

Map<String, double> supportSystemLaborCosts = {
  "Belki i słupy, drewno klejone / stal - Dom jednorodzinny": 0,
};

Map<String, double> supportSystemMaterialCosts = {
  "Belki i słupy, drewno klejone / stal - Dom jednorodzinny": 0,
};

Map<String, double> supportSystemBudgetSum = {
  "Belki i słupy, drewno klejone / stal - Dom jednorodzinny": 0,
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
