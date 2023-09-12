import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sneakers_store/business_logic/auth/login/login_cubit.dart';
import 'package:sneakers_store/core/utils/assets.dart';
import 'package:sneakers_store/data/data_provider/local/cache_helper.dart';
import 'package:sneakers_store/features/sneakers/main/view/main_page.dart';
import 'package:sneakers_store/screens/Signup/signup_screen.dart';
import 'package:sneakers_store/screens/signup2/signup_screen.dart';
import 'package:sneakers_store/screens/support/presentation/views/SupportScreen/components/custom_text_field.dart';
import 'package:sneakers_store/styles/colors.dart';
import 'package:sneakers_store/translate.dart';
import 'package:sneakers_store/translations/locale_keys.g.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lottie/lottie.dart';
import '../../constants/constants.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   final int delay=2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          token = state.loginModel.accessToken!;
          CacheHelper.put(key: tokenKey, value: token).then((value) {
            showTopSnackBar(
                context, CustomSnackBar.success(message: 'Welcome Back !'));
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
                  (route) => false);
        }
      },
      builder: (context, state) {
        LoginCubit myCubit = LoginCubit.get(context);
        return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width / 30),
              child: Form(
                key: myCubit.loginKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height / 30),
                      child: Lottie.network(
                        "https://assets8.lottiefiles.com/packages/lf20_2TUV98WaqI.json",
                        height: size.height / 2,
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
                          Translate.LoginText,
                          style: TextStyle(fontSize: 40),
                        )
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    FadeInUp(
                      delay: Duration(milliseconds: delay),
                      child:  CustomTextFormField(
                      visibleText: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return Translate.EmailErrorMessage;
                        } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[com]")
                            .hasMatch(value)) {
                          
                          return Translate.EmailMessageErrorReturnable;

                        }
                        return null;

                      },
                      hintText:Translate.EmailHintTextMessage,
                      controller: emailController,
                    ),),
                    SizedBox(
                      height: size.height / 30,
                    ),

        FadeInUp(
        delay: Duration(milliseconds: delay),
        child:  CustomTextFormField(
                      validator: (val) {
                        if (val.isEmpty) {
                          return Translate.PasswordErrorMessage;

                        }else
                          if(val.length < 6){
                          return Translate.PasswordMessageErrorReturnable;
                        }
                        return null ;
                      },
                      hintText: Translate.PasswordHintTextMessage,
                      controller: passwordController,
                    ),
        ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    Row(
                      children: [
                        FadeInUp(
                            delay: Duration(milliseconds: delay),
                            child:   TextButton(
                            onPressed: () {},
                            child:  Text(
                              Translate.ForgotPasswordTextMessage,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  decoration: TextDecoration.underline),
                            ))
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 20,
                    ),
                    FadeInUp(
                      delay: Duration(milliseconds: delay),
                      child:   ElevatedButton(
                      onPressed: () {
                        if (myCubit.loginKey.currentState!.validate()) {
                          myCubit.login(
                              email: emailController.value.text.trim(),
                              password: passwordController.value.text.trim(),
                              loginError: (String msg) {
                                showTopSnackBar(
                                    context, CustomSnackBar.error(message: msg));
                              });
                          Fluttertoast.showToast(
                              msg:Translate.SuccessfulyLoginMessage,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(),
                              ),
                                  (route) => false);
                        }
                      },
                      child: FadeInUp(
                        delay: Duration(milliseconds: delay),
                        child:    Text(
                        Translate.LoginText,
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
                          child:  Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: size.width / 50),
                          child:  Text(Translate.ORText),
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
                  child:  OutlinedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>SignupScreen()), (route) => false);
                      },
                      child: FadeInUp(
                        delay: Duration(milliseconds: delay),
                        child:Text(
                        Translate.SignUpText,
                      ),
                    )
                ),
                )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
