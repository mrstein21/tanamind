import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tanamind/cubit/favourite/add_fav_cubit.dart';
import 'package:tanamind/cubit/marketplace/similar_item/similar_item_cubit.dart';
import 'package:tanamind/cubit/marketplace/similar_item/similar_item_state.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/model/marketplace_model/similar_item_model.dart';
import 'package:tanamind/ui/marketplace/similar_item/similar_view_model.dart';

class SimilarScreen extends StatefulWidget {
  final idCategory;

  const SimilarScreen({Key key, this.idCategory}) : super(key: key);

  @override
  _SimilarViewScreen createState() => _SimilarViewScreen();
}

class _SimilarViewScreen extends SimilarViewModel {
  SimilarCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<SimilarCubit>(context);
    fav = BlocProvider.of<AddFavCubit>(context);
    cubit.getData('1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.38,
        child: BlocBuilder<SimilarCubit, SimilarState>(
          // ignore: missing_return
          builder: (context, state) {
            if (state is SimilarIsLoading) {
              return Container();
            } else if (state is SimilarIsLoaded) {
              if (state.list.isEmpty) {
                return Center(
                  child: Text('Tidak ada item serupa'),
                );
              } else {
                return ListView.builder(
                    itemCount: state.list.length = 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _buildSimilarCard(state.list[index], index);
                    });
              }
            } else if (state is SimilarIsError) {
              return Center(
                child: Text('Internal Server Error'),
              );
            }
          },
        ));
  }

  Widget _buildSimilarCard(SimilarModel data, index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/detail_item", arguments: {'data': data, 'image':listImage[index]['image']});
      },
      child: Container(
        width: 180,
        height: 150,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              new BoxShadow(
                color: Colors.black38,
                blurRadius: 2.0,
              ),
            ]),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildImage(listImage[index]['image']),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name,
                          style:
                              TextStyle(fontFamily: 'Montserrat', fontSize: 13),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          data.description,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13,
                              color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 7,
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
                  ),
                ),
              ],
            ),
            _buildFavIcon(data.id)
          ],
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 120,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Container(
                  height: 120,
                  width: double.infinity,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                ),
              ),
            ),
          );
        },
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

  Widget _buildImage(String assets) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(assets)),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }

  Widget _buildAddCart() {
    return Container(
      alignment: Alignment.center,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }
}
