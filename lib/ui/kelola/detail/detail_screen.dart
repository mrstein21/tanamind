import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:tanamind/ui/kelola/detail/detail_screen_view_model.dart';

class DetailTanamanKu extends StatefulWidget {
  @override
  DetailScreenView createState() => DetailScreenView();
}

class DetailScreenView extends DetailScreenViewModel {
  Size size;


  shared() async {

    var urlImage = 'https://analisaaceh.com/wp-content/uploads/2020/06/Lidah-Buaya.jpg';

    var response = await get(urlImage);
    final documentDirectory = (await getExternalStorageDirectory()).path;
    File imgFile = new File('$documentDirectory/tanaman_4.jpg');
    imgFile.writeAsBytesSync(response.bodyBytes);

    final RenderBox box = context.findRenderObject();
    Share.shareFiles(['$documentDirectory/tanaman_4.jpg'],
        text: 'my plant',
        subject: 'xxx',
        sharePositionOrigin:
        box.localToGlobal(Offset.zero) &
        box.size);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () async {
                shared();

              })
        ],
      ),
      body: ListView(
        children: [
          _buildImage(size.height),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: size.width * 0.3,
              height: size.height * 0.2,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                '$loremIpsum',
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.grey,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.grey,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 120,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  'Beli',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                width: 120,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  'Jual',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildImage(double height) {
    return Container(
      height: height * 0.4,
      child: Hero(
        tag: 'assets/tanaman_4.jpg',
        child: Image.asset(
          'assets/tanaman_4.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
