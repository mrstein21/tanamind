import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tanamind/cubit/kelola/plant_category_cubit.dart';
import 'package:tanamind/cubit/kelola/plant_category_state.dart';
import 'package:tanamind/cubit/marketplace/cart/cart_cubit.dart';
import 'package:hive/hive.dart';
import 'package:tanamind/cubit/marketplace/cart/cart_state.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/model/hive_model/hive_cart_model.dart';
import 'package:tanamind/model/kelola_model/plant_category_model.dart';
import 'package:tanamind/ui/widget/widget_helper.dart';

class TesCubit extends StatefulWidget {
  @override
  _TesCubitState createState() => _TesCubitState();
}

class _TesCubitState extends State<TesCubit> {
  CartCubit cubit;
  int _qty = 1;

  @override
  void initState() {
    cubit = BlocProvider.of<CartCubit>(context);
    cubit.getHive();
    getHiveBox();
    super.initState();
  }

  Future<void> getHiveBox() async {
     Hive.openBox('cartmodel');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                var cart = Hive.box('cartmodel');
                cart.clear();
                print("cart lengt : ${cart.length}");
              }),
          IconButton(
              icon: Icon(Icons.refresh), onPressed: () => cubit.getHive())
        ],
      ),
      body: ListView(
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
          BlocBuilder<CartCubit, CartState>(
              // ignore: missing_return
              builder: (context, state) {
            if (state is CartIsLoading) {
              return _buildLoading();
            } else if (state is CartIsLoaded) {
              print('cart ${state.data}');
              var cart = Hive.box('cartmodel');
              if(cart.isEmpty){
                return _buildEmpty();
              }else{
                /*return WatchBoxBuilder(
                    box: cart,
                    builder: (context, index){
                      return ListView.builder(
                          itemCount: cart.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index){
                            HiveCartModel model = cart.getAt(index);
                            return _buildCard(model, index);
                          });
                    });*/
                return ListView.builder(
                    itemCount: cart.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      HiveCartModel model = cart.getAt(index);
                      return _buildCard(model, index);
                    });
              }
            } else if (state is CartIsError) {
              return Center(
                child: Text('Error...'),
              );
            }
          }),
        ],
      ),
    );
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

  Widget _buildCard(HiveCartModel data, int index) {
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
                          data.name,
                          style: fontMonsserat(
                              15.0, FontWeight.bold, Colors.black),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          data.description,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Rp. ${data.price}',
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
                          ///LIEUR ASU !!!
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                var cart = Hive.box('cartmodel');
                                cart.deleteAt(index);
                                cubit.deleteItemCart(data.itemId);

                              }),
                          _buildQtyBtn(data.qty),
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
             /* BlocBuilder<CartCubit, CartState>(
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
                  }),*/
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


var list_carts = [
  {
    "name": "Bibit Kangkung",
    "price": "Rp. 2.500",
    "qty": 1,
    "total": "Rp. 2.500",
    "description": "Short Description here...",
    "image": "assets/dummy/bibit_kangkung.jpg"
  },
  {
    "name": "Bibit Kantang",
    "price": "Rp. 10.000",
    "qty": 3,
    "total": "Rp. 30.000",
    "description": "Short and Long Description here...",
    "image": "assets/dummy/bibit_kentang.jpg"
  },
  {
    "name": "Pot Hidroponik",
    "price": "Rp. 325.000",
    "qty": 1,
    "total": "Rp. 325.000",
    "description": "Short Description here...",
    "image": "assets/dummy/hidroponik.jpg"
  },
  {
    "name": "Pompa Air Hiroponik",
    "price": "Rp. 100.000",
    "qty": 4,
    "total": "Rp. 400.000",
    "description": "Short Description here...",
    "image": "assets/dummy/pompa_air.jpg"
  },
  {
    "name": "Pot Bunga",
    "price": "Rp. 30.000",
    "qty": 3,
    "total": "Rp. 90.000",
    "description": "Short Description here...",
    "image": "assets/dummy/pot_bunga.jpg"
  }
];