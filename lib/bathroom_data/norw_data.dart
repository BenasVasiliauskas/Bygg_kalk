import 'package:cost_calculator/models/windows_exterior_doors_model.dart';

final bathroomWindowsDataNorw = [
  WindowsAndExteriorDoorsModel(
      name: "Påføring og listverk på eksisterende vindu innvendig i våtrom.",
      description: [
        'Dytteremse rundt dør-vindu 25x60mm.',
        'Fuging 15mm., bunnfyllingslist, vindu + dør.',
        'Utforing av gran dør/vindu 21x120mm.',
        'Innvendig belistning dør/vindu 12x58mm.'
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
