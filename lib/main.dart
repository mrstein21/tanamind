import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tanamind/routes.dart';
import 'package:tanamind/ui/home/home_screen.dart';
import 'package:tanamind/ui/onboarding/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );*/
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
      home: HomeScreen(title: 'Tanamind'),
      /*home: OnBoardingScreen(),*/
    );
  }
}
