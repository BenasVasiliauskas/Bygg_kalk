import 'package:flutter/material.dart';
import '../constants/language.dart';
import '../widgets/custom_drawer.dart';

class DeckScreen extends StatefulWidget {
  @override
  State<DeckScreen> createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        languageEnglish: languageEnglish,
        onLanguageChanged: (value) {
          setState(() {
            languageEnglish = value;
          });
        },
      ),
      appBar: AppBar(
        title: const Text('Bygg Kalk'),
      ),
      body: Center(
        child: languageEnglish == true
            ? Text(
                'Deck screen',
                style: Theme.of(context).textTheme.bodyLarge,
              )
            : Text(
                'Deck skjerm',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
      ),
    );
  }
}
