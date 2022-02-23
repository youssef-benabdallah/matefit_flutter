import 'package:shared_preferences/shared_preferences.dart';

class SettingsData {
  static final SettingsData instance = SettingsData._init();
  static String darkMode="darkMode";
  static String language="language";
  static String theme="theme";


  static SharedPreferences? _prefs;

  SettingsData._init();

  Future<SharedPreferences> get prefs async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  Object getPreference(String key) async {
    final sharedPr = await instance.prefs;
    Object? object = sharedPr.get(key);
    return object;
  }

  setPreference(String key, Object value) async {
    final sharedPr = await instance.prefs;
    sharedPr.setInt(key, value as int);
  }
}
