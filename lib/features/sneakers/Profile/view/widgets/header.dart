
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sneakers_store/core/utils/theme/theme.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/features/sneakers/Profile/model/usermodel.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/profileinfo.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    User user=UserPreferences.getUser();
    Size size=MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileInfo(),
        ThemeSwitcher.withTheme(
            builder: (context, switcher, theme) =>
            AnimatedCrossFade(
              duration: const Duration(
                milliseconds: 200
              ),crossFadeState: theme.brightness==Brightness.dark?CrossFadeState.showFirst:CrossFadeState.showSecond,
              firstChild: GestureDetector(
                onTap: (){
                  ThemeSwitcher.of(context).changeTheme(theme:MyThemes.kLightTheme);
                },
                  child: Icon(LineAwesomeIcons.sun,size:12)), secondChild:GestureDetector(
              onTap: (){
                ThemeSwitcher.of(context).changeTheme(theme:MyThemes.kDarkTheme);
              }
                ,
                child: Icon(LineAwesomeIcons.moon,size:12)),
            )),





      ],
    );
  }
}
