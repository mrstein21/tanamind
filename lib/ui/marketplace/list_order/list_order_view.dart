import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'list_order_view_model.dart';

class ListOrderView extends ListOrderViewModel{
  var size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
        title: Text("Daftar Pesanan"),
    ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: list_order.length,
            itemBuilder: (context,index){
           return _buildRowOrder(list_order[index]);
        }),
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

  Widget _buildRowOrder(var data){
    return Container(
      height: 180,
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
            width: size.width*0.5,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data["order_id"],style: TextStyle(fontFamily: 'Montserrat',fontSize: 15,fontWeight: FontWeight.bold),),
                              Text(data["date"],style: TextStyle(fontFamily: 'Montserrat',fontSize: 13,color: Colors.grey),),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(data["name"],style: TextStyle(fontFamily: 'Montserrat',fontSize: 13,),),
                          SizedBox(
                            height: 8,
                          ),
                          Text(data["price"]+" (${data['qty']})",style: TextStyle(fontSize: 15,fontFamily: 'Roboto',color: Colors.green,fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Total : "+data["total"],style: TextStyle(fontSize: 15,fontFamily: 'Roboto',color: Colors.black,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child:Center(child: Text("Completed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
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

}