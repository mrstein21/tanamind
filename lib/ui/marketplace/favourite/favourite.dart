import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tanamind/cubit/favourite/add_delete_cubit.dart';
import 'package:tanamind/cubit/favourite/add_delete_item_favourite_state.dart';
import 'package:tanamind/cubit/favourite/favourite_cubit.dart';
import 'package:tanamind/cubit/favourite/favourite_state.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/model/favourite_model/favourite_model.dart';
import 'favourite_view_model.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  FavouriteView createState() => FavouriteView();
}

class FavouriteView extends FavouriteViewModel {
  var size;
  FavouriteCubit cubit;
  final delete = FavoriteActionCubit();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    cubit = BlocProvider.of<FavouriteCubit>(context);
    cubit.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: mainGreen,
        title: Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () => Navigator.pushNamed(context, '/home')),
            Text("My Favourite"),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocListener<FavouriteCubit, FavouriteState>(
          listener: (_, state) {
            if (state is FavDeleted) {
              final snackBar = SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text('${state.message}'));
              scaffoldKey.currentState.showSnackBar(snackBar);
              return _buildListFavourite();
            } else if (state is FavouriteIsError) {
              final snackBar = SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text('${state.message}'));
              scaffoldKey.currentState.showSnackBar(snackBar);
            }
          },
          child: _buildListFavourite()),
    );
  }

  Widget _buildListFavourite() {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is FavouriteIsLoading) {
          return _buildLoading();
        } else if (state is FavouriteIsLoaded) {
          return ListView.builder(
            itemCount: state.list.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _buildRowCart(state.list[index], index);
            },
          );
        } else if (state is FavouriteIsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.refresh, color: mainGreen, size: 30,), onPressed: ()=> cubit.getData()),
                Text('Internal Server Error...'),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildLoading() {
    return ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 130,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  height: 130,
                  width: double.infinity,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                ),
              ),
            ),
          );
        });
  }

  Widget _buildRowCart(FavouriteModel data, int index) {
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
              _buildImage(list_favourite[index]["image"]),
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
                            data.detailModel.name,
                            style: fontMonsserat(
                                16.0, FontWeight.w600, Colors.black),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            data.detailModel.description,
                            style: GoogleFonts.montserrat(
                                fontSize: 14.0,
                                color: Colors.grey,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            data.detailModel.price,
                            style: fontRoboto(14.0, FontWeight.bold, mainGreen),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.delete('${data.id}');
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
    );
  }
}
