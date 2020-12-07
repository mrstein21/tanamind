import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/ui/marketplace/cart/cart_view_model.dart';

class CartScreen extends StatefulWidget {
  @override
  CartView createState() => CartView();
}

class CartView extends CartViewModel {
  var size;
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainGreen,
        title: Text("Keranjang Belanja"),
      ),
      body: Container(
        color: Colors.white,
        child: list_carts.isEmpty
            ? Center(
                child: Text(
                  'Cart is empty...',
                  style: fontRoboto(19.0, FontWeight.bold, mainGreen),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "My shopping cart",
                                  style: fontMonsserat(
                                      16, FontWeight.bold, Colors.black),
                                ),
                                Text(
                                  "${list_carts.length} products",
                                  style: fontMonsserat(
                                      14, FontWeight.w500, Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        _buildListCart()
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
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: list_carts.length,
          itemBuilder: (context, index) {
            return _buildCard(list_carts, index);
          }),
    );
  }

  Widget _buildCard(var data, int index) {
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
              _buildImage(data[index]["image"]),
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
                          data[index]["name"],
                          style: fontMonsserat(
                              15.0, FontWeight.bold, Colors.black),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          data[index]["description"],
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          data[index]["price"],
                          style: fontRoboto(15.0, FontWeight.bold, mainGreen),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                data.removeAt(index);
                              });
                            }),
                        _buildQtyBtn(data[index]['qty']),
                      ],
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
              setState(() {
                if (_qty > 1) {
                  _qty--;
                }
              });
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
              setState(() {
                _qty++;
              });
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
              Text(
                "Rp. 350.000",
                style: fontMonsserat(14, FontWeight.bold, mainGreen),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: mainGreen,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: Text("Confirm",
                  style: fontMonsserat(14, FontWeight.bold, Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
