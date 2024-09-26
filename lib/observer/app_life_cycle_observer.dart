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
        print("App is in the foreground");
        break;
      case AppLifecycleState.inactive:
        //save project to json
        final fileName = "autoSave";
        await fileDeleteIfExists(fileName);
        await writeJsonArrayStart(fileName);
        if (languageEnglish) {
          await saveEngProjectToJSON(fileName);
        } else if (languageNorwegian) {
          await saveNorwProjectToJson(fileName);
        }
        await writeJsonArrayEnd(fileName);
        print("App is inactive");
        break;
      case AppLifecycleState.paused:
        print("App is in the background");
        break;
      case AppLifecycleState.detached:
        print("App is detached from any view");
        break;
      case AppLifecycleState.hidden:
        print("App is hidden");
        break;
    }
  }
}
