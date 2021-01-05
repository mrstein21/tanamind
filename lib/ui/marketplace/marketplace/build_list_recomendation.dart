import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tanamind/cubit/favourite/add_fav_cubit.dart';
import 'package:tanamind/cubit/favourite/add_fav_state.dart';
import 'package:tanamind/cubit/marketplace/cart/add_cart_cubit.dart';
import 'package:tanamind/cubit/marketplace/similar_item/similar_item_cubit.dart';
import 'package:tanamind/cubit/marketplace/similar_item/similar_item_state.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/ui/marketplace/marketplace/marketplace_view_model.dart';
import 'package:tanamind/ui/widget/widget_helper.dart';

class ListRecommendation extends StatefulWidget {
  @override
  BuildListRecommendation createState() => BuildListRecommendation();
}

class BuildListRecommendation extends ListRecommendationModel {
  var size;
  PageController _pageController;
  int _currentSlide = 0;

  @override
  void initState() {
    _controller();
    if(tokenGlobal != null){
      fav = BlocProvider.of<AddFavCubit>(context);
      cart = BlocProvider.of<AddCartCubit>(context);
    }
    cubit = BlocProvider.of<SimilarCubit>(context);
    cubit.getData('3');
    super.initState();
  }

  _controller() async {
    _pageController = PageController(
      initialPage: _currentSlide,
      keepPage: false,
      viewportFraction: 0.9,
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return BlocListener<AddFavCubit, AddFavState>(
      listener: (context, state) {
        if (state is AddItemFav) {
          print('state success : ${state.message}');
          flushBar(context, state.message);
        } else if (state is ActionIsError) {
          print('state error : ${state.message}');
          flushBar(context, state.message);
        }
      },
      child: Container(
        height: size.height * 0.2,
        child: BlocBuilder<SimilarCubit, SimilarState>(
          // ignore: missing_return
          builder: (context, state) {
            if (state is SimilarIsLoading) {
              return _buildLoading(size);
            } else if (state is SimilarIsLoaded) {
              if (state.list.isEmpty) {
                return Center(
                  child: Text('Tidak ada item rekomendasi...'),
                );
              } else {
                return PageView.builder(
                  controller: _pageController,
                  itemCount: state.list.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _buildRecommendation(state.list[index], index);
                  },
                );
              }
            } else if (state is SimilarIsError) {
              return Center(
                child: Text("Internal Server Error..."),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoading(Size size) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: size.height * 0.2,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              height: size.height * 0.2,
              width: double.infinity,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
        ));
  }

  Widget _buildRecommendation(var data, index) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/detail_item',
          arguments: {'data': data, 'image': recommended[index]['image']}),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Container(
          padding: EdgeInsets.all(8),
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
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(recommended[index]['image']),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: size.width * 0.5,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.name,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, bottom: 8.0),
                                    child: Text(
                                      data.description,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Text(
                                    'Rp. ${data.price}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Roboto',
                                        color: mainGreen,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      BlocListener<AddFavCubit, AddFavState>(
                                        listener: (context, state){
                                          if (state is AddItemFav) {
                                            print('state success : ${state.message}');
                                            flushBar(context, state.message);
                                          } else if (state is ActionIsError) {
                                            print('state error : ${state.message}');
                                            flushBar(context, state.message);
                                          }
                                        },
                                        child: InkWell(
                                          onTap: () => onTapAddFav('${data.id}'),
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: mainGreen,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: Colors.black38,
                                                    blurRadius: 2.0,
                                                  ),
                                                ]),
                                            child: Center(
                                              child: Icon(
                                                Icons.favorite,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      _buildAddCart(data.id),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
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
      height: 170,
      width: 120,
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(assets)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  Widget _buildAddCart(var id) {
    return InkWell(
      onTap: () => onAddCart('$id'),
      child: Container(
        padding: EdgeInsets.all(5),
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
      ),
    );
  }
}
