
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sneakers_store/core/utils/theme/theme.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: BackButton(),backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ThemeSwitcher.withTheme(
      builder: (context, switcher, theme) =>
              AnimatedCrossFade(
                duration: const Duration(
                    milliseconds: 200,
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
