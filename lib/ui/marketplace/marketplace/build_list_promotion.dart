import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tanamind/cubit/marketplace/promo/promo_cubit.dart';
import 'package:tanamind/cubit/marketplace/promo/promo_state.dart';
import 'package:tanamind/helper/style.dart';
import 'package:tanamind/model/marketplace_model/promo_model.dart';
import 'package:tanamind/ui/marketplace/marketplace/marketplace_view_model.dart';

class ListPromotion extends StatefulWidget {
  @override
  _buildListPromotion createState() => _buildListPromotion();
}

class _buildListPromotion extends ListPromotionModel {
  var size;
  PageController _pageController;
  int _currentSlide = 0;
  PromotionCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<PromotionCubit>(context);
    _pageController = PageController(
        initialPage: _currentSlide, keepPage: false, viewportFraction: 0.9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocBuilder<PromotionCubit, MarketplacePromotionState>(
        // ignore: missing_return
        builder: (context, state) {
      if (state is PromotionIsLoading) {
        return _buildLoading(size);
      } else if (state is PromotionIsLoaded) {
        return Container(
          height: size.height * 0.2,
          child: PageView.builder(
            controller: _pageController,
            itemCount: state.list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _buildCardBezier(state.list[index]);
            },
          ),
        );
      } else if (state is PromotionIsError) {
        return _buildCard(state.message);
      }
    });
  }

  Widget _buildLoading(Size size){
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: size.height * 0.2,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              height: size.height * 0.2,
              width: double.infinity,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
        )
    );
  }

  Widget _buildCard(String assets) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ],
          /*image: DecorationImage(
            image: AssetImage(assets),
            fit: BoxFit.cover,
          ),*/
        ),
        child: Text('$assets'),
      ),
    );
  }

  Widget _buildCardBezier(MarketplacePromotionModel data) {
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
                    'assets/dummy/promo1.jpg',
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
                        /*'Lorem ipsum dolor sit amet',*/
                        '${data.title}',
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
