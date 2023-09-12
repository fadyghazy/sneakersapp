
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_store/business_logic/auth/login/login_cubit.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/constants/constants.dart';
import 'package:sneakers_store/core/utils/app_router.dart';
import 'package:sneakers_store/core/utils/assets.dart';
import 'package:sneakers_store/data/data_provider/local/cache_helper.dart';
import 'package:sneakers_store/features/sneakers/main/view/main_page.dart';
import 'package:sneakers_store/screens/Signup/signup_screen.dart';
import 'package:sneakers_store/screens/login/login_screen/login_screen.dart';
import 'package:sneakers_store/screens/login/login_screen/widgets/alreadyhaveanaccount.dart';
import 'package:sneakers_store/screens/login/login_screen/widgets/rounded_input_field.dart';
import 'package:sneakers_store/screens/login/login_screen/widgets/rounded_password_field.dart';
import 'package:sneakers_store/screens/login/login_screen/widgets/sliding_text.dart';
import 'package:sneakers_store/screens/login/login_screen/widgets/text_field_Container.dart';
import 'package:sneakers_store/screens/signup2/signup_screen.dart';
import 'package:sneakers_store/screens/welcome_screen/widgets/Roundedbutton.dart';
import 'package:sneakers_store/screens/welcome_screen/widgets/background.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody>with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  bool show = false;
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState>formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
       initSlidingAnimation();
  }
  @override
  void dispose() {
    animationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    Size size =MediaQuery.of(context).size;

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
    return
    Background(child:SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

    Padding(
    padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/15,left:MediaQuery.of(context).size.height/25),
    child: Row(
    children: [
    Text(
    " Can you Sign In",style:TextStyle(
    color: Colors.black,fontSize:27,fontWeight: FontWeight.bold
    ),
    ),
    SlidingImage(slidingAnimation: slidingAnimation,),
    Text(
    "??",style:TextStyle(
    color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold
    ),
    )

    ],

    ),


    ),
    SizedBox(height:20,),


    Form(
    key: formkey,
    child: SingleChildScrollView(
    child: Column(

    mainAxisAlignment: MainAxisAlignment.center,
    children:[
    Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold),
    ),
    SizedBox(height: size.height*0.03),
    Image.asset(AppAssets.Logo3,height:size.height*0.35 ),
    SizedBox(height: size.height*0.03),
    RoundedInputField(
    controller:emailController,
    onChanged: (value) {
    emailController!=value;
    },hintText: 'Your Email', validator: (value ) {
    if (value!.isEmpty) {
    return 'Please Enter Your Email';
    } else if (!RegExp(
    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[com]")
        .hasMatch(value)) {
    return 'Please Enter Valid as example@gmail.com';
    }},
    icon:Icons.email ,
    keyboardType:TextInputType.emailAddress,


    ),
    RoundedPasswordField(onChanged: (value) {
    passwordController!=value ;
    },validator: (value){
    if(value!.isEmpty){
    return "password cannot be null";
    }
    if(value.length<4){
    return "password cannot be less than 4 letters";
    }
    return null;
    },
    hintText: 'Enter your password', controller:passwordController, show: show,


    ),
    RoundedButton(text: 'LOGIN',press: ()async{
          if (myCubit.loginKey.currentState!.validate()) {
          myCubit.login(
          email: emailController.value.text.trim(),
          password: passwordController.value.text.trim(),
          loginError: (String msg) {
          showTopSnackBar(
          context, CustomSnackBar.error(message: msg));
          });
          Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
          builder: (context) =>MainPage(),
          ),
          (route) => false);
          }


    await Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>const MainPage()), (route) => false);
    },),

    AlreadyHaveAnAccountCheck(press: () {

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> SignupScreen()), (route) => false);
    },)

    ],
    ),
    ),
    ),]
    )
    )
    );

    });
  }

  void initSlidingAnimation(){
    animationController =
        AnimationController(vsync: this, duration:const  Duration(seconds:3));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(4, 0), end: Offset.zero).animate(
            animationController);
    animationController.forward();
  }

}
