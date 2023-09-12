
import 'package:flutter/material.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/screens/login/login_screen/widgets/text_field_Container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String>onChanged;
  final String hintText;
  final IconData icon;
  final bool show;
  final  FormFieldValidator<String>?validator;
  TextEditingController controller =TextEditingController();
  final TextInputType? keyboardType ;
  final TextInputAction?textInputAction;
   RoundedPasswordField({
    Key? key, required this.onChanged, required this.hintText, this.icon=Icons.lock, this.validator, this.keyboardType=TextInputType.number, this.textInputAction=TextInputAction.next,required this.controller,  this.show=false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(child: TextFormField(
      onChanged: onChanged,
        obscureText: show,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'your Password',
          icon: Icon(Icons.lock,color: KPrimaryColor),suffixIcon:GestureDetector(
          onTap: (){
            show!=show;
          },
            child: show?Icon(Icons.visibility_outlined,color: KPrimaryColor,):Icon(Icons.visibility_off_outlined,color: KPrimaryColor,))),
        )
    );
  }
}
