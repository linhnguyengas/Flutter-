import 'package:flutter/material.dart';
import 'package:testqrcode/Component/LanguageSelectorPage.dart';
import 'package:testqrcode/LoadingScreen/splash_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:testqrcode/Service/ApptTranslations.dart';



class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.lightGreen[900], end: Color(0xFFffffff)).animate(controller);

    controller.forward();

    controller.addListener((){
      setState((){});
    });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title:  AppTranslations.of(context).text("Intro_title_1"),
            body:  AppTranslations.of(context).text("Intro_body_1"),
            image: Align(
              child: Image.asset('assets/logo/logo.png', height: 180.0,fit: BoxFit.cover,),
              alignment: Alignment.bottomCenter,
            ),
            decoration: PageDecoration(
              //pageColor: Color(getColor('#80C241')),
                pageColor: animation.value,
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
            title: AppTranslations.of(context).text("Intro_title_2"),
            body: AppTranslations.of(context).text("Intro_body_2"),
            image: Align(
              child: Image.asset('assets/intro/icon-qr.png', height: 175.0,),
              alignment: Alignment.bottomCenter,
            ),
            decoration: PageDecoration(
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
        )
      ],
      onDone: () => Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => new SplashScreen())),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text(AppTranslations.of(context).text("Intro_button_skip"),
        style: TextStyle(color: Colors.black),),
      next: const Icon(Icons.arrow_forward,
        color: Colors.white70,),
      done: Text(AppTranslations.of(context).text("Intro_button_start"),
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
    );
  }
}
