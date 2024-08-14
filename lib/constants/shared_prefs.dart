import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String languageKey = 'selectedLanguage';

  static Future<void> setLanguage(String languageCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(languageKey, languageCode);
  }

  static Future<String?> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(languageKey);
  }
}
