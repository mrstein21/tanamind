import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tanamind/cubit/favourite/add_delete_cubit.dart';
import 'package:tanamind/cubit/favourite/add_delete_item_favourite_state.dart';
import 'package:tanamind/cubit/marketplace/category/category_item/category_item_cubit.dart';
import 'package:tanamind/cubit/marketplace/category/category_item/category_item_state.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/model/marketplace_model/category_item_model.dart';
import 'package:tanamind/ui/marketplace/category/alat/list_item_view_model.dart';

class ListItem extends StatefulWidget {
  final id;

  const ListItem({Key key, this.id}) : super(key: key);

  @override
  ListItemViewScreen createState() => ListItemViewScreen();
}

class ListItemViewScreen extends ListItemViewModel {
  var size;
  int page = 10;
  bool initialWhen;
  final cubit = CategoryItemCubit();

  @override
  void initState() {
    cubit.getData('${widget.id}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    fav = BlocProvider.of<FavoriteActionCubit>(context);

    return NotificationListener<ScrollNotification>(
      // ignore: missing_return
      onNotification: (notification) {
        if (notification is ScrollStartNotification) {
        } else if (notification is ScrollEndNotification) {}
      },
      child: BlocProvider(
        create: (context) => cubit,
        child: BlocListener<FavoriteActionCubit, FavoriteActionState>(
          listener: (context, state) {
            if (state is AddItemFav) {
              print('state success : ${state.message}');
              final snackBar = SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text('${state.message}'));
              Scaffold.of(context).showSnackBar(snackBar);
            } else if (state is ActionIsError) {
              print('state error : ${state.message}');
              final snackBar = SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text('${state.message}'));
              Scaffold.of(context).showSnackBar(snackBar);
            }
          },
          child: BlocBuilder<CategoryItemCubit, CategoryItemState>(
            // ignore: missing_return
            builder: (context, state) {
              if (state is ItemsIsLoading) {
                return _buildLoading(size);
              } else if (state is ItemsIsLoaded) {
                if (state.list == 'null') {
                  return Center(
                    child: Text('Empty'),
                  );
                } else {
                  return new StaggeredGridView.countBuilder(
                    itemCount: state.list.length,
                    primary: false,
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    itemBuilder: (context, index) =>
                        _buildCardItem(state.list[index], index),
                    staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
                  );
                }
              } else if (state is ItemsIsError) {
                print("error state : ${state.message}");
                return Center(
                  child: Text('Connection problem...'),
                );
              }
            },
          ),
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
      ),
    );
  }

  Widget _buildCardItem(CategoryItem data, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('${dummyImage[index]['image']}'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style:
                            fontRoboto(14.0, FontWeight.w500, Colors.black54),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
                        child: Text(
                          data.description,
                          style: GoogleFonts.roboto(
                              fontSize: 14.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SmoothStarRating(
                              isReadOnly: true,
                              size: 20,
                              rating: 0,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              /*'(${data['rating']})',*/
                              '0',
                              style: fontMonsserat(
                                  12.0, FontWeight.w500, Colors.black54),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'Rp. ${data.price}',
                        style: fontRoboto(14.0, FontWeight.w600, mainGreen),
                      )
                    ],
                  ),
                )
              ],
            ),
            _buildFavIcon(data.id)
          ],
        ),
      ),
    );
  }

  Widget _buildFavIcon(final id) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () => onTapButtonFav(id),
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          child: Icon(
            Icons.favorite,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
