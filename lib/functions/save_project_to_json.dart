import 'package:cost_calculator/functions/save_to_json.dart';

Future<void> saveProject(String projectName, var savingModel) async {
  for (int i = 0; i < savingModel.length; i++) {
    await writeJsonOriginal(savingModel[i], projectName);
    if (i < savingModel.length && i != savingModel.length - 1)
      await writeJsonComma(projectName);
  }
}
