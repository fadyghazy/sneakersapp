
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:sneakers_store/core/utils/assets.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/screens/intro/intro_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sneakers_store/screens/settings/components/darkmode_tile.dart';
import 'package:sneakers_store/screens/splash/presentation/view/widgets/slidingtext.dart';

class SplashScreenViewBody extends StatefulWidget {
  const SplashScreenViewBody({Key? key}) : super(key: key);
  @override
  State<SplashScreenViewBody> createState() => _SplashScreenViewBodyState();
}

class _SplashScreenViewBodyState extends State<SplashScreenViewBody>with TickerProviderStateMixin {
  final user=UserPreferences.getUser();
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
 @override
  void initState() {
   navigateToScreen();
   initSlidingAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:user.isDarkMode?Colors.grey:Colors.greenAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              ""
            ),
          ),
         SizedBox(height: 50),
        const SpinKitSpinningLines(
          color: Colors.orange,
          size: 50.0,
          ),

          const SpinKitFadingCube(
            color: Colors.white10,
            size: 50.0,
          ),



]
      )


    );
  }
  void navigateToScreen(){
    Future.delayed(const Duration(seconds: 5), () {
   Navigator.pushAndRemoveUntil(context,CupertinoPageRoute(builder: (context)=>const IntroductionPageView()), (route) => false);
    });
  }
  void initSlidingAnimation(){
    animationController =
        AnimationController(vsync: this, duration:const  Duration(seconds: 2));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(4, 0), end: Offset.zero).animate(
            animationController);
    animationController.forward();
  }
}
