import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/ui/Search/search_view_model.dart';

class SearchScreen extends StatefulWidget {
  @override
  SearchViewScreen createState() => SearchViewScreen();
}

class SearchViewScreen extends SearchViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Column(
                children: listExpand.map((e) {
                  return Container(
                    height: 100,
                    color: mainGreen,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          e,
                          style: GoogleFonts.roboto(color: Colors.white),
                        )),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
