import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:tanamind/ui/marketplace/home_marketplace/home_marketplace_view_model.dart';

class MarketPlaceView extends MarketPlaceViewModel{
  var size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            _buildSearch(),
            SizedBox(height: 2,),
            _buildListCategory(),
            SizedBox(height: 2,),
            Container(padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),child: Text("Promo Hari ini",style: TextStyle(fontFamily: 'Montserrat',fontSize: 18,fontWeight: FontWeight.bold),)),
            _buildListPromo(),
            SizedBox(height: 8,),
            Container(padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),child: Text("Rekomendasi",style: TextStyle(fontFamily: 'Montserrat',fontSize: 18,fontWeight: FontWeight.bold),)),
            _buildListRecommended(),
            SizedBox(height: 8,),
            Container(padding: EdgeInsets.all(10),child: Text("Produk yang mungkin kamu suka",style: TextStyle(fontFamily: 'Montserrat',fontSize: 18,fontWeight: FontWeight.bold),)),
            SizedBox(height: 2,),
            _buildListItem()
          ],
        ),
      ),
    );
  }

  _buildFavourite(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)
            )
          ),
          child: Icon(Icons.favorite,color: Colors.white,),
        ),
      ],
    );
  }

  Widget _buildSearch(){
    return Container(
      margin: EdgeInsets.only(top: 15,left: 10,right: 10),
      padding: EdgeInsets.all(1),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            hintText: "Cari barang disini.."
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: Colors.black38,
            blurRadius: 2.0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
    );
  }

  Widget _buildListItem(){
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: list_items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.6,
          crossAxisCount: 2,
        ),
        itemBuilder: (context,index){
          return _buildRowItems(list_items[index]);
        }
    );
  }

  Widget _buildRowItems(data){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, "/detail_item");
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(data["image"]),
            SizedBox(
              height: 4,
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data["name"],style: TextStyle(fontFamily: 'Montserrat',fontSize: 13),),
                  SizedBox(height: 3,),
                  Text(data["description"],style: TextStyle(fontFamily: 'Montserrat',fontSize: 13,color: Colors.grey),),
                  SizedBox(height: 3,),
                  Text(data["price"],style: TextStyle(fontSize: 13,fontFamily: 'Roboto',color: Colors.green,fontWeight: FontWeight.bold),),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     _buildAddCart()
                      // RaisedButton.icon(
                      //     color: Colors.green,
                      //     textColor: Colors.white,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.all(Radius.circular(10))
                      //     ),
                      //     onPressed: (){
                      //
                      //     }, icon: Icon(Icons.shopping_basket,size: 20,),
                      //     label: Text("Add to cart",style: TextStyle(color: Colors.white,fontFamily: "Montserrat",fontSize: 12),))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ]
        ),
      ),
    );
  }

  Widget _buildListRecommended(){
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommended.length,
          itemBuilder: (context,index){
          return _buildRowRecommended(recommended[index]);
      }),
    );
  }

  Widget _buildRowRecommended(var data){
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage2(data["image"]),
          SizedBox(width: 8,),
          Container(
            width: size.width*0.6,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex:2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data["name"],style: TextStyle(fontFamily: 'Montserrat',fontSize: 15,fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: 8,
                          ),
                          Text(data["description"],style: TextStyle(fontFamily: 'Montserrat',fontSize: 13,color: Colors.grey),),
                          SizedBox(height: 8,),
                          Text(data["price"],style: TextStyle(fontSize: 15,fontFamily: 'Roboto',color: Colors.green,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child:Center(child: Icon(Icons.favorite,color: Colors.white,size: 20,),),
                                padding: EdgeInsets.all(5),
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
                              ),
                              _buildAddCart(),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListPromo(){
    return Container(
      height: 140,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: promo.length,
          itemBuilder: (ctx,index){
            print("assets "+promo[index]);
            return _buildPromo(promo[index]);
          }
      ),
    );
  }

  Widget _buildAddCart(){
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.shopping_basket,size: 20,color: Colors.white,),
          SizedBox(width: 3,),
          Text("Add To Cart",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat',fontSize: 12,fontWeight: FontWeight.bold),)
        ],
      ),
      height: 30,
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

  Widget _buildImage(String assets){
    return Container(
      child: _buildFavourite(),
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(assets)
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        )
      ),
    );
  }

  Widget _buildImage2(String assets){
    return Container(
      height: 170,
      width: 120,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(assets)
          ),
          borderRadius: BorderRadius.all(
               Radius.circular(10)
          )
      ),
    );
  }

  Widget _buildPromo(String assets){
    return Container(

      margin: EdgeInsets.all(10),
      width: 220,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ],
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

  Widget _buildListCategory(){
   return Container(
     height: 90,
     child: ListView.builder(
         itemCount: category.length,
         scrollDirection: Axis.horizontal,
         itemBuilder: (context,index){
           return _buildRowCategory(category[index]);
         }
     ),
   );
  }

  Widget _buildRowCategory(var data){
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Container(
             padding: EdgeInsets.all(10),
             decoration: BoxDecoration(
               color: Colors.white,
               shape: BoxShape.circle,
               boxShadow: [
                 new BoxShadow(
                   color: Colors.black38,
                   blurRadius: 2.0,
                 ),
               ]
             ),
             child: Center(
               child: Icon(data["icon"],color: Colors.grey,),
             ),
           ),
          SizedBox(
            height: 5,
          ),
          Container(
            child:Text(data["name"],style: TextStyle(color: Colors.black,fontFamily: 'Montserrat',fontSize: 12,),)
            ,
          ),
        ],
      ),
    );
  }

}