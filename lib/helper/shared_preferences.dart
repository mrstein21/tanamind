import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static String sharedUserLogin = 'LOGIN';
  static String sharedUserToken = 'TOKEN';
  static String sharedUserName = 'USERNAME';
  static String sharedUserEmail = 'EMAIL';
  static String sharedUserPhone = 'PHONE';
  static String sharedUserID = 'USERID';
  static String sharedUserFavItem = 'FAVORITE';
  static String sharedUserCartItem = 'CART';

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

  static Future<void> setUserCart(int cart) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.setInt(sharedUserCartItem, cart);
  }

  static Future<void> setUserFav(int favorite) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.setInt(sharedUserFavItem, favorite);
  }

  //GET DATA FROM SHARED PREFERENCES

  static Future<String> getUserToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(sharedUserToken);
  }

  static Future<int> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getInt(sharedUserID);
  }

  static Future<String> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(sharedUserEmail);
  }

  static Future<String> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(sharedUserName);
  }

  static Future<String> getUserPhone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(sharedUserPhone);
  }

  static Future<int> getUserCart() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getInt(sharedUserCartItem);
  }

  static Future<int> getUserFav() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getInt(sharedUserFavItem);
  }

  static Future<void> clearUserPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.clear();
  }
}
