import 'package:cost_calculator/models/windows_exterior_doors_model.dart';

final bathroomWindowsDataLit = [
  WindowsAndExteriorDoorsModel(
      name:
          "Angokrasčių ir apvadu montavimas ant esamo lango vonios kambarije.",
      description: [
        'Izoliacinė juosta 25x60 mm. aplink langą.',
        'Hermetikas 15 mm. ir sandarinimo juosta 16 mm.',
        'Vidaus angokraščiai 21x120 mm., balti.',
        'Vidaus apvadai 12x58 mm., balti.'
      ],
      unit: ['m', 'm', 'm', 'm'],
      quantity: [4, 4, 4, 4],
      laborHours1: [0.05, 0.53, 0.41, 0.41],
      laborHours2: [0.05, 0.53, 0.41, 0.41],
      laborCost: [27.5, 291.5, 225.5, 225.5],
      material: [32, 460.28, 598.72, 317.8],
      materials: [32, 460.28, 598.72, 317.8],
      totalPrice: [0, 0, 0, 0],
      constructionType: "New Construction"),
];
