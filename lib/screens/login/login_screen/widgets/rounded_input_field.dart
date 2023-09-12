

import 'package:flutter/material.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/screens/login/login_screen/widgets/text_field_Container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final  FormFieldValidator<String>?validator;
  TextEditingController controller =TextEditingController();
  final TextInputType? keyboardType ;
  final TextInputAction?textInputAction;

    RoundedInputField({
    Key? key, required this.hintText,this.icon=Icons.person, required this.onChanged,required this.validator,required this.controller,this.keyboardType,this.textInputAction=TextInputAction.next
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(

      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        textInputAction:textInputAction ,
        decoration: InputDecoration(
            prefixIcon: Icon(icon,color: KPrimaryColor,),
            border: InputBorder.none,
            hintText:hintText

        ),


      ),
    );
  }
}
