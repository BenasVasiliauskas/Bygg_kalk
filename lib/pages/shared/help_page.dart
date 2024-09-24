import 'package:cost_calculator/constants/language.dart';
import 'package:cost_calculator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class helpPage extends StatelessWidget {
  const helpPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChannels.lifecycle.setMessageHandler((msg) async {
      if (msg == AppLifecycleState.resumed.toString()) {
        print("AppLifecycleState.resumed");
      } else if (msg == AppLifecycleState.inactive.toString()) {
        print("AppLifecycleState.inactive");
      } else if (msg == AppLifecycleState.paused.toString()) {
        print("AppLifecycleState.paused");
      } else if (msg == AppLifecycleState.detached.toString()) {
        print("AppLifecycleState.detached");
      } else if (msg == AppLifecycleState.hidden.toString()) {
        print("AppLifecycleState.hidden");
      }
      return msg;
    });

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(languageEnglish
            ? "Help page"
            : languageNorwegian
                ? "Hjelpeside"
                : languagePolish
                    ? "Strona pomocy"
                    : "Pagalbos puslapis"),
      ),
    );
  }
}
