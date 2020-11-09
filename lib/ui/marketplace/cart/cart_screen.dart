import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanamind/ui/marketplace/cart/cart_view_model.dart';

class CartScreen extends StatefulWidget{
  @override
  CartView createState()=>CartView();
}


class CartView extends CartViewModel{
  var size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang Belanja"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 10,),
                  Container(
                    padding:EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("My shopping cart",style: TextStyle(fontFamily: 'Montserrat',fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("5 products",style: TextStyle(fontFamily: 'Montserrat',fontSize: 14,color: Colors.grey),)
                      ],
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

    // TODO: implement build
  }

  Widget _buildTotal(){
    return Container(
      padding: EdgeInsets.all(17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total",style: TextStyle(fontSize: 16,color: Colors.green,fontFamily: 'Montserrat',fontWeight: FontWeight.bold),),
              SizedBox(
                height: 5,
              ),
              Text("Rp. 350.000",style: TextStyle(color: Colors.black,fontFamily: 'Montserrat',fontWeight: FontWeight.bold),),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: Text("Confirm",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat',fontWeight: FontWeight.bold),),
            ),
          )
        ],
      ),
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
          topLeft: Radius.circular(10)
        )
      ),
    );
  }

  Widget _buildListCart(){
    return ListView.builder(
         shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),
        itemCount: list_carts.length,
        itemBuilder: (context,index){
          return _buildRowCart(list_carts[index]);
        });
  }

  Widget _buildRowCart(var data){
    return Container(
      margin: EdgeInsets.all(10),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildImage(data["image"]),
          SizedBox(width: 8,),
          Container(
            width: size.width*0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data["name"],style: TextStyle(fontFamily: 'Montserrat',fontSize: 15,fontWeight: FontWeight.bold),),
                    Icon(Icons.cancel,color: Colors.green,),

                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(data["description"],style: TextStyle(fontFamily: 'Montserrat',fontSize: 13,color: Colors.grey),),
                SizedBox(height: 3,),
                Text(data["price"],style: TextStyle(fontSize: 13,fontFamily: 'Roboto',color: Colors.green,fontWeight: FontWeight.bold),),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildBottom(data["qty"]),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImage(String assets){
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(assets)
          ),
          borderRadius: BorderRadius.all(
               Radius.circular(10),
          )
      ),
    );
  }

  Widget _buildBottom(String qty){
    return Container(
      padding: EdgeInsets.all(7),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.add,size: 16,color: Colors.white,),
            Text(qty,style: TextStyle(color: Colors.white,fontFamily: 'Montserrat',fontSize: 13,fontWeight: FontWeight.bold),),
            Icon(Icons.remove,size: 16,color: Colors.white,),
          ],
        ),
      ),
      width: 70,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ]
      ),
    );
  }

}