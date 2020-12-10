import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static String sharedUserLogin = 'LOGIN';
  static String sharedUserToken = 'TOKEN';
  static String sharedUserName = 'USERNAME';
  static String sharedUserEmail = 'EMAIL';
  static String sharedUserPhone = 'PHONE';

  //STORE DATA TO SHARED PREFERENCES

  static Future<void> setUserToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.setString(sharedUserToken, token);
  }

  static Future<void> setUserName(String firstName, String lastName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.setString(sharedUserEmail, firstName + lastName);
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

  static Future<String> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.getString(sharedUserEmail);
  }

  static Future<String> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.getString(sharedUserName);
  }

  static Future<String> getUserPhone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.getString(sharedUserPhone);
  }
}
