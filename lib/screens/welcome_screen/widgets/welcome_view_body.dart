
import 'package:sneakers_store/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/core/utils/app_router.dart';
import 'package:sneakers_store/core/utils/assets.dart';
import 'package:sneakers_store/core/widgets/backgroundimage.dart';
import 'package:sneakers_store/screens/Signup/signup_screen.dart';
import 'package:sneakers_store/screens/login/login_screen/login_screen.dart';
import 'package:sneakers_store/screens/login2/login_screen.dart';
import 'package:sneakers_store/screens/signup2/signup_screen.dart';
import 'package:sneakers_store/screens/welcome_screen/widgets/Roundedbutton.dart';
import 'package:sneakers_store/screens/welcome_screen/widgets/backgroundimage.dart';
import 'package:sneakers_store/translate.dart';
import 'package:sneakers_store/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'background.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    // this size provide us total height and width of our screen
    return SingleChildScrollView(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              SizedBox(height: size.height*0.8),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 30),
               child: RoundedButton(press: () {
                  Get.to(()=>LoginScreen(),transition: Transition.zoom);
                }, text:Translate.LoginText,
               ),
             ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child:
        RoundedButton(press: () {
                Get.to(()=> SignupScreen(),transition: Transition.circularReveal,duration: Duration(seconds: 3) );
                // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>const SignUpScreen()), (route) => false);
              }, text:Translate.SignUpText,

                textcolor: Colors.black,
                color: KPrimaryLightColor,)
          )
            ],
          ),
    );

    
  }
}
