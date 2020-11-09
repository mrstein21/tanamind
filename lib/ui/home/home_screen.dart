import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tanamind/ui/home/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomeScreenView createState() => HomeScreenView();
}

class HomeScreenView extends HomeViewModel with TickerProviderStateMixin {
  AnimationController _hideFabAnimation;

  bool isCollapse = true;
  var size;
  var screenWidth;
  var screenHeight;
  int index = 0;
  final Duration duration = const Duration(milliseconds: 300);

  void onTabTapped(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  initState() {
    super.initState();
    _hideFabAnimation =
        AnimationController(vsync: this, duration: kThemeAnimationDuration);
  }

  @override
  void dispose() {
    _hideFabAnimation.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            if (userScroll.metrics.maxScrollExtent !=
                userScroll.metrics.minScrollExtent) {
              _hideFabAnimation.forward();
            }
            break;
          case ScrollDirection.reverse:
            if (userScroll.metrics.maxScrollExtent !=
                userScroll.metrics.minScrollExtent) {
              _hideFabAnimation.reverse();
            }
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [_buildMenu(), _buildDashboard()],
      ),
    );
  }

  Widget _buildMenu() {
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
                  radius: 55,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/dummy/gillfoyle.jpg"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Betram GillFoyle",
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
                /*SizedBox(
                  height: 10,
                ),*/
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
                Text(
                  "Logout",
                  style:
                      TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
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
          child: NotificationListener<ScrollNotification>(
            onNotification: _handleScrollNotification,
            child: Scaffold(
              appBar: AppBar(
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
                title: Text("Tanaminds"),
              ),
              body: children[index]["page"],
              extendBody: true,
              floatingActionButton: ScaleTransition(
                scale: _hideFabAnimation,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/cart");
                  },
                  child: Icon(
                    Icons.shopping_basket,
                    color: Colors.white,
                  ),
                ),
              ),
              bottomNavigationBar: NotificationListener<ScrollNotification>(
                onNotification: _handleScrollNotification,
                child: ScaleTransition(
                  scale: _hideFabAnimation,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        new BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2.0,
                        ),
                      ], borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: BottomNavigationBar(
                          onTap: onTabTapped,
                          currentIndex: index,
                          selectedFontSize: 12,
                          unselectedFontSize: 12,
                          backgroundColor: Colors.white,
                          selectedItemColor: children[index]['selectedColor'],
                          unselectedItemColor: children[index]
                              ['unSelectedColor'],
                          items: [
                            BottomNavigationBarItem(
                              icon: new Icon(
                                Icons.notifications,
                                size: 40,
                              ),
                              title: Text(
                                '${children[0]['name']}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            BottomNavigationBarItem(
                              icon: new Icon(
                                Icons.store,
                                size: 40,
                              ),
                              title: Text(
                                '${children[1]['name']}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            BottomNavigationBarItem(
                              icon: new Icon(
                                Icons.shopping_basket,
                                size: 40,
                              ),
                              title: Text(
                                '${children[2]['name']}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
