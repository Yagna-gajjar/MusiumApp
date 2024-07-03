import 'package:shared_preferences/shared_preferences.dart';

class Controllers {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<void> StringSet({required String key, required String value}) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

  static Future<String?> StringGet({required String key}) async {
    SharedPreferences prefs = await _prefs;
    String? result = await prefs.getString(key);
    return result;
  }
}