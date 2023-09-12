
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_store/screens/intro/intro_view.dart';
import 'package:page_transition/page_transition.dart';
class SneakerSplashView extends StatelessWidget {
  const SneakerSplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset('assets/images/sneakersplashview.jpg',fit:BoxFit.cover),
        ),
      ),
      splashIconSize: double.infinity,
      duration: 4000,
      nextScreen: IntroductionPageView(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );


  }
}
