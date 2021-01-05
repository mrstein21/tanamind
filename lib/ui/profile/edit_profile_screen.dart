import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _name = TextEditingController();

  Size size;
  var gender;
  var name;
  var email;
  var phone;
  var id;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final route =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    if (route != null) {
      id = route['id'];
      name = route['name'];
      email = route['email'];
      phone = route['phone'];
    }

    print(phone);

    return Scaffold(
      body: ListView(
        children: [
          _buildAppBar(),
          _buildAvatar(),
          SizedBox(
            height: size.height * 0.03,
          ),
          _buildName(),
          _buildGender(),
          _buildEmail(),
          _buildPhone(),
          _buildButtonSave()
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
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/dummy/richard.jpg'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.photo_camera,
                          color: mainGreen,
                          size: 15,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: GoogleFonts.roboto(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            /* child: Text(
              name ?? '',
              style: GoogleFonts.roboto(
                  fontSize: 14.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500),
            ),*/
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                hintText: name ?? '',
                isDense: true,
                errorStyle: TextStyle(fontSize: 0),
                hintStyle: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500, fontSize: 14),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Date',
            style: GoogleFonts.roboto(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              '31 September 1947',
              style: GoogleFonts.roboto(
                  fontSize: 14.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGender() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        onTap: _showMaterialDialog,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gender',
              style: GoogleFonts.roboto(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    gender ?? 'Select Gender',
                    style: GoogleFonts.roboto(color: Colors.black26),
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.grey,
                    size: 15,
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.black26,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: GoogleFonts.roboto(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child:
                /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

               */ /* Text(
                  email ?? '',
                  style: GoogleFonts.roboto(color: Colors.black54),
                ),*/ /*
                */ /*Icon(
                  Icons.edit,
                  color: Colors.grey,
                  size: 15,
                )*/ /*
              ],
            ),*/
                TextField(
              decoration: InputDecoration(
                hintText: email ?? '',
                isDense: true,
                errorStyle: TextStyle(fontSize: 0),
                hintStyle: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500, fontSize: 14),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          Divider(
            color: Colors.black26,
          )
        ],
      ),
    );
  }

  Widget _buildPhone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phone',
            style: GoogleFonts.roboto(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child:
                /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                */ /*Text(
                  phone ?? '',
                  style: GoogleFonts.roboto(color: Colors.black54),
                ),*/ /*
                */ /*Icon(
                  Icons.edit,
                  color: Colors.grey,
                  size: 15,
                )*/ /*
              ],
            ),*/
                TextField(
              decoration: InputDecoration(
                hintText: phone ?? 'null',
                isDense: true,
                errorStyle: TextStyle(fontSize: 0),
                hintStyle: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500, fontSize: 14),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          Divider(
            color: Colors.black26,
          )
        ],
      ),
    );
  }

  Widget _buildButtonSave() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
            color: mainGreen, borderRadius: BorderRadius.circular(8)),
        child: Text(
          'Save',
          style: fontRoboto(14.0, FontWeight.w500, Colors.white),
        ),
      ),
    );
  }

  _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: new Text("Select Gender"),
        content: new Container(
          height: size.height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            gender = 'Male';
                          });
                          Navigator.pop(context, false);
                        },
                        child: Column(
                          children: [
                            Image.asset('assets/icon/ic_male.png'),
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text('Male'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            gender = 'Female';
                          });
                          Navigator.pop(context, false);
                        },
                        child: Column(
                          children: [
                            Image.asset('assets/icon/ic_female.png'),
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text('Female'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        gender = 'I dont want specify';
                      });
                      Navigator.pop(context, false);
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/icon/ic_unknown_gender.png'),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text('I dont want specify'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
