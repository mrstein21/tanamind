import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/helper/style.dart';
import 'list_order_view_model.dart';

class ListOrderScreen extends StatefulWidget {
  @override
  ListOrderView createState() => ListOrderView();
}

class ListOrderView extends ListOrderViewModel {
  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainGreen,
        title: Text("Daftar Pesanan"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: list_order.length,
            itemBuilder: (context, index) {
              return _buildCard(list_order[index]);
            }),
      ),
    );
  }

  Widget _buildCard(var data) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
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
            children: [
              _buildImage2(data["image"]),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data["order_id"],
                                style: fontRoboto(
                                    16.0, FontWeight.w600, Colors.black),
                              ),
                              Text(
                                data["date"],
                                style: fontRoboto(
                                    14.0, FontWeight.w500, Colors.black26),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(data["name"],
                              style: fontMonsserat(
                                  14.0, FontWeight.w500, Colors.black54)),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            data["price"] + " (${data['qty']})",
                            style: fontRoboto(14.0, FontWeight.w600, mainGreen),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Total : " + data["total"],
                            style:
                                fontRoboto(16.0, FontWeight.w600, Colors.black),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                            color: mainGreen,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.black38,
                                blurRadius: 2.0,
                              ),
                            ]),
                        child: Text(
                          'Completed',
                          style:
                              fontRoboto(14.0, FontWeight.w500, Colors.white),
                        ),
                      ) //footer row
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage2(String assets) {
    return Container(
      height: 170,
      width: 120,
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(assets)),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
