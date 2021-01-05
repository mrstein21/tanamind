import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tanamind/cubit/favourite/add_fav_cubit.dart';
import 'package:tanamind/cubit/favourite/add_fav_state.dart';
import 'package:tanamind/cubit/marketplace/category/category_item/category_item_cubit.dart';
import 'package:tanamind/cubit/marketplace/category/category_item/category_item_state.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/ui/marketplace/category/category_view_model.dart';
import 'package:tanamind/ui/marketplace/category/list_item.dart';
import 'package:tanamind/ui/widget/widget_helper.dart';

class CategoryScreen extends StatefulWidget {
  final idCategory;

  const CategoryScreen({Key key, this.idCategory}) : super(key: key);

  @override
  CategoryViewScreen createState() => CategoryViewScreen();
}

class CategoryViewScreen extends CategoryViewModel {
  var size;
  var idCategory;
  CategoryItemCubit cubit;
  AddFavCubit fav;
  int page = 1;
  var list;

  TextEditingController _search = new TextEditingController();
  ScrollController _scrollController = ScrollController();

  scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      page++;
      cubit.onLoadMore(list, page, '${widget.idCategory}');
    }
  }

  @override
  void initState() {
    cubit = BlocProvider.of<CategoryItemCubit>(context);
    fav = BlocProvider.of<AddFavCubit>(context);
    cubit.getData(id: '${widget.idCategory}');
    _scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _search.clear();
    _search.dispose();
    super.dispose();
  }

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
          child: BlocListener<AddFavCubit, AddFavState>(
        listener: (context, state) {
          if (state is AddItemFav) {
            print('state success : ${state.message}');
            flushBar(context, state.message);
          } else if (state is ActionIsError) {
            print('state error : ${state.message}');
            flushBar(context, state.message);
          }
        },
        child: Column(
          children: [
            _buildFilter(),
            _buildCategory(),
            Expanded(child: _buildListItem())
          ],
        ),
      )),
    );
  }

  Widget _buildListItem() {
    return BlocBuilder<CategoryItemCubit, CategoryItemState>(
        // ignore: missing_return
        builder: (context, state) {
      if (state is ItemsIsLoading) {
        return _buildLoading();
      } else if (state is ItemsIsLoaded) {
        if (state.list.isEmpty) {
          return buildEmpty('Item yang anda cari tidak ditemukan...');
        } else {
          list = state.list;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListItem(
              list: state.list,
              controller: _scrollController,
            ),
          );
        }
      } else if (state is ItemsIsError) {
        return buildError('Internal Server Error...');
      }
    });
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

  Widget _buildSearch() {
    return Row(
      children: [
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
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.black26,
                ),
                Expanded(
                  child: TextField(
                    controller: _search,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                        hintText: "Cari Pot",
                        hintStyle: TextStyle(color: Colors.black26),
                        border: InputBorder.none),
                    onSubmitted: (value) {
                      print(value);
                      setState(() {
                        page = 1;
                        onSearchItem(
                            id: '${widget.idCategory}',
                            sort: sort,
                            filter: filter,
                            page: page,
                            key: _search.text);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
            onPressed: () => Navigator.pop(context),
          ),
        ),
        /*Expanded(
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
              controller: _search,
              onSubmitted: (value) {
                print(value);
                setState(() {
                  print(_search.text.length);
                  page = 1;
                  onSearchItem(
                      id: '${widget.idCategory}',
                      sort: sort,
                      filter: filter,
                      page: page,
                      key: _search.text);
                  _search.clear();
                });
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(8, 7, 0, 8),
                  hintText: "Cari Pot",
                  hintStyle: TextStyle(color: Colors.black26),
                  border: InputBorder.none),
            ),
          ),
        ),*/
        Expanded(child: _buildSearch()),
        BlocListener<AddFavCubit, AddFavState>(
          listener: (context, state) {
            if (state is AddItemFav) {
              setState(() {
                getFavLength();
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => onFavPageIcon(),
              child: Badge(
                badgeColor: Colors.white,
                animationType: BadgeAnimationType.fade,
                showBadge:
                    favLength != null ? favLength != 0 ? true : false : false,
                badgeContent: Text(
                  cartLength != null ? '$favLength' : '0',
                  style: TextStyle(fontSize: 12, color: mainGreen),
                ),
                toAnimate: true,
                child: Icon(
                  Icons.favorite,
                  color: mainGreen,
                  size: 30,
                ),
              ),
            ),
          ),
        )
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
    return listCategories.length != 0
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 40,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        radioFilter = null;
                        radioSort = null;
                        listCategories.clear();
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.all(4),
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
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                        )),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Row(
                    children: listCategories
                        .map((e) => _buildCardCategory(e))
                        .toList(),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }

  Widget _buildCardCategory(var data) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
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
          data,
          style: fontMonsserat(12.0, FontWeight.w400, Colors.black),
        ),
      ),
    );
  }

  void __showBottomSheetSort() async {
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
                      children: <Widget>[
                        new Text(
                          'Min Price',
                        ),
                        new Radio(
                          value: 1,
                          groupValue: radioSort,
                          onChanged: (value) {
                            state(() {
                              radioSort = null;
                              radioSort = value;
                              sort = 'asc';
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
                          value: 2,
                          groupValue: radioSort,
                          onChanged: (value) {
                            state(() {
                              radioSort = value;
                              sort = 'desc';
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
                    /*onTapButton(id: idCategory, page: 1, sort: sort);*/
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
                        style: fontRoboto(14.0, FontWeight.w500, Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }

  void __showBottomSheetFilter() async {
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
                          'Best seller',
                        ),
                        new Radio(
                          value: 0,
                          groupValue: radioFilter,
                          onChanged: (value) {
                            state(() {
                              radioFilter = value;
                              filter = 'is_bestseller';
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
                          groupValue: radioFilter,
                          onChanged: (value) {
                            state(() {
                              radioFilter = value;
                              filter = 'is_promo';
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      filterCategories(filter, '');
                    });
                    /*onTapButton(id: idCategory, page: 1, filter: filter);*/
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
                        style: fontRoboto(14.0, FontWeight.w500, Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }
}
