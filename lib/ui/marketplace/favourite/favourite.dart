import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'favourite_view_model.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  FavouriteView createState() => FavouriteView();
}

class FavouriteView extends FavouriteViewModel {
  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainGreen,
        title: Text("My Favourite"),
      ),
      body: list_favourite.isEmpty
          ? Center(
              child: Text(
                'No Favourite Item...',
                style: fontRoboto(19.0, FontWeight.bold, mainGreen),
              ),
            )
          : Container(
              color: Colors.white,
              child: _buildListFavourite(),
            ),
    );
  }

  Widget _buildListFavourite() {
    return ListView.builder(
        itemCount: list_favourite.length,
        itemBuilder: (context, index) {
          return _buildRowCart(list_favourite, index);
        });
  }

  Widget _buildRowCart(var data, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildImage(data[index]["image"]),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index]["name"],
                            style: fontMonsserat(16.0, FontWeight.w600, Colors.black),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            data[index]["description"],
                            style: GoogleFonts.montserrat(
                                fontSize: 14.0,
                                color: Colors.grey,
                            fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            data[index]["price"],
                            style: fontRoboto(14.0, FontWeight.bold, mainGreen),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                data.removeAt(index);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                padding: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 2.0,
                                      )
                                    ]),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.black45,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                          _buildBottom(),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String assets) {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(assets)),
          borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget _buildBottom() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Center(
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_basket,
                size: 20,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Add to cart",
                  style: fontMonsserat(14.0, FontWeight.w600, Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: mainGreen,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ]),
    );
  }
}
