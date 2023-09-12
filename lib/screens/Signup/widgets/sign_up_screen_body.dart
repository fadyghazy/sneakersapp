
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_store/business_logic/auth/signup/signup_cubit.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/core/utils/app_router.dart';
import 'package:sneakers_store/core/utils/assets.dart';
import 'package:sneakers_store/features/sneakers/main/view/main_page.dart';
import 'package:sneakers_store/screens/Signup/widgets/background.dart';
import 'package:sneakers_store/screens/Signup/widgets/or_Divider.dart';
import 'package:sneakers_store/screens/Signup/widgets/social_icon.dart';
import 'package:sneakers_store/screens/login/login_screen/login_screen.dart';
import 'package:sneakers_store/screens/login/login_screen/widgets/alreadyhaveanaccount.dart';
import 'package:sneakers_store/screens/login/login_screen/widgets/rounded_input_field.dart';
import 'package:sneakers_store/screens/login/login_screen/widgets/rounded_password_field.dart';
import 'package:sneakers_store/screens/login2/login_screen.dart';
import 'package:sneakers_store/screens/welcome_screen/widgets/Roundedbutton.dart';

class SignUpScreenBody extends StatefulWidget {

  const SignUpScreenBody({Key? key}) : super(key: key);

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController =TextEditingController();
  GlobalKey<FormState>formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SignupCubit signupCubit = SignupCubit.get(context);
    Size size = MediaQuery
        .of(context)
        .size;
    return BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          return background(child: SingleChildScrollView(
              child: Form(
                key: formstate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("SIGNUP", style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 30

                    ),),
                    SizedBox(height: size.height * 0.03),
                    Image.asset(AppAssets.Logo2, height: size.height * 0.23,),
                    RoundedInputField(
                      hintText: "Your Email", onChanged: (String value) {
                            emailController!=value;
                    }, controller: emailController, validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Email';
                        } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[com]")
                            .hasMatch(value)) {
                          return 'Please Enter Valid as example@gmail.com';
                        }
                      },

                      ),
                    RoundedPasswordField(onChanged: (String? value) {
                      passwordController!=value;
                    },
                   controller: passwordController, hintText: 'Your Password',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Password';
                        }
                      },),
                    RoundedPasswordField(onChanged: (String? value) {
                      confirmPasswordController!=value;
                    },
                      controller:confirmPasswordController, hintText: 'Your Confirm Password',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Confirm Password';
                        }
                      },),
                    RoundedButton(text: "sign Up", press: () {
                        if (signupCubit.signupKey.currentState!.validate()) {
                          if (signupCubit.passwordController.text !=
                              signupCubit.confirmPasswordController.text) {
                            Fluttertoast.showToast(
                                msg: 'Password doesn\'t Match',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }else {
                           // signupCubit.postSignup(context);
                          /*  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                builder: (context) => const MainPage()), (
                                route) => false);*/

                          }
                        }

                    }),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                            builder: (context) =>  LoginScreen()), (
                            route) => false);
                      }, Login: false,),
                    const ORDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialIcon(
                          IconSrc: "assets/icons/facebook.svg", press: () {

                        },),
                        SocialIcon(
                          IconSrc: "assets/icons/twitter.svg", press: () {

                        },),
                        SocialIcon(
                          IconSrc: "assets/icons/google-plus.svg", press: () {

                        },),


                      ],
                    )


                  ],

                ),
              )
          ),);
        }
    );
  }
}

