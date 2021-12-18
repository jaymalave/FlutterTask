import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static const _keyUsername = 'username';
  static const _keyName = 'name';
  static const _keyPhone = 'phone';
  static const _keyBio = 'bio';
  static const _keyDp = 'dp';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String username) async =>
      {await _preferences!.setString(_keyUsername, username)};
  static Future setName(String name) async =>
      {await _preferences!.setString(_keyName, name)};
  static Future setBio(String bio) async =>
      {await _preferences!.setString(_keyBio, bio)};
  static Future setPhone(String phone) async =>
      {await _preferences!.setString(_keyPhone, phone)};
  static Future setDp(String dp) async =>
      {await _preferences!.setString(_keyDp, dp)};

  static String? getUsername() => _preferences!.getString(_keyUsername);
  static String? getName() => _preferences!.getString(_keyName);
  static String? getBio() => _preferences!.getString(_keyBio);
  static String? getPhone() => _preferences!.getString(_keyPhone);
  static String? getDp() => _preferences!.getString(_keyDp);
}
