import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'favourite_view_model.dart';

class FavouriteScreen extends StatefulWidget{
  @override
  FavouriteView createState()=>FavouriteView();
}

class FavouriteView extends FavouriteViewModel{
  var size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favourite"),
      ),
      body: Container(
        color:Colors.white,
        child: _buildListFavourite(),
      ),
    );
  }
  Widget _buildListFavourite(){
    return ListView.builder(
        itemCount: list_favourite.length,
        itemBuilder: (context,index){
          return _buildRowCart(list_favourite[index]);
        });
  }

  Widget _buildBottom(){
    return Container(
      padding: EdgeInsets.all(7),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.delete_outline,size: 16,color: Colors.white,),
            SizedBox(width: 3,),
            Text("Remove",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat',fontSize: 13,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      width:100,
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
                    _buildBottom(),
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

}