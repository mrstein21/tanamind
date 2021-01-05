import 'package:flutter/material.dart';
import 'package:tanamind/TesSearch.dart';
import 'package:tanamind/model/hive_model/hive_cart_model.dart';
import 'package:tanamind/provider/bloc_provider.dart';
import 'package:tanamind/routes.dart';
import 'package:tanamind/ui/TesCubit.dart';
import 'package:tanamind/ui/home/home_screen.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var hiveStorage = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(hiveStorage.path);
  Hive.registerAdapter(HiveCartModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );*/
    return ListBlocProvider(
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
        home: HomeScreen(),
      ),
    );
  }
}
