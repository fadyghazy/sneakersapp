import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:sneakers_store/constants/end_points.dart';
import 'package:sneakers_store/data/data_provider/remote/dio_helper.dart';
import 'package:sneakers_store/screens/login/login_screen/login_screen.dart';
import 'package:sneakers_store/screens/login2/login_screen.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  String gender = 'm';

  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  bool visiblePassword = false;
  bool visibleConfirmPassword = false;

  // function to change visibility of password
  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    emit(VisiblePasswordState());
  }

  void changeConfirmPasswordVisibility() {
    visibleConfirmPassword = !visibleConfirmPassword;
    emit(VisibleConfirmPasswordState());
  }

  void changeGender (val){
    gender = val;
    emit(ChangeGenderState());
  }

 /* Future postSignup(context) async {
    var json = {
      "name": nameController.value.toString(),
      "email": emailController.value.toString(),
      "password": passwordController.value.toString(),
      "phoneNumber": phoneNumberController.value.toString(),
      "gender": gender == 'male' ? 'm' : 'f',
    };


    DioHelper.postData(url: registerEndPoint, data: json).then((value) {

      if (value.statusCode == 200) {
        print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>success');
        Fluttertoast.showToast(
            msg: "Successfully Signup",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
      }
      emit(GetSignupSuccessState());

    }).catchError((e){
      print(e);
      emit(GetSignupErrorState());
    });
  }*/
}
