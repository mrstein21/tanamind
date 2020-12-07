import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/ui/marketplace/marketplace/build_list_recomendation.dart';
import 'package:tanamind/ui/marketplace/marketplace/build_list_promotion.dart';
import 'package:tanamind/ui/marketplace/marketplace/marketplace_view_model.dart';

class MarketPlaceScreen extends StatefulWidget {
  @override
  MarketPlaceView createState() => MarketPlaceView();
}

class MarketPlaceView extends MarketPlaceViewModel {
  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearch(),
            SizedBox(
              height: 2,
            ),
            _buildListCategory(),
            SizedBox(
              height: 2,
            ),
            Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Text(
                  "Promo Hari ini",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),),
            ListPromotion(),
            SizedBox(
              height: 8,
            ),
            Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Text(
                  "Rekomendasi",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
            ListRecommendation(),
            SizedBox(
              height: 8,
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Produk yang mungkin kamu suka",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 2,
            ),
            /*_buildListItem()*/
            _buildDynamicList()
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 16.0, 10.0, 8.0),
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            new BoxShadow(
              color: Colors.black45.withOpacity(0.1),
              spreadRadius: 2.0,
              blurRadius: 2.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.black26,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                    hintText: "Cari Tanaman",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDynamicList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: new StaggeredGridView.countBuilder(
          itemCount: list_items.length,
          primary: false,
          crossAxisCount: 4,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _buildRowItems(list_items[index]),
          staggeredTileBuilder: (index) => new StaggeredTile.fit(2)),
    );
  }

  Widget _buildRowItems(data) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/detail_item");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                new BoxShadow(
                  color: Colors.black45.withOpacity(0.1),
                  spreadRadius: 2.0,
                  blurRadius: 2.0,
                  offset: Offset(0, 2),
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImage(data["image"]),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["name"],
                          style:
                              TextStyle(fontFamily: 'Montserrat', fontSize: 13),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          data["description"],
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          data["price"],
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Roboto',
                              color: mainGreen,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildAddCart()
                    // RaisedButton.icon(
                    //     color: mainGreen,
                    //     textColor: Colors.white,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(10))
                    //     ),
                    //     onPressed: (){
                    //
                    //     }, icon: Icon(Icons.shopping_basket,size: 20,),
                    //     label: Text("Add to cart",style: TextStyle(color: Colors.white,fontFamily: "Montserrat",fontSize: 12),))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListCategory() {
    return Container(
      height: 90,
      child: ListView.builder(
          itemCount: category.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () => navigationCategory(index),
                child: _buildRowCategory(category[index]));
          }),
    );
  }

  Widget _buildRowCategory(var data) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black45.withOpacity(0.1),
                    spreadRadius: 2.0,
                    blurRadius: 2.0,
                    offset: Offset(0, 2),
                  ),
                ]),
            child: Center(
              child: Icon(
                data["icon"],
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text(
              data["name"],
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddCart() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.shopping_basket,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            "Add To Cart",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      height: 30,
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

  Widget _buildImage(String assets) {
    return Container(
      child: _buildFavourite(),
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(assets)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  Widget _buildFavourite() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
