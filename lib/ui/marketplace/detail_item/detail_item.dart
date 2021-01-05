import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tanamind/cubit/favourite/add_fav_cubit.dart';
import 'package:tanamind/cubit/favourite/add_fav_state.dart';
import 'package:tanamind/cubit/marketplace/similar_item/similar_item_cubit.dart';
import 'package:tanamind/cubit/marketplace/similar_item/similar_item_state.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/model/marketplace_model/category_item_model.dart';
import 'package:tanamind/ui/marketplace/similar_item/similar_screen.dart';
import 'package:tanamind/ui/widget/widget_helper.dart';

import 'detail_item_view_model.dart';

class DetailItem extends StatefulWidget {
  @override
  DetailItemView createState() => DetailItemView();
}

class DetailItemView extends DetailItemViewModel {
  var size;
  var data;
  String image;

  @override
  void initState() {
    fav = BlocProvider.of<AddFavCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    data = route['data'];
    image = route['image'];

    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            image ?? item["image"],
            fit: BoxFit.cover,
            width: double.infinity,
            height: size.height / 2,
          ),
          _buildBottom()
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      expand: true,
      builder: (context, controller) {
        return Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              boxShadow: [
                new BoxShadow(
                  color: Colors.black38,
                  blurRadius: 2.0,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10))),
          child: ListView(
            controller: controller,
            children: [_buildInfoItem()],
          ),
        );
      },
    );
  }

  Widget _buildInfoItem() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name ?? '',
                style: fontMonsserat(15.0, FontWeight.w500, Colors.black),
              ),
              BlocListener<AddFavCubit, AddFavState>(
                listener: (context, state) {
                  if (state is AddItemFav) {
                    flushBar(context, state.message);
                  } else if (state is ActionIsError) {
                    flushBar(context, state.message);
                  }
                },
                child: InkWell(
                  onTap: () => onAddFav(data.id),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: mainGreen,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            data.description ?? '',
            style: fontMonsserat(13.0, FontWeight.w500, Colors.black45),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Rp. ${data.price}',
            style: fontMonsserat(15.0, FontWeight.w500, mainGreen),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [_buildIncDe("0")],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: 140,
                decoration: BoxDecoration(
                    color: mainGreen,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Text(
                    "Buy",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat"),
                  ),
                ),
              ),
              InkWell(
                onTap: () => onAddCart(data.id),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 140,
                  decoration: BoxDecoration(
                      color: mainGreen,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Add To Cart",
                          style: fontMonsserat(
                              14.0, FontWeight.w500, Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.share,
                color: Colors.grey,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Bagikan",
                style: TextStyle(fontFamily: "Montserrat", color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Rate",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 9,
                ),
                SmoothStarRating(
                  isReadOnly: false,
                  allowHalfRating: true,
                  size: 30,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              "Betram Gillfoyle",
              style: TextStyle(color: Colors.black, fontFamily: "Montserrat"),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Add a comment",
                  style:
                      TextStyle(color: Colors.grey, fontFamily: "Montserrat"),
                ),
                SizedBox(
                  height: 4,
                ),
                Divider()
              ],
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/dummy/gillfoyle.jpg"),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          _buildListComments(),
          SizedBox(
            height: 7,
          ),
          Center(
              child: Text(
            "Lihat semua komentar",
            style: TextStyle(
                fontFamily: "Montserrat",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          )),
          SizedBox(
            height: 12,
          ),
          Text(
            "Produk yang sama",
            style: TextStyle(
                fontFamily: "Montserrat",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          SimilarScreen()
        ],
      ),
    );
  }

  Widget _buildListComments() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list_comment.length,
      itemBuilder: (context, index) {
        return _buildRowComment(list_comment[index]);
      },
    );
  }

  Widget _buildRowComment(var data) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ]),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(data["image"]),
        ),
        title: Text(
          data["name"],
          style:
              TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmoothStarRating(
              rating: data["rate"],
              isReadOnly: true,
              size: 20,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              data["comment"],
              style: TextStyle(fontFamily: "Montserrat", color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncDe(String qty) {
    return Container(
      padding: EdgeInsets.all(7),
      width: 80,
      decoration: BoxDecoration(
          color: mainGreen,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ]),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.remove,
              size: 20,
              color: Colors.white,
            ),
            Text(
              qty,
              style: fontMonsserat(16.0, FontWeight.w500, Colors.white),
            ),
            Icon(
              Icons.add,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

}
