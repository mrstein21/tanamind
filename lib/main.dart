import 'package:flutter/material.dart';
import 'package:tanamind/routes.dart';
import 'package:tanamind/ui/list_plan/list_plant.dart';
import 'package:tanamind/ui/marketplace/cart/cart.dart';
import 'package:tanamind/ui/marketplace/home_marketplace/home_marketplace.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
      home: MyHomePage(title: 'Tanamind'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isCollapse=true;
  var size;
  var screenWidth;
  var screenheight;
  int _counter = 0;
  int index=0;
  final Duration duration= const Duration(milliseconds: 300);
  List<Map> children = [
    {
      "name": "Reminder",
      "page": ListPlant(),
      "unSelectedColor": Colors.grey,
      "selectedColor": Colors.green,
      "background": Colors.green
    },
    {
      "name": "Tanamanku",
      "page": ListPlant(),
      "unSelectedColor": Colors.grey,
      "selectedColor": Colors.green,
      "background": Colors.green
    },
    {
      "name": "Market",
      "page": MarketPlace(),
      "unSelectedColor": Colors.grey,
      "selectedColor": Colors.green,
      "background": Colors.green
    },

  ];

  void onTabTapped(int index) {
    setState(() {
      this.index = index;
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Widget _buildMenu(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 55,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/dummy/gillfoyle.jpg"),
                  ),

                ),
                SizedBox(
                  height: 10,
                ),
                Text("Betram GillFoyle",style: TextStyle(fontFamily: "Roboto",color: Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/list_order");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_basket,color: Colors.white,),
                  SizedBox(width: 5,),
                  Text("Orders",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/favourite");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.favorite,color: Colors.white,),
                  SizedBox(width: 5,),
                  Text("Favourite",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/cart");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart,color: Colors.white,),
                  SizedBox(width: 5,),
                  Text("Cart",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/forum");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.chat_bubble,color: Colors.white,),
                  SizedBox(width: 5,),
                  Text("Forum",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
               mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.settings,color: Colors.white,),
                SizedBox(width: 5,),
                Text("Setting",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.power_settings_new,color: Colors.white,),
                SizedBox(width: 5,),
                Text("Logout",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildDashboard(){
    return AnimatedPositioned(
      duration: duration,
      top:isCollapse?0: 0.1*screenheight,
      bottom: isCollapse?0:0.2*screenWidth,
      left: isCollapse?0:0.5*screenWidth,
      right:isCollapse?0:-0.4*screenWidth,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        elevation: 8,
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: (){
                  setState(() {
                    isCollapse=!isCollapse;
                  });
                },
                child: Icon(Icons.menu,color: Colors.white,),
              ),
              title: Text("Tanaminds"),
            ),
            body: children[index]["page"],
            extendBody: true,
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                Navigator.pushNamed(context, "/cart");
              },
              child: Icon(Icons.shopping_basket,color: Colors.white,),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(

              ),
              child:  Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black38,
                        blurRadius: 2.0,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: ClipRRect(

                  borderRadius: BorderRadius.all(Radius.circular(15)),

                  child: BottomNavigationBar(
                    onTap: onTabTapped,
                    currentIndex: index,
                    selectedFontSize: 12,
                    unselectedFontSize: 12,
                    backgroundColor: Colors.white,
                    selectedItemColor: children[index]['selectedColor'],
                    unselectedItemColor: children[index]['unSelectedColor'],
                    items: [
                      BottomNavigationBarItem(
                        icon: new Icon(Icons.notifications,size: 40,),
                        title: Text('${children[0]['name']}',style: TextStyle(fontSize: 14),),
                      ),
                      BottomNavigationBarItem(
                        icon: new Icon(Icons.store,size: 40,),
                        title: Text('${children[1]['name']}',style: TextStyle(fontSize: 14),),
                      ),
                      BottomNavigationBarItem(
                        icon: new Icon(Icons.shopping_basket,size: 40,),
                        title: Text('${children[2]['name']}',style: TextStyle(fontSize: 14),),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    screenheight=size.height;
    screenWidth=size.width;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.green,
      //appBar: AppBar(

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // title: Text(widget.title),
        // actions: [
        //   Icon(Icons.account_circle,color: Colors.white,size: 30,),
        //   SizedBox(width: 5,)
        // ],
      //),
      body: Stack(
        children: [
          _buildMenu(),
          _buildDashboard()
        ],
      )

   // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
