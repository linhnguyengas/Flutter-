import 'package:flutter/material.dart';
import 'package:testqrcode/LoadingScreen/splash_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:testqrcode/Color/getColorsHex.dart';
class IntroDetail extends StatefulWidget {
  final title;
  final body;
  final titleProduct;
  final bodyProduct;
  IntroDetail({
    this.title,
    this.body,
    this.titleProduct,
    this.bodyProduct
  });
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<IntroDetail> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: '${widget.title}',
          body: '${widget.body}',
          image: Align(
            child: Image.asset('assets/logo/logo.png', height: 200.0,),
            alignment: Alignment.bottomCenter,
          ),
          decoration: PageDecoration(
            pageColor: Color(0xFFffffff),
            /////////////////////////////////////////////////
            bodyTextStyle: TextStyle(color: Colors.black, 
            fontSize: 20.0,
            fontFamily: 'Nunito-SemiBold'
            ),
            /////////////////////////////////////////////////
            titleTextStyle: TextStyle(color: Colors.black,
            fontSize: 30.0,
            fontFamily: 'Nunito-SemiBold',
            fontWeight: FontWeight.bold
            )
          )
        ),
        PageViewModel(
          title: '${widget.titleProduct}',
          body: '${widget.bodyProduct}',
          image: Align(
            child: Image.asset('assets/intro/icon-qr.png', height: 175.0,),
            alignment: Alignment.bottomCenter,
          ),
          decoration: PageDecoration(
            /////////////////////////////////////////////////
            pageColor: Color(0xFFffffff),
            bodyTextStyle: TextStyle(color: Colors.black, 
            fontSize: 20.0,
            fontFamily: 'Nunito-SemiBold'
            ),
            /////////////////////////////////////////////////
            titleTextStyle: TextStyle(color: Colors.black,
            fontSize: 30.0,
            fontFamily: 'Nunito-SemiBold',
            fontWeight: FontWeight.bold
            )
          )
        )
      ],
      onDone: () => Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => new SplashScreen())),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Bỏ qua', style: TextStyle(color: Colors.black),),
      next: const Icon(Icons.arrow_forward, color: Colors.white70,),
      done: const Text('Bắt đầu', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
    );
  }
}
