import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
            title: "Page 1",
            body: 'This is page one',
            decoration: const PageDecoration(
              titleTextStyle:
                  TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
              bodyTextStyle: TextStyle(fontSize: 19.0),
              descriptionPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              titlePadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              pageColor: Colors.white,
              imagePadding: EdgeInsets.zero,
            )),
        PageViewModel(
            title: "Page 2",
            body: 'This is page two',
            decoration: const PageDecoration(
              titleTextStyle:
                  TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
              bodyTextStyle: TextStyle(fontSize: 19.0),
              descriptionPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              titlePadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              pageColor: Colors.white,
              imagePadding: EdgeInsets.zero,
            )),
        PageViewModel(
            title: "Page 3",
            body: 'This is page three',
            decoration: const PageDecoration(
              titleTextStyle:
                  TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
              bodyTextStyle: TextStyle(fontSize: 19.0),
              descriptionPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              titlePadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              pageColor: Colors.white,
              imagePadding: EdgeInsets.zero,
            )),
        PageViewModel(
          title: "end",
          body: 'This is end page',
          decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
            bodyTextStyle: TextStyle(fontSize: 19.0),
            descriptionPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            titlePadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            pageColor: Colors.white,
            imagePadding: EdgeInsets.zero,
          ),
          /*footer: RaisedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            child: Text(
              'button',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
          ),*/
        ),
      ],
      onDone: ()=> Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false),
      showSkipButton: true,
      showNextButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text('skip'),
      next: Text('next'),
      done: Text('done'),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
