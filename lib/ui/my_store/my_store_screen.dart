import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamind/helper/constant.dart';

class MyStoreScreen extends StatefulWidget {
  @override
  _MyStoreScreenState createState() => _MyStoreScreenState();
}

class _MyStoreScreenState extends State<MyStoreScreen> {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          _buildAppBar(),
          _buildStoreName(),
          _buildList()
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey[200],
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1))
      ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: InkWell(
          onTap: ()=> Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildStoreName() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [Colors.green[50], Colors.white]),
          boxShadow: [
            new BoxShadow(
                color: Colors.black26,
                blurRadius: 3.0,
                offset: Offset(1.2, 1.1)),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icon/ic_store.png',
                width: 60,
                height: 60,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Tanamind Store',
                style: GoogleFonts.roboto(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.mode_edit,
              size: 15,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 12),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 6),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xffcccccc)),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.call_end,
                      color: Colors.grey,
                      size: 15,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Contact',
                      style: GoogleFonts.roboto(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 6),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Color(0xffcccccc)),
                    bottom: BorderSide(color: Color(0xffcccccc)),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Address',
                        style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.grey,
                  )
                ],
              )),
          Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 6),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Color(0xffcccccc)),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.store,
                        color: Colors.grey,
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Manage Product',
                        style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.grey,
                  )
                ],
              )),
          Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 6),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Color(0xffcccccc)),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_active,
                        color: Colors.grey,
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Notifications',
                        style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.grey,
                  )
                ],
              )),
          Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Color(0xffcccccc)),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icon/ic_question_mark.png',
                        width: 15,
                        height: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Help & Support',
                        style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.grey,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
