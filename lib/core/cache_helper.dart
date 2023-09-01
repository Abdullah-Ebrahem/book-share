import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void saveNotFirstTime() async {
    await _prefs.setBool('notFirstTime', false);
  }

  static bool getIfFirstTime() => _prefs.getBool('notFirstTime') ?? true;

  static void clear() {
    _prefs.clear();
  }
}
