import 'package:flutter/widgets.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        print("App is in the foreground");
        break;
      case AppLifecycleState.inactive:
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
