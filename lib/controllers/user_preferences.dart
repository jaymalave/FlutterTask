import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:flutter_task/controllers/userdata_controller.dart';

class UserPreferences {
  static SharedPreferences? _preferences;
  static final userDataController = Get.put(UserDataController());

  static var _keyUsername = null;
  static var _keyName = null;
  static var _keyPhone = null;
  static var _keyBio = null;
  static var _keyDp = null;

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

  static bool checkState() {
    bool val = getUsername() == null ||
            getName() == null ||
            getBio() == null ||
            getPhone() == null ||
            getDp() == null
        ? false
        : true;
    return val;
  }

  static setFromPreferred() {
    var name = getName();
    var bio = getBio();
    var username = getUsername();
    var phone = getPhone();
    var dp = getDp();
    if (checkState()) {
      userDataController.setUserState(
        name!,
        bio!,
        phone!,
        username!,
        dp!,
      );
    }
    return 0;
  }
}
