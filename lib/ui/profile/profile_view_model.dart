import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/ui/profile/profile_screen.dart';

abstract class ProfileViewModel extends State<ProfileScreen> {
  LinearGradient lg1 =
      LinearGradient(colors: [Colors.green[100], Colors.green[50]]);
  LinearGradient lg2 = LinearGradient(colors: [Colors.white, Colors.green[50]]);

  var userName;
  var email;
  var phone;
  var id;
  var letter;

  getUserPreferencess() async {
    if (tokenGlobal != null) {
      id = await UserPreferences.getUserID();
      phone = await UserPreferences.getUserPhone();
      email = await UserPreferences.getUserEmail();
      var name = await UserPreferences.getUserName();
      setState(() {
        userName = name.toString()
            .replaceFirst(name[0], name[0].toString().toUpperCase());
      });
    }
  }
}
