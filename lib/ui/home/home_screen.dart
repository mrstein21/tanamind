import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/ui/home/home_view_model.dart';

import 'bottom_navbar_helper.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomeScreenView createState() => HomeScreenView();
}

class HomeScreenView extends HomeViewModel {
  bool isCollapse = true;
  var fSize;
  var size;
  var screenWidth;
  var screenHeight;
  int index = 0;
  final Duration duration = const Duration(milliseconds: 300);

  void _selectedTab(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  void initState() {
    getUserPreferencess();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    if (screenHeight < 672 && screenWidth < 360) {
      fSize = 9.0;
      print('font size $fSize and screen size is $screenHeight');
    } else if (screenHeight >= 672 && screenHeight < 799) {
      fSize = 12.0;
      print('font size $fSize and screen size is $screenHeight');
    } else if (screenHeight > 799) {
      fSize = 14.0;
      print('font size $fSize and screen size is $screenHeight');
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: mainGreen,
      body: Stack(
        children: [_buildMenu(), _buildDashboard()],
      ),
    );
  }

  Widget _buildMenu() {
    print('user name : $userName');
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: CircleAvatar(
                    radius: 40,
                    /*backgroundImage: AssetImage("assets/dummy/gillfoyle.jpg"),*/
                    child: Text(
                      userName != null ? '${userName[0]}'.toUpperCase() : '',
                      style: GoogleFonts.roboto(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  userInitial ?? "Betram GillFoyle",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/list_order");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_basket,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Orders",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/favourite");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Favourite",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/cart");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Cart",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/forum");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_bubble,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Forum",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Setting",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.power_settings_new,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: logOut,
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboard() {
    return AnimatedPositioned(
      duration: duration,
      top: isCollapse ? 0 : 0.1 * screenHeight,
      bottom: isCollapse ? 0 : 0.2 * screenWidth,
      left: isCollapse ? 0 : 0.5 * screenWidth,
      right: isCollapse ? 0 : -0.4 * screenWidth,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        elevation: 8,
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: mainGreen,
              leading: InkWell(
                onTap: () {
                  setState(() {
                    isCollapse = !isCollapse;
                  });
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
              /*title: children[index]['name'] == 'Reminder' ||
                  children[index]['name'] == 'Market'
                  ? _titleStyle('Tanamind')
                  : children[index]['name'] == 'Tanamanku'
                  ? _titleStyle('My Plant')
                  : _titleStyle('Profile'),*/
              title: _titleStyle('Tanamind'),
            ),
            body: children[index]["page"],
            extendBody: true,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              mini: true,
              backgroundColor: mainGreen,
              onPressed: () {
                if (children[index]["name"] == 'Tanamanku')
                  Navigator.pushNamed(context, "/add_pot");
                else
                  setState(() {
                    this.index = 2;
                  });
              },
              child: Icon(
                children[index]["name"] == 'Tanamanku'
                    ? Icons.add
                    : Icons.shopping_basket,
                color: Colors.white,
              ),
            ),
            bottomNavigationBar: FABBottomAppBar(
              color: Colors.grey,
              selectedColor: children[index]['selectedColor'],
              notchedShape: CircularNotchedRectangle(),
              onTabSelected: _selectedTab,
              items: [
                FABBottomAppBarItem(
                    iconData: Icons.notifications,
                    text: 'Reminder',
                    fSize: fSize),
                FABBottomAppBarItem(
                    iconData: Icons.store, text: 'Tanamanku', fSize: fSize),
                FABBottomAppBarItem(
                    iconData: Icons.shopping_basket,
                    text: 'Market',
                    fSize: fSize),
                FABBottomAppBarItem(
                    iconData: Icons.account_circle,
                    text: 'Akun',
                    fSize: fSize),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleStyle(String title) {
    TextStyle _style = GoogleFonts.courgette(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white);

    return Text(
      title,
      style: _style,
      textScaleFactor: 1.5,
    );
  }
}
