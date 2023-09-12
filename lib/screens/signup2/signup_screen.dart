import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sneakers_store/business_logic/auth/signup/signup_cubit.dart';
import 'package:sneakers_store/core/utils/assets.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/profile_widget.dart';
import 'package:sneakers_store/features/sneakers/main/view/main_page.dart';
import 'package:sneakers_store/screens/login2/login_screen.dart';
import 'package:sneakers_store/screens/support/presentation/views/SupportScreen/components/custom_text_field.dart';
import 'package:sneakers_store/translate.dart';
import 'package:sneakers_store/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final user = UserPreferences.getUser();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final int delay=2;

  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> genderMenu =  [
    DropdownMenuItem(
      value: 'm',
      child: Text(Translate.Male),
    ),
    DropdownMenuItem(
      value: 'f',
      child: Text(Translate.FeMale),
    ),
  ];

  @override
  Widget build(BuildContext context) {

    SignupCubit signupCubit = SignupCubit.get(context);
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width / 30),
              child: Form(
                key: signupKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height / 30),
                      child: Lottie.network(
                        "https://assets8.lottiefiles.com/packages/lf20_MbephoYReu.json",
                        height: size.height / 2.5,
                        width: size.width / 1.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    Row(
                      children:  [
                    FadeInDown(
                    delay: Duration(milliseconds: delay),
                    child: Text(
                          Translate.SignUpText,
                          style: TextStyle(fontSize: 40),
                        )
                    )
                      ],
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                  /*  ProfileWidget(onClicked: ()async{
                      setState(() {

                      });
                    }, imagePath:user.imagePath,),*/
                FadeInUp(
                  delay: Duration(milliseconds: delay),
                  child:   CustomTextFormField(
                      visibleText: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return Translate.NameMessageError;
                        } else if (value.length > 32) {
                          return Translate.NameMessageErrorReturnable;
                        }
                        ;
                      },
                      hintText: Translate.NameHintText,
                      controller: nameController,
                    ),
                ),
                    SizedBox(
                      height: size.height / 30,
                    ),
              FadeInUp(
                delay: Duration(milliseconds: delay),
                child:
                CustomTextFormField(
                      visibleText: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return Translate.EmailErrorMessage;
                        } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[com]")
                            .hasMatch(value)) {
                          return 'Please Enter Valid as example@gmail.com';
                        }
                      },
                      hintText: Translate.EmailHintTextMessage,
                      controller: emailController,
                    ),
              ),
                    SizedBox(
                      height: size.height / 30,
                    ),
              FadeInUp(
                delay: Duration(milliseconds: delay),
                child:
                CustomTextFormField(
                      validator: (val) {
                        if (val.isEmpty) {
                          return Translate.PasswordErrorMessage;
                        }
                        else {
                          if (val.length < 6) {
                            return Translate.PasswordMessageErrorReturnable;
                          }
                          return null;
                        }

                      },
                      isPassword: true,
                      hintText: Translate.PasswordHintTextMessage,
                      controller: passwordController,
                      visibleText: signupCubit.visiblePassword,
                      onTap: () {
                        signupCubit.changePasswordVisibility();
                      },
                    ),
              ),
                    SizedBox(
                      height: size.height / 30,
                    ),
              FadeInUp(
                delay: Duration(milliseconds: delay),
                child:
                CustomTextFormField(
                      isPassword: true,
                      validator: (val) {
                        if (val.isEmpty) {
                          return Translate.ConfirmPasswordMessage;
                        }
                      },
                      hintText: Translate.ConfirmPasswordHintText,
                      onTap: () {
                        signupCubit.changeConfirmPasswordVisibility();
                      },
                      visibleText: signupCubit.visiblePassword,
                      controller: confirmPasswordController,
                    ),
              ),
                    SizedBox(
                      height: size.height / 30,
                    ),
              FadeInUp(
                delay: Duration(milliseconds: delay),
                child:
                CustomTextFormField(

                      validator: (val) {
                        if (val == null) {
                          return Translate.PhoneNumberMessage;
                        } else if (val.length != 11) {
                          return Translate.PhoneNumberMessageReturnable;
                        }
                      },
                      visibleText: false,
                      hintText: Translate.PhoneNumber,
                      controller: phoneNumberController,
                    ),
              ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInUp(
                          delay: Duration(milliseconds: delay),
                          child:    Container(
                          width: size.width / 4,
                          padding: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.orange,
                              )),
                          child: DropdownButton(
                            alignment: Alignment.center,
                            underline: Container(
                              height: 2,
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            onChanged: (val) {
                              signupCubit.changeGender(val);
                            },
                            value: signupCubit.gender,
                            items: genderMenu,
                          ),
                        )
                        ),
                      ],
                    ),

                    SizedBox(
                      height: size.height / 30,
                    ),
              FadeInUp(
                delay: Duration(milliseconds: delay),
                child:
                ElevatedButton(
                      onPressed: () {

                        if (signupKey.currentState!.validate()) {
                          if (passwordController.text !=
                              confirmPasswordController.text) {
                            Fluttertoast.showToast(
                                msg:Translate.PasswordDoesntMatch,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }else {
                           // signupCubit.postSignup(context);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MainPage()), (route) => false);
                            Fluttertoast.showToast(
                                msg: Translate.SignUpSuccessfuly,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);

                          }
                        }
                      },
                      child:
                      FadeInUp(
                          delay: Duration(milliseconds: delay),
                          child:  Text(
                        Translate.SignUpText,
                      ),
                    ),
                    )
              ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        FadeInUp(
                          delay: Duration(milliseconds: delay),
                          child:   Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: size.width / 50),
                          child: Text(Translate.ORText),
                        ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
              FadeInUp(
                delay: Duration(milliseconds: delay),
                child:   OutlinedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
                      },
                      child:  Text(
                        Translate.LoginText,
                      ),
                    ),
              ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
