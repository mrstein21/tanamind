import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/ui/profile/profile_screen.dart';

abstract class ProfileViewModel extends State<ProfileScreen> {
  LinearGradient lg1 =
      LinearGradient(colors: [Colors.green[100], Colors.green[50]]);
  LinearGradient lg2 = LinearGradient(colors: [Colors.white, Colors.green[50]]);
}
