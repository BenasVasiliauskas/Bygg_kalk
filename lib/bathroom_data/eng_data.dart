import 'package:cost_calculator/models/windows_exterior_doors_model.dart';

final bathroomWindowsData = [
  WindowsAndExteriorDoorsModel(
      name: "Installation of reveals and trims on an existing bathroom window.",
      description: [
        'Sealing tape 25x60 mm. around the window.',
        'Sealing tape 16 mm and sealant 15 mm.',
        'Interior reveals 21x120 mm., white.',
        'Interior trims 12x58 mm., white.'
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
