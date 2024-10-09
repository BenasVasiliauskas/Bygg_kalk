import 'package:cost_calculator/models/waste_data_model.dart';

List<String> calculatedNamesOrder = [
  "Bæresystem", //13
  "Yttervegger", //2
  "Vinduer og ytterdører", //1
  "Innvendige vegger", //3
  "Innvendig dør", //4
  "Dekker", //5
  "Gulvbelegg", //6
  "Yttertak", //7
  "Terrasse/rekkverk", //8
  "Innvendige trapper", //9
  "Hulltaking", //10
  "Stillas", //11
  "Avfallshåndtering", //12
  "Totaler", //14
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
  "Svill tilbehør": 0,
  "Hjørnekasser pø fasader to sider 22x98mm.": 0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, MDF skyggepanel 11mm.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, Walls2Paint 12mm .":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, skyggepanel 14x120mm.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, trefiberplater 11mm.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, sponplater Walls2Paint 12mm.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, skyggepanel 14x120mm.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm., 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm., 50mm. pøforing, Walls2Paint.":
      0,
  "Bindingsverk av tre 48x198mm., Tømmermannspanel 19x148mm., 50mm. pøforing, fermacell gipsplate.":
      0,
  "Bindingsverk av tre 48x198mm., Tømmermannspanel 19x148mm., 50mm. pøforing, skyggepanel 14x120mm. hvitmalt.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Gu gipsplate, 50mm. pøforing, 1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Vindsperre , 50mm. pøforing, 1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Trefiber asfaltplate, 50mm. pøforing, 1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Brann gipsplate 15mm, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Vindsperre, 50mm. pøforing ,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende, Trefiber asfaltplate, 50mm. pøforing ,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende, Brann gipsplate 15mm, 50mm. pøforing,1 lag gips.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing,1 lag gips.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing, skyggepanel 14x120 liggende.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing, sponplate  Walls2Paint 12mm.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing, Skyggepanel 14x120mm. støende.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing , 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing, MDF skygge 11mm.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing, Walls2Paint, 12mm.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing, fermacell gipsplate.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. liggende,Gu gipsplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. liggende,Trefiber asfaltplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. støende,Gu gipsplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. støende,Trefiber asfaltplate, 50mm. pøforing,1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x200mm., Fasadeplate Aqua, uten pøforing, Walls2Paint.":
      0,
  "Bindingsverk av stølprofil 200mm.,Profilerte fasadestølplater 20-105 PL70, pøforing utvendig, Trefiber asfaltplate, 1 lag gips.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Perlestaffpanel furu 14x120mm. malt.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Perlestaffpanel furu 14x120mm., støende.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Skyggepanel 14x120mm., støende.":
      0,
  " Bindingsverk av I- profil 45x250mm.,Villmarkskledning 25x225mm. støende, Villmarkpanel 25x225mm., støende innvendig.":
      0,
  "Bindingsverk av I- profil 45x250mm.,Villmarkskledning 25x225mm. støende, Perlestaffpanel furu 14x120mm., støende.":
      0,
  "Bindingsverk av I- profil 45x250mm.,Villmarkskledning 25x225mm. støende, Skyggepanel 14x120mm., støende.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,1 lag gips.":
      0,
  "Bindingsverk av I- profil 45x250mm., fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,trefiberplater 11mm.":
      0,
  "Bindingsverk av I- profil 45x250mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,trefiberplater 11mm.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Walls2Paint 12mm.":
      0,
  "Bindingsverk av I- profil 45x250mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Walls2Paint 12mm.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I- profil 45x250mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre, 1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre, MDF skygge 11mm.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre,sponplater Walls2Paint 12mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing, MDF skygge 11mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing, sponplater Walls2Paint 12mm.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm., 1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm.,Skyggepanel 14x120mm.,liggende.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm., MDF skygge 11mm.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm., sponplate  Walls2Paint 12mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm.,trefiberisolasjon, 50mm. pøforing, fermacell gipsplate.":
      0,
  "Bindingsverk av I-profil 45x200, liggende dobbelfals Royal panel 19x123mm.,trefiberisolasjon, 50mm. pøforing, fermacell gipsplate.":
      0,
  "Bindingsverk av tre 48x198+48mm.,liggende impregnert Kebony panel 21x148mm, trefiberisolasjon, massivtre plater 88mm.":
      0,
  "Bindingsverk av tre 48x198+48mm.,liggende impregnert Kebony panel 21x148mm, trefiberisolasjon, massivtre plater 118mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm.,trefiberisolasjon, 50mm. pøforing, spilevegg eik 20x45mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm.,trefiberisolasjon, 50mm. pøforing, spilevegg furu 20x45mm.":
      0,
  "Bindingsverk av tre 48x98mm.,Tømmermannspanel 19x148mm.,uisolert.": 0,
  "Bindingsverk av tre 48x98mm.,dobbelfals panel 19x148mm. liggende,uisolert.":
      0,
};

Map<String, double> outerWallLaborCosts = {
  "Svill tilbehør": 0,
  "Hjørnekasser pø fasader to sider 22x98mm.": 0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, MDF skyggepanel 11mm.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, Walls2Paint 12mm .":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, skyggepanel 14x120mm.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, trefiberplater 11mm.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, sponplater Walls2Paint 12mm.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, skyggepanel 14x120mm.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm., 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm., 50mm. pøforing, Walls2Paint.":
      0,
  "Bindingsverk av tre 48x198mm., Tømmermannspanel 19x148mm., 50mm. pøforing, fermacell gipsplate.":
      0,
  "Bindingsverk av tre 48x198mm., Tømmermannspanel 19x148mm., 50mm. pøforing, skyggepanel 14x120mm. hvitmalt.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Gu gipsplate, 50mm. pøforing, 1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Vindsperre , 50mm. pøforing, 1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Trefiber asfaltplate, 50mm. pøforing, 1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Brann gipsplate 15mm, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Vindsperre, 50mm. pøforing ,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende, Trefiber asfaltplate, 50mm. pøforing ,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende, Brann gipsplate 15mm, 50mm. pøforing,1 lag gips.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing,1 lag gips.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing, skyggepanel 14x120 liggende.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing, sponplate  Walls2Paint 12mm.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing, Skyggepanel 14x120mm. støende.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing , 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing, MDF skygge 11mm.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing, Walls2Paint, 12mm.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing, fermacell gipsplate.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. liggende,Gu gipsplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. liggende,Trefiber asfaltplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. støende,Gu gipsplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. støende,Trefiber asfaltplate, 50mm. pøforing,1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x200mm., Fasadeplate Aqua, uten pøforing, Walls2Paint.":
      0,
  "Bindingsverk av stølprofil 200mm.,Profilerte fasadestølplater 20-105 PL70, pøforing utvendig, Trefiber asfaltplate, 1 lag gips.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Perlestaffpanel furu 14x120mm. malt.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Perlestaffpanel furu 14x120mm., støende.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Skyggepanel 14x120mm., støende.":
      0,
  " Bindingsverk av I- profil 45x250mm.,Villmarkskledning 25x225mm. støende, Villmarkpanel 25x225mm., støende innvendig.":
      0,
  "Bindingsverk av I- profil 45x250mm.,Villmarkskledning 25x225mm. støende, Perlestaffpanel furu 14x120mm., støende.":
      0,
  "Bindingsverk av I- profil 45x250mm.,Villmarkskledning 25x225mm. støende, Skyggepanel 14x120mm., støende.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,1 lag gips.":
      0,
  "Bindingsverk av I- profil 45x250mm., fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,trefiberplater 11mm.":
      0,
  "Bindingsverk av I- profil 45x250mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,trefiberplater 11mm.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Walls2Paint 12mm.":
      0,
  "Bindingsverk av I- profil 45x250mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Walls2Paint 12mm.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I- profil 45x250mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre, 1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre, MDF skygge 11mm.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre,sponplater Walls2Paint 12mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing, MDF skygge 11mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing, sponplater Walls2Paint 12mm.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm., 1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm.,Skyggepanel 14x120mm.,liggende.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm., MDF skygge 11mm.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm., sponplate  Walls2Paint 12mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm.,trefiberisolasjon, 50mm. pøforing, fermacell gipsplate.":
      0,
  "Bindingsverk av I-profil 45x200, liggende dobbelfals Royal panel 19x123mm.,trefiberisolasjon, 50mm. pøforing, fermacell gipsplate.":
      0,
  "Bindingsverk av tre 48x198+48mm.,liggende impregnert Kebony panel 21x148mm, trefiberisolasjon, massivtre plater 88mm.":
      0,
  "Bindingsverk av tre 48x198+48mm.,liggende impregnert Kebony panel 21x148mm, trefiberisolasjon, massivtre plater 118mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm.,trefiberisolasjon, 50mm. pøforing, spilevegg eik 20x45mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm.,trefiberisolasjon, 50mm. pøforing, spilevegg furu 20x45mm.":
      0,
  "Bindingsverk av tre 48x98mm.,Tømmermannspanel 19x148mm.,uisolert.": 0,
  "Bindingsverk av tre 48x98mm.,dobbelfals panel 19x148mm. liggende,uisolert.":
      0,
};

Map<String, double> outerWallMaterialCosts = {
  "Svill tilbehør": 0,
  "Hjørnekasser pø fasader to sider 22x98mm.": 0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, MDF skyggepanel 11mm.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, Walls2Paint 12mm .":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, skyggepanel 14x120mm.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, trefiberplater 11mm.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, sponplater Walls2Paint 12mm.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, skyggepanel 14x120mm.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm., 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm., 50mm. pøforing, Walls2Paint.":
      0,
  "Bindingsverk av tre 48x198mm., Tømmermannspanel 19x148mm., 50mm. pøforing, fermacell gipsplate.":
      0,
  "Bindingsverk av tre 48x198mm., Tømmermannspanel 19x148mm., 50mm. pøforing, skyggepanel 14x120mm. hvitmalt.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Gu gipsplate, 50mm. pøforing, 1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Vindsperre , 50mm. pøforing, 1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Trefiber asfaltplate, 50mm. pøforing, 1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Brann gipsplate 15mm, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Vindsperre, 50mm. pøforing ,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende, Trefiber asfaltplate, 50mm. pøforing ,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende, Brann gipsplate 15mm, 50mm. pøforing,1 lag gips.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing,1 lag gips.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing, skyggepanel 14x120 liggende.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing, sponplate  Walls2Paint 12mm.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing, Skyggepanel 14x120mm. støende.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing , 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing, MDF skygge 11mm.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing, Walls2Paint, 12mm.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing, fermacell gipsplate.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. liggende,Gu gipsplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. liggende,Trefiber asfaltplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. støende,Gu gipsplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. støende,Trefiber asfaltplate, 50mm. pøforing,1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x200mm., Fasadeplate Aqua, uten pøforing, Walls2Paint.":
      0,
  "Bindingsverk av stølprofil 200mm.,Profilerte fasadestølplater 20-105 PL70, pøforing utvendig, Trefiber asfaltplate, 1 lag gips.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Perlestaffpanel furu 14x120mm. malt.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Perlestaffpanel furu 14x120mm., støende.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Skyggepanel 14x120mm., støende.":
      0,
  " Bindingsverk av I- profil 45x250mm.,Villmarkskledning 25x225mm. støende, Villmarkpanel 25x225mm., støende innvendig.":
      0,
  "Bindingsverk av I- profil 45x250mm.,Villmarkskledning 25x225mm. støende, Perlestaffpanel furu 14x120mm., støende.":
      0,
  "Bindingsverk av I- profil 45x250mm.,Villmarkskledning 25x225mm. støende, Skyggepanel 14x120mm., støende.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,1 lag gips.":
      0,
  "Bindingsverk av I- profil 45x250mm., fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,trefiberplater 11mm.":
      0,
  "Bindingsverk av I- profil 45x250mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,trefiberplater 11mm.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Walls2Paint 12mm.":
      0,
  "Bindingsverk av I- profil 45x250mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Walls2Paint 12mm.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I- profil 45x250mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre, 1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre, MDF skygge 11mm.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre,sponplater Walls2Paint 12mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing, MDF skygge 11mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing, sponplater Walls2Paint 12mm.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm., 1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm.,Skyggepanel 14x120mm.,liggende.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm., MDF skygge 11mm.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm., sponplate  Walls2Paint 12mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm.,trefiberisolasjon, 50mm. pøforing, fermacell gipsplate.":
      0,
  "Bindingsverk av I-profil 45x200, liggende dobbelfals Royal panel 19x123mm.,trefiberisolasjon, 50mm. pøforing, fermacell gipsplate.":
      0,
  "Bindingsverk av tre 48x198+48mm.,liggende impregnert Kebony panel 21x148mm, trefiberisolasjon, massivtre plater 88mm.":
      0,
  "Bindingsverk av tre 48x198+48mm.,liggende impregnert Kebony panel 21x148mm, trefiberisolasjon, massivtre plater 118mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm.,trefiberisolasjon, 50mm. pøforing, spilevegg eik 20x45mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm.,trefiberisolasjon, 50mm. pøforing, spilevegg furu 20x45mm.":
      0,
  "Bindingsverk av tre 48x98mm.,Tømmermannspanel 19x148mm.,uisolert.": 0,
  "Bindingsverk av tre 48x98mm.,dobbelfals panel 19x148mm. liggende,uisolert.":
      0,
};

Map<String, double> outerWallBudgetSum = {
  "Svill tilbehør": 0,
  "Hjørnekasser pø fasader to sider 22x98mm.": 0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, MDF skyggepanel 11mm.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, Walls2Paint 12mm .":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm.,dobbel vindtetting, 50mm. pøforing, skyggepanel 14x120mm.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, trefiberplater 11mm.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, sponplater Walls2Paint 12mm.":
      0,
  "Bindingsverk av tre 48x198mm.,støende dobbelfals panel 19x148mm., 50mm. pøforing, skyggepanel 14x120mm.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm., 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,Tømmermannspanel 19x148mm., 50mm. pøforing, Walls2Paint.":
      0,
  "Bindingsverk av tre 48x198mm., Tømmermannspanel 19x148mm., 50mm. pøforing, fermacell gipsplate.":
      0,
  "Bindingsverk av tre 48x198mm., Tømmermannspanel 19x148mm., 50mm. pøforing, skyggepanel 14x120mm. hvitmalt.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Gu gipsplate, 50mm. pøforing, 1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Vindsperre , 50mm. pøforing, 1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Trefiber asfaltplate, 50mm. pøforing, 1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., panel 19x148mm. støende, Brann gipsplate 15mm, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Vindsperre, 50mm. pøforing ,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende, Trefiber asfaltplate, 50mm. pøforing ,1 lag gips.":
      0,
  "Precut bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende, Brann gipsplate 15mm, 50mm. pøforing,1 lag gips.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing,1 lag gips.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing, skyggepanel 14x120 liggende.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing, sponplate  Walls2Paint 12mm.":
      0,
  "Bindingsverk av heltre 48x198mm., dobbelfals panel 19x148mm. liggende,Gu gipsplate,uten pøforing, Skyggepanel 14x120mm. støende.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing , 1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing, MDF skygge 11mm.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing, Walls2Paint, 12mm.":
      0,
  "Bindingsverk av tre 48x198mm., dobbelfals panel 19x148mm. liggende,dobbel vindtetting, 50mm. pøforing, fermacell gipsplate.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. liggende,Gu gipsplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. liggende,Trefiber asfaltplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. støende,Gu gipsplate, 50mm. pøforing,1 lag gips.":
      0,
  "Precut bindingsverk av I- profil 47x200 mm., dobbelfals panel 21x120mm. støende,Trefiber asfaltplate, 50mm. pøforing,1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x200mm., Fasadeplate Aqua, uten pøforing, Walls2Paint.":
      0,
  "Bindingsverk av stølprofil 200mm.,Profilerte fasadestølplater 20-105 PL70, pøforing utvendig, Trefiber asfaltplate, 1 lag gips.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Perlestaffpanel furu 14x120mm. malt.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Perlestaffpanel furu 14x120mm., støende.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I- profil 45x250mm., Villmarkskledning 25x225mm. liggende, Skyggepanel 14x120mm., støende.":
      0,
  " Bindingsverk av I- profil 45x250mm.,Villmarkskledning 25x225mm. støende, Villmarkpanel 25x225mm., støende innvendig.":
      0,
  "Bindingsverk av I- profil 45x250mm.,Villmarkskledning 25x225mm. støende, Perlestaffpanel furu 14x120mm., støende.":
      0,
  "Bindingsverk av I- profil 45x250mm.,Villmarkskledning 25x225mm. støende, Skyggepanel 14x120mm., støende.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,1 lag gips.":
      0,
  "Bindingsverk av I- profil 45x250mm., fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,1 lag gips.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,trefiberplater 11mm.":
      0,
  "Bindingsverk av I- profil 45x250mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,trefiberplater 11mm.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Walls2Paint 12mm.":
      0,
  "Bindingsverk av I- profil 45x250mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Walls2Paint 12mm.":
      0,
  "Bindingsverk av tre 48x198mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I- profil 45x250mm.,fasadeplate 8mm. \"Steniplater Nature\": 0, vindsperre,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre, 1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre, MDF skygge 11mm.":
      0,
  "Bindingsverk av I-profil 45x250mm., dobbelfals panel 19x148mm. liggende,vindsperre,sponplater Walls2Paint 12mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing, 1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing,Skyggepanel 14x120mm., liggende.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing, MDF skygge 11mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm., 50mm. pøforing, sponplater Walls2Paint 12mm.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm., 1 lag gips.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm.,Skyggepanel 14x120mm.,liggende.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm., MDF skygge 11mm.":
      0,
  "Bindingsverk av I-profil 45x250mm., Tømmermannspanel 19x148mm., sponplate  Walls2Paint 12mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm.,trefiberisolasjon, 50mm. pøforing, fermacell gipsplate.":
      0,
  "Bindingsverk av I-profil 45x200, liggende dobbelfals Royal panel 19x123mm.,trefiberisolasjon, 50mm. pøforing, fermacell gipsplate.":
      0,
  "Bindingsverk av tre 48x198+48mm.,liggende impregnert Kebony panel 21x148mm, trefiberisolasjon, massivtre plater 88mm.":
      0,
  "Bindingsverk av tre 48x198+48mm.,liggende impregnert Kebony panel 21x148mm, trefiberisolasjon, massivtre plater 118mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm.,trefiberisolasjon, 50mm. pøforing, spilevegg eik 20x45mm.":
      0,
  "Bindingsverk av I-profil 45x200mm.,støende dobbelfals Royal panel 19x148mm.,trefiberisolasjon, 50mm. pøforing, spilevegg furu 20x45mm.":
      0,
  "Bindingsverk av tre 48x98mm.,Tømmermannspanel 19x148mm.,uisolert.": 0,
  "Bindingsverk av tre 48x98mm.,dobbelfals panel 19x148mm. liggende,uisolert.":
      0,
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
  "Våtromsvegg m/panel/gips + flis 20x30": 0,
};

Map<String, double> flooringLaborCosts = {
  "Våtromsvegg m/panel - våtromsfliser + fliser 25x33": 0,
  "Våtromsvegg m/panel/gips + flis 20x30": 0,
};

Map<String, double> flooringMaterialCosts = {
  "Våtromsvegg m/panel - våtromsfliser + fliser 25x33": 0,
  "Våtromsvegg m/panel/gips + flis 20x30": 0,
};

Map<String, double> flooringBudgetSum = {
  "Våtromsvegg m/panel - våtromsfliser + fliser 25x33": 0,
  "Våtromsvegg m/panel/gips + flis 20x30": 0,
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
  "Limtrebjelke 115x315": 0,
  "Limtrebjelke 90x225": 0,
  "Limtrebjelke impr 90x300": 0,
  "Limtrebjelke impr 90x270": 0,
  "Limtre stolpe impr 90x90": 0,
  "Limtre stolpe 115x115": 0,
  "Limtre stolpe 90x90": 0,
  "Stålbjelke, HEB 220 (73,63 kg/lm) 220mm": 0,
  "Stålsøyle HUP (14,63 kg/lm) 100x100x5": 0,
  "Montering stålsøyler HEA 200(43,53 kg/lm).": 0,
  "Montering stål-konsoll IPE 160.": 0,
  "Montering vinkelstål L 50x50x3mm.": 0,
  "Montering stålbjelke, HEA 200 (43,53 kg/lm).": 0,
  "Montering stålbjelke, HEB 260 (95,85 kg/lm).": 0,
  "Montering stålbjelke IPE 180(19,39 kg/lm).": 0,
};

Map<String, double> supportSystemLaborCosts = {
  "Limtrebjelke 115x315": 0,
  "Limtrebjelke 90x225": 0,
  "Limtrebjelke impr 90x300": 0,
  "Limtrebjelke impr 90x270": 0,
  "Limtre stolpe impr 90x90": 0,
  "Limtre stolpe 115x115": 0,
  "Limtre stolpe 90x90": 0,
  "Stålbjelke, HEB 220 (73,63 kg/lm) 220mm": 0,
  "Stålsøyle HUP (14,63 kg/lm) 100x100x5": 0,
  "Montering stålsøyler HEA 200(43,53 kg/lm).": 0,
  "Montering stål-konsoll IPE 160.": 0,
  "Montering vinkelstål L 50x50x3mm.": 0,
  "Montering stålbjelke, HEA 200 (43,53 kg/lm).": 0,
  "Montering stålbjelke, HEB 260 (95,85 kg/lm).": 0,
  "Montering stålbjelke IPE 180(19,39 kg/lm).": 0,
};

Map<String, double> supportSystemMaterialCosts = {
  "Limtrebjelke 115x315": 0,
  "Limtrebjelke 90x225": 0,
  "Limtrebjelke impr 90x300": 0,
  "Limtrebjelke impr 90x270": 0,
  "Limtre stolpe impr 90x90": 0,
  "Limtre stolpe 115x115": 0,
  "Limtre stolpe 90x90": 0,
  "Stålbjelke, HEB 220 (73,63 kg/lm) 220mm": 0,
  "Stålsøyle HUP (14,63 kg/lm) 100x100x5": 0,
  "Montering stålsøyler HEA 200(43,53 kg/lm).": 0,
  "Montering stål-konsoll IPE 160.": 0,
  "Montering vinkelstål L 50x50x3mm.": 0,
  "Montering stålbjelke, HEA 200 (43,53 kg/lm).": 0,
  "Montering stålbjelke, HEB 260 (95,85 kg/lm).": 0,
  "Montering stålbjelke IPE 180(19,39 kg/lm).": 0,
};

Map<String, double> supportSystemBudgetSum = {
  "Limtrebjelke 115x315": 0,
  "Limtrebjelke 90x225": 0,
  "Limtrebjelke impr 90x300": 0,
  "Limtrebjelke impr 90x270": 0,
  "Limtre stolpe impr 90x90": 0,
  "Limtre stolpe 115x115": 0,
  "Limtre stolpe 90x90": 0,
  "Stålbjelke, HEB 220 (73,63 kg/lm) 220mm": 0,
  "Stålsøyle HUP (14,63 kg/lm) 100x100x5": 0,
  "Montering stålsøyler HEA 200(43,53 kg/lm).": 0,
  "Montering stål-konsoll IPE 160.": 0,
  "Montering vinkelstål L 50x50x3mm.": 0,
  "Montering stålbjelke, HEA 200 (43,53 kg/lm).": 0,
  "Montering stålbjelke, HEB 260 (95,85 kg/lm).": 0,
  "Montering stålbjelke IPE 180(19,39 kg/lm).": 0,
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
