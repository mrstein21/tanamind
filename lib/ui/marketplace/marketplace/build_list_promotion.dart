import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/ui/marketplace/marketplace/marketplace_view_model.dart';

class ListPromotion extends StatefulWidget {
  @override
  _buildListPromotion createState() => _buildListPromotion();
}

class _buildListPromotion extends ListPromotionModel {
  var size;
  PageController _pageController;
  int _currentSlide = 0;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: _currentSlide, keepPage: false, viewportFraction: 0.9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      child: PageView.builder(
        controller: _pageController,
        itemCount: promo.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          /*return _buildCard(promo[index]);*/
          return _buildCardBezier(promo[index]);
        },
      ),
    );
  }

  Widget _buildCard(String assets) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ],
          image: DecorationImage(
            image: AssetImage(assets),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildCardBezier(String data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            new BoxShadow(
              color: Colors.black45.withOpacity(0.1),
              spreadRadius: 2.0,
              blurRadius: 2.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(0.6),
                  borderRadius: BorderRadius.circular(6)),
            ),
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 3 / 6,
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                  child: Image.asset(
                    data,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            ClipPath(
              clipper: TrapeziumClipper(),
              child: Container(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width * 4 / 9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 4 / 15),
                      child: Text(
                        'Lorem ipsum dolor sit amet',
                        softWrap: true,
                        style:
                            fontRoboto(15.0, FontWeight.w500, Colors.black45),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 2 / 3, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TrapeziumClipper oldClipper) => false;
}
