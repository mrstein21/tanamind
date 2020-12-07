import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanamind/ui/list_plan/list_plant_view_model.dart';

class ListPlantScreen extends StatefulWidget {
  @override
  ListPlantView createState() => ListPlantView();
}

class ListPlantView extends ListPlantViewModel {
  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            _buildTips(),
            SizedBox(
              height: 12,
            ),
            _buildListPlants(list_plant),
          ],
        ),
      ),
    );
  }

  Widget _buildTips() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: _buildImage("assets/tips.jpg", 80, 80),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tips memulai hidroponik",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: "Roboto"),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "5 tips memulai hidroponik untuk pemula",
                  style: TextStyle(fontFamily: "Montserrat"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListPlants(var list) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (ctx, index) {
        return _buildRowPlants(list, index);
      },
    );
  }

  Widget _buildRowPlants(var list, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 16, right: 16),
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              new BoxShadow(
                color: Colors.black38,
                blurRadius: 2.0,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: _buildImage(list[index]["image"], 80, 80),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[index]["name"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto",
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            list[index]["type"],
                            style:
                                TextStyle(fontFamily: "Montserrat", fontSize: 15),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          DotsIndicator(
                            dotsCount: 1,
                            position: 0,
                            decorator: DotsDecorator(
                              activeSize: const Size(8.0, 8.0),
                              activeColor: Colors.grey,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            list[index]["task_count"] + " Tasks",
                            style:
                                TextStyle(fontFamily: "Montserrat", fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Divider(),
            SizedBox(
              height: 3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: list[index]["task_detail"].map<Widget>((e) {
                return CheckboxListTile(
                  title: Text(
                    e,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                  selected: false,
                  value: false,
                );
              }).toList(),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              list[index]["note"],
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String assets, double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(assets)),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ]),
    );
  }
}
