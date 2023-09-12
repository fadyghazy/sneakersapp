
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sneakers_store/core/utils/theme/theme.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';

AppBar buildAppBar(BuildContext context) {
  final user=UserPreferences.getUser();
  final isDarkMode=user.isDarkMode;
  final icon=CupertinoIcons.moon_stars;
  return AppBar(
    leading: BackButton(),backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (BuildContext context)=>
        IconButton(icon:Icon(icon), onPressed: () {
          final theme=isDarkMode?kLightTheme:kDarkTheme;
          final switcher=ThemeSwitcher.of(context);
          switcher.changeTheme(theme: theme);
          final newUser= user.copy(isDarkMode:!isDarkMode);
          UserPreferences.setUser(newUser);
  },),
      ),


    ],
  );
}
