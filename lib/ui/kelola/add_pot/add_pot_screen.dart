import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/ui/kelola/add_pot/add_pot_view_model.dart';
import 'package:tanamind/ui/kelola/add_pot/preview_image_screen.dart';

class AddPotScreen extends StatefulWidget {
  @override
  PotScreenView createState() => PotScreenView();
}

class PotScreenView extends AddPotViewModel {
  Size size;
  File _image;
  final picker = ImagePicker();


  Future getImage() async {
    final pickerImage = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickerImage != null) {
        setState(() {
          _image = File(pickerImage.path);
          listImage.add(_image);
          xxx = _image;
        });
      } else {
        print('no image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainGreen,
        actions: [
          IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: onSubmitBtn)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              _buildImage(),
              _buildTitle(),
              _description()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: mainGreen,
          child: Icon(Icons.camera_alt),
          onPressed: getImage),
    );
  }

  Widget _buildImage() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: Color(0xffcccccc)),
          left: BorderSide(color: Color(0xffcccccc)),
          bottom: BorderSide(color: Color(0xffcccccc)),
          right: BorderSide(color: Color(0xffcccccc)),
        )),
        child: xxx == null
            ? _buildEmptyImage() : _buildphoto()
            /*: GridView.builder(
                itemCount: listImage.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 1,
                    childAspectRatio: 0.90,
                    crossAxisSpacing: 1),
                itemBuilder: (context, index) {
                  return _buildImageList(listImage, index);
                }),*/
      ),
    );
  }

  Widget _buildphoto(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.file(
          xxx,
          fit: BoxFit.cover,
          height: 250,
        ),
      ),
    );
  }

  Widget _buildEmptyImage() {
    return Container(
      width: 100,
      height: 150,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt, color: Colors.black54, size: 30,),
          SizedBox(height: 8.0,),
          Text(
            'No Image Selected',
            style: fontRoboto(12.0, FontWeight.w500, Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildImageList(List list, int index) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/preview_image',
          arguments: {'image': list[index]}),
      child: Container(
        height: 200,
        width: 300,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Hero(
          tag: list[index],
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.file(
              list[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: title,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          hintText: 'Title',
          prefixIcon: Icon(Icons.text_fields),
          hintStyle:
              GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 14),
          isDense: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: mainGreen, width: 1)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: mainGreen, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: label,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          hintText: 'Label',
          prefixIcon: Icon(Icons.label),
          hintStyle:
              GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 14),
          isDense: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: mainGreen, width: 1)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: mainGreen, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border(
              top: BorderSide(color: Colors.black26),
              bottom: BorderSide(color: Colors.black26),
              left: BorderSide(color: Colors.black26),
              right: BorderSide(color: Colors.black26),
            )),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: desc,
              maxLines: 8,
              decoration: InputDecoration.collapsed(
                hintText: "Enter your description here",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
