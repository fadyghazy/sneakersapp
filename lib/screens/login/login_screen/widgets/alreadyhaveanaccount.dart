
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/core/utils/app_router.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool Login;
  final Function () press;
  const AlreadyHaveAnAccountCheck({

    Key? key,this.Login=true, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text( Login?"Don,t Have an Account ?":"Already  Have an Account ?",style: const TextStyle(
            color: KPrimaryColor
        ),),
        GestureDetector(
          onTap: press,
          child:  Text(Login?"Sign Up":"Sign In",style:const TextStyle(
              color: KPrimaryColor,fontWeight: FontWeight.bold
          ),),
        )

      ],
    );
  }
}
