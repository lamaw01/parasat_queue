import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<SharedPreferences> get _instance async =>
      _prefInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefInstance;

  static Future<SharedPreferences> init() async {
    _prefInstance = await _instance;
    return _prefInstance!;
  }

  static void removeValue(String key) {
    _prefInstance!.remove(key);
  }

  static String? getString(String key) {
    return _prefInstance!.getString(key);
  }

  //isServer
  static bool? getBool(String key) {
    return _prefInstance!.getBool(key);
  }

  //regularCounter specialCounter
  static int? getInt(String key) {
    return _prefInstance!.getInt(key);
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }
}
