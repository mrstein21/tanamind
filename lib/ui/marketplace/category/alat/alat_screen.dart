import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/ui/marketplace/category/alat/alat_view_model.dart';

class AlatScreen extends StatefulWidget {
  @override
  AlatViewScreen createState() => AlatViewScreen();
}

class AlatViewScreen extends AlatViewModel {
  var size;
  int radioValue;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: _buildHeader(),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            /*_buildHeader(),*/
            _buildFilter(),
            _buildCategory(),
            SizedBox(
              height: 10,
            ),
            _buildListItem()
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: mainGreen,
              ),
              onPressed: () => Navigator.pop(context)),
        ),
        Expanded(
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
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                  hintText: "Cari Pot",
                  hintStyle: TextStyle(color: Colors.black26),
                  border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilter() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: __showBottomSheetSort,
              child: Row(
                children: [
                  Icon(
                    Icons.import_export,
                    color: Colors.black54,
                  ),
                  Text(
                    'sort',
                    style: fontRoboto(14.0, FontWeight.w500, Colors.black54),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: __showBottomSheetFilter,
              child: Row(
                children: [
                  Icon(
                    Icons.filter_list,
                    color: Colors.black54,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      'filter',
                      style: fontRoboto(14.0, FontWeight.w500, Colors.black54),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
          height: 40,
          child: ListView.builder(
              itemCount: listCategories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildCardCategory(listCategories[index]);
              })),
    );
  }

  Widget _buildCardCategory(var data) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              new BoxShadow(
                color: Colors.black45.withOpacity(0.1),
                spreadRadius: 2.0,
                blurRadius: 2.0,
                offset: Offset(0, 2),
              )
            ]),
        child: Text(
          data['name'],
          style: fontMonsserat(12.0, FontWeight.w400, Colors.black),
        ),
      ),
    );
  }

  Widget _buildListItem() {
    return new StaggeredGridView.countBuilder(
      itemCount: listAlat.length,
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 4,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      itemBuilder: (context, index) => _buildCardItem(listAlat[index]),
      staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
    );
  }

  Widget _buildCardItem(data) {
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
                        image: AssetImage(data['image']), fit: BoxFit.cover),
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
                        data['title'],
                        style:
                            fontRoboto(14.0, FontWeight.w500, Colors.black54),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SmoothStarRating(
                              isReadOnly: true,
                              size: 20,
                              rating: data['rate'],
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '(${data['rating']})',
                              style: fontMonsserat(
                                  12.0, FontWeight.w500, Colors.black54),
                            )
                          ],
                        ),
                      ),
                      Text(
                        data['price'],
                        style: fontRoboto(14.0, FontWeight.w600, mainGreen),
                      )
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
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
          ],
        ),
      ),
    );
  }

  void __showBottomSheetSort() async {
    var filter;
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter state) {
            return new Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            'Newest',
                          ),
                          new Radio(
                            value: 0,
                            groupValue: radioValue,
                            onChanged: (value) {
                              state(() {
                                radioValue = value;
                                filter = 'Diskon';
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            'Min Price',
                          ),
                          new Radio(
                            value: 3,
                            groupValue: radioValue,
                            onChanged: (value) {
                              state(() {
                                radioValue = value;
                                filter = 'Sale';
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            'Max Price',
                          ),
                          new Radio(
                            value: 4,
                            groupValue: radioValue,
                            onChanged: (value) {
                              state(() {
                                radioValue = value;
                                filter = 'Sale';
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black26,
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {});
                      Navigator.pop(context, false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                            color: mainGreen,
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          'OK',
                          style:
                              fontRoboto(14.0, FontWeight.w500, Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        });
  }

  void __showBottomSheetFilter() async {
    var filter;
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter state) {
                return new Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                      )),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Text(
                                'Newest',
                              ),
                              new Radio(
                                value: 0,
                                groupValue: radioValue,
                                onChanged: (value) {
                                  state(() {
                                    radioValue = value;
                                    filter = 'Diskon';
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black26,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Text(
                                'Promo',
                              ),
                              new Radio(
                                value: 1,
                                groupValue: radioValue,
                                onChanged: (value) {
                                  state(() {
                                    radioValue = value;
                                    filter = 'Promo';
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black26,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Text(
                                'Sale',
                              ),
                              new Radio(
                                value: 2,
                                groupValue: radioValue,
                                onChanged: (value) {
                                  state(() {
                                    radioValue = value;
                                    filter = 'Sale';
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black26,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Text(
                                'Min Price',
                              ),
                              new Radio(
                                value: 3,
                                groupValue: radioValue,
                                onChanged: (value) {
                                  state(() {
                                    radioValue = value;
                                    filter = 'Sale';
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black26,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Text(
                                'Max Price',
                              ),
                              new Radio(
                                value: 4,
                                groupValue: radioValue,
                                onChanged: (value) {
                                  state(() {
                                    radioValue = value;
                                    filter = 'Sale';
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black26,
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {});
                          Navigator.pop(context, false);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Container(
                            width: 100,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            decoration: BoxDecoration(
                                color: mainGreen,
                                borderRadius: BorderRadius.circular(6)),
                            child: Text(
                              'OK',
                              style:
                              fontRoboto(14.0, FontWeight.w500, Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
        });
  }
}
