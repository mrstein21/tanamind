import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanamind/cubit/auth/register/register_cubit.dart';
import 'package:tanamind/repository/auth/register.dart';
import 'package:tanamind/routes.dart';
import 'package:tanamind/ui/auth/login/login_screen.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
            create: (context) => RegisterCubit(RegisterRepository()))
      ],
      child: MaterialApp(
        title: 'Tanamind',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
        ),
        routes: routes,
        /*home: OnBoardingScreen(),*/
        home: LoginScreen(),
      ),
    );
  }
}
