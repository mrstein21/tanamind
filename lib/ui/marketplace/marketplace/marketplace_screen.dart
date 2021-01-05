import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tanamind/cubit/favourite/add_fav_cubit.dart';
import 'package:tanamind/cubit/marketplace/cart/add_cart_cubit.dart';
import 'package:tanamind/cubit/marketplace/cart/add_cart_state.dart';
import 'package:tanamind/cubit/marketplace/similar_item/similar_item_cubit.dart';
import 'package:tanamind/cubit/marketplace/similar_item/similar_item_state.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/ui/marketplace/marketplace/build_list_recomendation.dart';
import 'package:tanamind/ui/marketplace/marketplace/build_list_promotion.dart';
import 'package:tanamind/ui/marketplace/marketplace/category/build_list_category.dart';
import 'package:tanamind/ui/marketplace/marketplace/marketplace_view_model.dart';
import 'package:tanamind/ui/widget/widget_helper.dart';

class MarketPlaceScreen extends StatefulWidget {
  @override
  MarketPlaceView createState() => MarketPlaceView();
}

class MarketPlaceView extends MarketPlaceViewModel {
  var size;

  @override
  void initState() {
    if(tokenGlobal != null){
      fav = BlocProvider.of<AddFavCubit>(context);
      cart = BlocProvider.of<AddCartCubit>(context);
    }
    cubit = BlocProvider.of<SimilarCubit>(context);
    cubit.getData('3');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<AddCartCubit, AddCartState>(
          listener: (context, state){
            if(state is AddedItemCart){
              flushBar(context, state.message);
            }else if(state is AddIsError){
              flushBar(context, state.message);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearch(),
              SizedBox(
                height: 2,
              ),
              ListCategory(),
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
                ),
              ),
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
    return BlocBuilder<SimilarCubit, SimilarState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is SimilarIsLoading) {
          return _buildLoading();
        } else if (state is SimilarIsLoaded) {
          if (state.list.isEmpty) {
            return Center(
              child: Text('Tidak Ada Produk'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: new StaggeredGridView.countBuilder(
                  itemCount: state.list.length,
                  primary: false,
                  crossAxisCount: 4,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      _buildRowItems(state.list[index], index),
                  staggeredTileBuilder: (index) => new StaggeredTile.fit(2)),
            );
          }
        } else if (state is SimilarIsError) {
          return Center(
            child: Text('Internal Server Error...'),
          );
        }
      },
    );
  }

  Widget _buildLoading() {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          height: 130,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              height: 130,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRowItems(data, index) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "/detail_item", arguments: {'data': data, 'image': list_items[index]['image']}),
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
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('${list_items[index]["image"]}'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                        ),
                      ),
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
                              data.name,
                              style:
                                  TextStyle(fontFamily: 'Montserrat', fontSize: 13),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              data.description,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Rp. ${data.price}',
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
                        _buildAddCart(data.id)
                      ],
                    ),
                  )
                ],
              ),
              _buildFavourite(data.id)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddCart(var id) {
    return InkWell(
      onTap: ()=> onAddCart('$id'),
      child: Container(
        height: 30,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: mainGreen,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              new BoxShadow(
                color: Colors.black38,
                blurRadius: 2.0,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: Icon(
                Icons.shopping_basket,
                size: 20,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: Text(
                "Add To Cart",
                style: fontMonsserat(12.0, FontWeight.w500, Colors.white)),
            ),
          ],
        ),

      ),
    );
  }


  Widget _buildFavourite(var id) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: ()=> onTapButtonFav('$id'),
        child: Row(
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
        ),
      ),
    );
  }
}
