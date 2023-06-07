import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //!Fetch  ( only get is not async in SP)
  static dynamic get(String key) {
    return sharedPreferences.get(key);
  }

  //!Fetch - use to get stored jsonEncoded models
  static dynamic getModel(String key) {
    var jsonVal = sharedPreferences.get(key);
    print(jsonVal);
    if (jsonVal is String) {
      return jsonVal;
    }
  }

  //! add
  static Future<bool> set(String key, dynamic value) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is List<String>)
      return await sharedPreferences.setStringList(key, value);
    if (value is double)
      return await sharedPreferences.setDouble(key, value);

    // for adding modelObjs
    else {
      return await sharedPreferences.setString(
        key,
        value.toJson(),
      );
    }
  }

  //! delete
  static dynamic remove(String key) async {
    return await sharedPreferences.remove(key);
  }
}
