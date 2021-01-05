import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tanamind/TesSearch.dart';
import 'package:tanamind/cubit/marketplace/cart/cart_cubit.dart';
import 'package:tanamind/cubit/marketplace/cart/cart_state.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/model/hive_model/hive_cart_model.dart';
import 'package:tanamind/model/marketplace_model/cart_model.dart';
import 'package:tanamind/repository/marketplace/cart_repository.dart';
import 'package:tanamind/ui/marketplace/cart/cart_view_model.dart';
import 'package:hive/hive.dart';
import 'package:tanamind/ui/widget/widget_helper.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class CartScreen extends StatefulWidget {
  @override
  CartView createState() => CartView();
}

class CartView extends CartViewModel {
  var size;
  int _qty = 10;
  CartCubit cubit;
  List<CartModel> listTotal = new List();
  var model = new List();
  int total;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _cooldownStarted = DateTime.now().millisecondsSinceEpoch;
  double _cooldown = 0;
  int kCoolDown = 1000;

  @override
  void initState() {
    cubit = BlocProvider.of<CartCubit>(context);
    cubit.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: mainGreen,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, '/home'),
                child: Container(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            Text(
              "Cart",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My shopping cart",
                            style: fontMonsserat(
                                16, FontWeight.bold, Colors.black),
                          ),
                          BlocBuilder<CartCubit, CartState>(
                              // ignore: missing_return
                              builder: (context, state) {
                            if (state is CartIsLoading) {
                              return Container();
                            } else if (state is CartIsLoaded) {
                              return Text(
                                "${state.data.length} products",
                                style: fontMonsserat(
                                    14, FontWeight.w500, Colors.black),
                              );
                            } else if (state is CartIsError) {
                              return Text(
                                "0 products",
                                style: fontMonsserat(
                                    14, FontWeight.w500, Colors.black),
                              );
                            }
                          })
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  _buildListCart()
                  /*_loadData()*/
                ],
              ),
            ),
            _buildTotal()
          ],
        ),
      ),
    );
  }

  Widget _buildListCart() {
    return BlocBuilder<CartCubit, CartState>(
        // ignore: missing_return
        builder: (context, state) {
      if (state is CartIsLoading) {
        return _buildLoading();
      } else if (state is CartIsLoaded) {
        if (state.data.isEmpty) {
          return _buildEmpty();
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return _buildCard(state.data[index], index);
                }),
          );
        }
      } else if (state is CartIsError) {
        return buildError('Internal Server Error...');
      }
    });
  }

  Widget _buildLoading() {
    return ListView.builder(
      itemCount: 3,
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
      },
    );
  }

  Widget _buildEmpty() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icon/ic_empty_plant.png'),
          SizedBox(
            height: 16.0,
          ),
          Text(
            'Cart is empty',
            style: fontRoboto(16.0, FontWeight.w500, Colors.black),
          )
        ],
      ),
    );
  }

  Widget _buildCard(CartModel data, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(list_carts[index]["image"]),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.cartDetail.name,
                          style: fontMonsserat(
                              15.0, FontWeight.bold, Colors.black),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          data.cartDetail.description,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Rp. ${data.cartDetail.price}',
                          style: fontRoboto(15.0, FontWeight.bold, mainGreen),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                    BlocListener<CartCubit, CartState>(
                      listener: (context, state) {
                        if (state is CartIsDeleted) {
                          flushBar(context, state.message);
                          cubit.getData();
                          return Container();
                        } else if (state is CartIsError) {
                          flushBar(context, state.message);
                          return Container();
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.grey,
                              ),
                              onPressed: () =>
                                  cubit.deleteItemCart(data.cartId)),
                          /*_buildQtyBtn(data.cartDetail.qty),*/
                          _buildBtnQty()
                        ],
                      ),
                    )
                  ],
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
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
    );
  }

  void _startCooldownIndicator(int time_ms) {
    _cooldownStarted = DateTime.now().millisecondsSinceEpoch;
    _updateCooldown(time_ms);
  }

  void _updateCooldown(int time_ms) {
    final int current = DateTime.now().millisecondsSinceEpoch;
    int delta = current - _cooldownStarted;
    if (delta > time_ms) {
      delta = time_ms;
    }

    setState(() {
      _cooldown = delta.roundToDouble() / time_ms;
    });

    Future<void>(() {
      if (delta < time_ms) {
        _updateCooldown(time_ms);
      } else {
        setState(() {
          _cooldown = 0.0;
        });
      }
    });
  }

  Widget _buildBtnQty() {
    return Row(
      children: [
        TapDebouncer(
          cooldown: Duration(milliseconds: kCoolDown),
          onTap: () async {
            _startCooldownIndicator(kCoolDown);
            setState(() {
              if (_qty > 1) {
                _qty--;
              }
            });
          },
          waitBuilder: (BuildContext context, Widget child){
            return Stack(
              children: [
                child,
                IconButton(
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.grey,
                      size: 30,
                    ),)
              ],
            );
          },
          builder: (BuildContext context, TapDebouncerFunc onTap) {
            return IconButton(
                icon: Icon(
                  Icons.remove_circle,
                  color: _qty == 1 ? Colors.grey : mainGreen,
                  size: 30,
                ),
                onPressed: onTap);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: mainGreen))),
            child: Text(
              '$_qty',
              style: fontRoboto(16.0, FontWeight.w500, mainGreen),
            ),
          ),
        ),
        TapDebouncer(
          cooldown: Duration(milliseconds: kCoolDown),
          onTap: () async {
            _startCooldownIndicator(kCoolDown);
            setState(() {
              _qty ++;
            });
          },
          waitBuilder: (BuildContext context, Widget child){
            return Stack(
              children: [
                child,
                IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.grey,
                    size: 30,
                  ),)
              ],
            );
          },
          builder: (BuildContext context, TapDebouncerFunc onTap) {
            return IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: mainGreen,
                  size: 30,
                ),
                onPressed: onTap);
          },
        ),
      ],
    );
  }

  Widget _buildQtyBtn(int qty) {
    return Row(
      children: [
        IconButton(
            icon: Icon(
              Icons.remove_circle,
              color: _qty == 1 ? Colors.grey : mainGreen,
              size: 30,
            ),
            onPressed: () {
              if (_qty > 1) {
                _qty--;
              }
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: mainGreen))),
            child: Text(
              '$_qty',
              style: fontRoboto(16.0, FontWeight.w500, mainGreen),
            ),
          ),
        ),
        IconButton(
            icon: Icon(Icons.add_circle, color: mainGreen, size: 30),
            onPressed: () {
              _qty++;
            }),
      ],
    );
  }

  Widget _buildTotal() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: Colors.black38,
            blurRadius: 2.0,
          ),
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total",
                style: fontMonsserat(16, FontWeight.bold, mainGreen),
              ),
              SizedBox(
                height: 5,
              ),
              BlocBuilder<CartCubit, CartState>(
                  // ignore: missing_return
                  builder: (context, state) {
                if (state is CartIsLoading) {
                  return Container();
                } else if (state is CartIsLoaded) {
                  total = 0;
                  listTotal = state.data;
                  for (int i = 0; i < listTotal.length; i++) {
                    total = total + int.parse(listTotal[i].cartDetail.price);
                  }
                  return Text(
                    "Rp. $total",
                    style: fontMonsserat(14, FontWeight.bold, mainGreen),
                  );
                } else if (state is CartIsError) {
                  return Text(
                    "Rp. 0",
                    style: fontMonsserat(14, FontWeight.bold, mainGreen),
                  );
                }
              }),
            ],
          ),
          // ignore: missing_return
          BlocBuilder<CartCubit, CartState>(builder: (context, state) {
            if (state is CartIsLoaded) {
              if (state.data.isNotEmpty) {
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: mainGreen,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text("Confirm",
                        style:
                            fontMonsserat(14, FontWeight.bold, Colors.white)),
                  ),
                );
              } else {
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text("Confirm",
                        style:
                            fontMonsserat(14, FontWeight.bold, Colors.white)),
                  ),
                );
              }
            } else {
              return Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: Text("Confirm",
                      style: fontMonsserat(14, FontWeight.bold, Colors.white)),
                ),
              );
            }
          })
        ],
      ),
    );
  }
}
