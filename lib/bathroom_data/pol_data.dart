import 'package:cost_calculator/models/windows_exterior_doors_model.dart';

final bathroomWindowsDataPol = [
  WindowsAndExteriorDoorsModel(
      name:
          "Montaż ościeży i listew wykończeniowych na istniejącym oknie w łazience.",
      description: [
        'Taśma izolacyjna 25x60 mm wokół okna.',
        'Uszczelniacz 15 mm i taśma uszczelniająca 16 mm.',
        'Wewnętrzne ościeża 21x120 mm, białe.',
        'Wewnętrzne listwy wykończeniowe 12x58 mm, białe.'
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
