import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/helper/constant.dart';
import 'package:tanamind/ui/marketplace/marketplace/marketplace_view_model.dart';

class ListRecommendation extends StatefulWidget {
  @override
  _buildListRecommendation createState() => _buildListRecommendation();
}

class _buildListRecommendation extends ListRecommendationModel {
  var size;
  PageController _pageController;
  int _currentSlide = 0;

  @override
  void initState() {
    _controller();
    super.initState();
  }

  _controller()async{
    _pageController = PageController(
      initialPage: _currentSlide, keepPage: false, viewportFraction: 0.9,);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      child: PageView.builder(
        controller: _pageController,
        itemCount: recommended.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _buildRecommendation(recommended[index]);
        },
      ),
    );
  }

  Widget _buildRecommendation(var data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(data["image"]),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: size.width * 0.5,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data["name"],
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data["description"],
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  data["price"],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Roboto',
                                      color: mainGreen,
                                      fontWeight: FontWeight.bold),
                                ),
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
                                      child: Center(
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: mainGreen,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 2.0,
                                            ),
                                          ]),
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String assets) {
    return Container(
      height: 170,
      width: 120,
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(assets)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  Widget _buildAddCart() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.shopping_basket,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            "Add To Cart",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      height: 30,
      decoration: BoxDecoration(
          color: mainGreen,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ]),
    );
  }

}
