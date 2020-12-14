import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static String sharedUserLogin = 'LOGIN';
  static String sharedUserToken = 'TOKEN';
  static String sharedUserName = 'USERNAME';
  static String sharedUserEmail = 'EMAIL';
  static String sharedUserPhone = 'PHONE';
  static String sharedUserID = 'USERID';

  //STORE DATA TO SHARED PREFERENCES

  static Future<void> setUserToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.setString(sharedUserToken, token);
  }

  static Future<void> setUserId(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.setInt(sharedUserID, id);
  }

  static Future<void> setUserName(String firstName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.setString(sharedUserName, firstName);
  }

  static Future<void> setUserEmail(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.setString(sharedUserEmail, email);
  }

  static Future<void> setUserPhone(String phone) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.setString(sharedUserPhone, phone);
  }

  //GET DATA FROM SHARED PREFERENCES

  static Future<String> getUserToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.getString(sharedUserToken);
  }

  static Future<int> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.getInt(sharedUserID);
  }

  static Future<String> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.getString(sharedUserEmail);
  }

  static Future<String> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(sharedUserName);
  }

  static Future<String> getUserPhone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.getString(sharedUserPhone);
  }

  static Future<void> clearUserPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.clear();
  }
}
