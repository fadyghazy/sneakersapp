
import 'package:flutter/material.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/core/utils/assets.dart';
import 'package:sneakers_store/core/utils/theme/theme.dart';
import 'package:sneakers_store/screens/login2/login_screen.dart';
import 'package:sneakers_store/screens/signup2/signup_screen.dart';
import 'package:sneakers_store/screens/welcome_screen/widgets/Roundedbutton.dart';
import 'package:sneakers_store/screens/welcome_screen/widgets/backgroundimage.dart';
import 'package:sneakers_store/screens/welcome_screen/widgets/image_list_view.dart';

import 'widgets/welcome_view_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
       body: Stack(
         alignment:Alignment.center,
           children: [
             Positioned(
               top: -10,left:-150,child:Row(
               children: [
                 ImageListView(startIndex:0),
                 ImageListView(startIndex:1),
                 ImageListView(startIndex:2),


               ],
             ),

             ),

             Positioned(
               bottom: 0,

                 child: Container(
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height*0.60,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SizedBox(height: MediaQuery.of(context).size.height*0.3),
                         RoundedButton(press: () {
                           Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>SignupScreen()), (route) => false);
                         }, text: 'Sign Up',color: Colors.green,),
                         SizedBox(height:MediaQuery.of(context).size.height*0.01),
                         RoundedButton(
                           press: () {

                           Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
                         }, text: 'Sign In',color: KPrimaryLightColor,textcolor: Colors.black,)
                       ],
                     ),
                 ))
         //  BackgroundImage(image:AppAssets.Logo4),WelcomeViewBody(),

      ]
    )
    );
  }
}
