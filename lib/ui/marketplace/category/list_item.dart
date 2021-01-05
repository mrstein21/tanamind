import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tanamind/cubit/favourite/add_fav_cubit.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/model/marketplace_model/category_item_model.dart';
import 'package:tanamind/ui/marketplace/category/list_item_view_model.dart';

class ListItem extends StatefulWidget {
  final list;
  final ScrollController controller;

  const ListItem({Key key, this.list, this.controller}) : super(key: key);

  @override
  ListItemViewScreen createState() => ListItemViewScreen();
}

class ListItemViewScreen extends ListItemViewModel {
  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    fav = BlocProvider.of<AddFavCubit>(context);

    return Scaffold(
      key: scaffoldKey,
      body: StaggeredGridView.countBuilder(
        controller: widget.controller,
        itemCount: widget.list.length,
        primary: false,
        shrinkWrap: true,
        crossAxisCount: 4,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        itemBuilder: (context, index) =>
            _buildCardItem(widget.list[index], index),
        staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
      ),
    );
  }

  Widget _buildCardItem(CategoryItem data, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail_item',
              arguments: {'data': data, 'image': dummyImage[index]['image']});
        },
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
