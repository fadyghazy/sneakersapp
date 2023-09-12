
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sneakers_store/core/utils/theme/theme.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final  String text;
  final bool hasNavigation;
  final Function()onTap;
  const ProfileListItem({Key? key, required this.icon, required this.text, this.hasNavigation=true, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 10),

        padding: EdgeInsets.symmetric(horizontal: 20),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),

            color: Theme.of(context).backgroundColor
        ),
        child: Row(
          children: [
            Icon(icon,size: 20),
            const SizedBox(width: 25),
            Text(text,style:MyThemes.kTitleTextStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            Spacer(),
            if(this.hasNavigation)
              Icon(LineAwesomeIcons.angle_right,size: 20),

          ],
        ),
      ),
    );
  }
}

