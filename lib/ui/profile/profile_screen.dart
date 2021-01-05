import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/ui/profile/profile_view_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  ProfileView createState() => ProfileView();
}

class ProfileView extends ProfileViewModel {
  Size size;

  @override
  void initState() {
    getUserPreferencess();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    if (tokenGlobal != null) {
      return Scaffold(
        body: ListView(
          children: [
            _buildImage(),
            _buildTokoku(),
            _buildWallet(),
            _buildTransaksi(),
            _buildFaq()
          ],
        ),
      );
    } else {
      return _buildLogin();
    }
  }

  Widget _buildLogin() {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon/ic_empty_plant.png'),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, top: 16),
              child: Text(
                'Anda harus melakukan login terlebih',
                style: fontRoboto(16.0, FontWeight.w500, Colors.black),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/login',
                  arguments: {'page': 'kelola'}),
              child: Container(
                width: 150,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                    color: mainGreen, borderRadius: BorderRadius.circular(8)),
                child: Text(
                  'LOGIN',
                  style: fontRoboto(14.0, FontWeight.w500, Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ListTile(
      leading: SizedBox(
          height: 50,
          width: 50,
          child: CircleAvatar(
            child: Text(
              userName != null ? userName[0].toUpperCase() ?? '?' : '?',
              style: GoogleFonts.roboto(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            /*backgroundImage: AssetImage('assets/dummy/richard.jpg'),*/
          )),
      title: Text(
       userName ?? 'Richard',
        style: GoogleFonts.roboto(),
      ),
      subtitle: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/edit_profile', arguments: {
            'userId': id,
            'name': userName,
            'phone': phone,
            'email': email,
          });
        },
        child: Row(
          children: [
            Icon(
              Icons.settings,
              color: Colors.grey,
              size: 15,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              'Profile Setting',
              style: GoogleFonts.roboto(),
            ),
            SizedBox(
              width: 4,
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildTokoku() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/my_store'),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [Colors.green[50], Colors.white]),
              boxShadow: [
                /*new BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(1.2, 1.1),
                ),*/
                new BoxShadow(
                  color: Colors.black45.withOpacity(0.1),
                  spreadRadius: 2.0,
                  blurRadius: 2.0,
                  offset: Offset(0, 2),
                ),
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
                    'Kelola Tokoku',
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
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWallet() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient.lerp(lg1, lg2, 1),
          boxShadow: [
            /*new BoxShadow(
              color: Colors.black26,
              blurRadius: 3.0,
              offset: Offset(0, 1),
            ),*/
            new BoxShadow(
              color: Colors.black26.withOpacity(0.1),
              spreadRadius: 2.0,
              blurRadius: 2.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Wallet',
                  style: GoogleFonts.roboto(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Atur',
                  style: GoogleFonts.roboto(
                      fontSize: 12.0,
                      color: mainGreen,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Image.asset(
                        'assets/icon/ic_ovo.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Rp. 1.000.000',
                      style: GoogleFonts.roboto(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.account_balance_wallet,
                        size: 40,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Rp. 1.000.000',
                      style: GoogleFonts.roboto(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Image.asset(
                        'assets/icon/ic_qris.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Rp. 500.000',
                      style: GoogleFonts.roboto(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTransaksi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar Transaksi',
              style: GoogleFonts.roboto(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: mainGreen,
                      size: 30,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Menunggu Pembayaran',
                      style: GoogleFonts.roboto(fontSize: 12),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.autorenew,
                      color: mainGreen,
                      size: 30,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Dalam Proses',
                      style: GoogleFonts.roboto(fontSize: 12),
                    )
                  ],
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, '/history_transaksi'),
                  child: Column(
                    children: [
                      Icon(
                        Icons.payment,
                        color: mainGreen,
                        size: 30,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Semua Transaksi',
                        style: GoogleFonts.roboto(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFaq() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 12),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xffcccccc)),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FAQ',
                      style: GoogleFonts.roboto(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Frequently Asked Question',
                      style: GoogleFonts.roboto(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
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
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xffcccccc)),
                  bottom: BorderSide(color: Color(0xffcccccc)),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Help',
                      style: GoogleFonts.roboto(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Call Center',
                      style: GoogleFonts.roboto(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
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
        ],
      ),
    );
  }
}
