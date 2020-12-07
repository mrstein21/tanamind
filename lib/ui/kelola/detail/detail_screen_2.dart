import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanamind/helper/style.dart';

class DetailTanaman extends StatefulWidget {
  @override
  _DetailTanamanState createState() => _DetailTanamanState();
}

class _DetailTanamanState extends State<DetailTanaman> {
  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final image = route['image'];
    final title = route['title'];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2ea15e),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(color: Color(0xff2ea15e)),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        InkWell(
                          onTap: () {},
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 11, right: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(11.0),
                                child: Text('Sell', style: fontRoboto(16.0, FontWeight.w500, Colors.white),)
                              ),
                              /*Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                      color: Color(0xff2ea15e),
                                      fontSize: 19,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(5.0),
                                ),
                              ),*/
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 21),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "INDOOR",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(color: Colors.white70),
                              ),
                              Text(
                                "$title",
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .apply(
                                        color: Colors.white,
                                        fontWeightDelta: 2),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'size',
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(color: Colors.white70),
                              ),
                              Text(
                                "12",
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .apply(color: Colors.white),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'price',
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(color: Colors.white70),
                              ),
                              Text(
                                "32",
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .apply(color: Colors.white),
                              ),
                              SizedBox(
                                height: 21,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Hero(
                            tag: image,
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PreviewPlant(
                                            image: image,
                                          ))),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset('$image')),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: (MediaQuery.of(context).size.height / 2) - 23,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'All To Know',
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .apply(fontWeightDelta: 2),
                          ),
                          SizedBox(
                            height: 21.0,
                          ),
                          Text(
                              'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Aliquid tempora non ex, repudiandae assumenda consequatur deserunt. Nobis, illo ratione aut sapiente similique aliquid quas dolor, expedita velit natus ex? Iste.',
                              style: TextStyle(fontSize: 17))
                        ],
                      ),
                    )
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

class PreviewPlant extends StatelessWidget {
  final image;

  const PreviewPlant({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(
                Icons.file_download,
                color: Colors.white,
              ),
              onPressed: null),
        ],
      ),
      body: Center(child: Image.asset(image, fit: BoxFit.cover,)),
    );
  }
}
