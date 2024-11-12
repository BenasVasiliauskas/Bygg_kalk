import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/functions/save_project_to_json.dart';
import 'package:cost_calculator/functions/save_to_json.dart';
import 'package:flutter/widgets.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        final fileName = "autoSave";
        await fileDeleteIfExists(fileName);
        await writeJsonArrayStart(fileName);
        if (languageEnglish) {
          await saveEngProjectToJSON(fileName);
        } else if (languageNorwegian) {
          await saveNorwProjectToJson(fileName);
        }
        await writeJsonArrayEnd(fileName);
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }
}
