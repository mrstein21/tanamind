import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class PreviewImage extends StatelessWidget {

  /*Future<String> saveImage() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    String dirPath = '$dir/Flutter/Tanamind';
    await image.copy(dirPath);
  }*/

  @override
  Widget build(BuildContext context) {
    final route =
    ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(
                Icons.file_download,
                color: Colors.white,
              ),
              onPressed: null),
        ],
      ),
      body: Hero(tag: route['image'], child: Image.file(route['image'])),
    );
  }
}
