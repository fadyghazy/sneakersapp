
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sneakers_store/constants.dart';

class SocialIcon extends StatelessWidget {
  final String IconSrc;
  final Function()press;
  const SocialIcon({
    Key? key, required this.IconSrc, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap:press,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: KPrimaryColor,

            ),
            shape:BoxShape.circle
        ),
        child: SvgPicture.asset(
          IconSrc,height: 20,width: 20,
        ),
    ),
      );
  }
}