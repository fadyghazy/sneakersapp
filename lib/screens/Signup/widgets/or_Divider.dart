
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_store/constants.dart';

class ORDivider extends StatelessWidget {

  const ORDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final delay=2;
    Size size =MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height*0.02),
      width: size.width*0.8,
      child:FadeInUp(
    delay: Duration(milliseconds: delay),
    child:
      Row(
        children: [
          buildDivider(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal:10),
              child: Text("OR",style: TextStyle(
                  color: KPrimaryColor,
                  fontWeight:FontWeight.w600
              ),)
          ),

          buildDivider(),

        ],
      ),
      )
    );
  }
}
Expanded buildDivider() {
  return Expanded(child: Divider(
    color: Color(0xFFD9D9D9),
    height: 1.5,
  ));

}

