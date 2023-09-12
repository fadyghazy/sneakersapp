
import 'package:flutter/material.dart';
import 'package:sneakers_store/styles/colors.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.visibleText = true,
    this.onTap,
    this.isPassword = false,
  }) : super(key: key);

  final String hintText;
  TextEditingController controller;
  final Function validator;
  bool visibleText;
  bool isPassword;

  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        return validator(val);
      },
      controller: controller,
      obscureText: visibleText,
      decoration: InputDecoration(

        suffixIcon:isPassword? InkWell(
          onTap:onTap ,
          child: Icon(
            visibleText ? Icons.visibility : Icons.visibility_off ,
            color: primaryColor,
          ),
        ): SizedBox(),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}