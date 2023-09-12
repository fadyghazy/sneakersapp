import 'package:flutter/material.dart';
class MyThemes {
  static const kSpacingUnit = 10;
//const kDarkPrimaryColor = Colors.blue;
  static const kDarkPrimaryColor = Color(0xFF212121);
  static const kDarkSecondaryColor = Color(0xFF373737);
  static const kLightPrimaryColor = Color(0xFFFFFFFF);
  static const kLightSecondaryColor = Color(0xFFF3F7FB);
  static const kAccentColor = Color(0xFFFFC107);
  static final kTitleTextStyle = TextStyle(
    fontSize: 20,
    //fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
    fontWeight: FontWeight.w600,
  );

  final kCaptionTextStyle = TextStyle(
    fontSize: 15,
    //fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
    fontWeight: FontWeight.w100,
  );

  final kButtonTextStyle = TextStyle(
    fontSize: 20,
    //fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
    fontWeight: FontWeight.w400,
    color: kDarkPrimaryColor,
  );

 static final kDarkTheme = ThemeData(
   // scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
    dividerColor: Colors.white,
    brightness: Brightness.dark,
    fontFamily: 'SFProText',
    primaryColor: Colors.blueAccent,
    canvasColor: kDarkPrimaryColor,
    backgroundColor: kDarkSecondaryColor,
    accentColor: kAccentColor,
    iconTheme: ThemeData
        .dark()
        .iconTheme
        .copyWith(
      color: kLightSecondaryColor,
    ),
    textTheme: ThemeData
        .dark()
        .textTheme
        .apply(
      fontFamily: 'SFProText',
      bodyColor: kLightSecondaryColor,
      displayColor: kLightSecondaryColor,

    ),


   appBarTheme: const AppBarTheme(
     titleTextStyle: TextStyle(
       fontSize: 36,
       fontWeight: FontWeight.w700,
       color: Colors.grey,
       fontFamily: 'JosefinSans',
     ),
     backgroundColor: Colors.transparent,
     elevation: 0,
     foregroundColor: Colors.black,
   ),
   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
     elevation: 0,
     backgroundColor: Colors.grey,
     showSelectedLabels: false,
     showUnselectedLabels: false,
     type: BottomNavigationBarType.fixed,
     selectedIconTheme: IconThemeData(
       size: 30,
       color: Colors.greenAccent,
     ),
     unselectedIconTheme: IconThemeData(
       size: 30,
       color: Colors.black,
     ),
   ),
   elevatedButtonTheme: ElevatedButtonThemeData(
     style: ElevatedButton.styleFrom(
       primary: Colors.purple,
       onPrimary: Colors.white,
       minimumSize: const Size.fromHeight(48),
     ),
   ),
   outlinedButtonTheme: OutlinedButtonThemeData(
     style: OutlinedButton.styleFrom(
       fixedSize: const Size.fromHeight(50),
       foregroundColor: Colors.black,//grey3
     ),
   ),
   textButtonTheme: TextButtonThemeData(
     style: TextButton.styleFrom(
       foregroundColor: Colors.grey,
     ),
   ),
  );

   static final kLightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'SFProText',
    textTheme: ThemeData
        .light()
        .textTheme
        .apply(
      fontFamily: 'JosefinSans',
    ),
    primaryTextTheme: ThemeData
        .light()
        .textTheme
        .apply(
      fontFamily: 'JosefinSans',
    ),
    primaryColor: Colors.blueAccent,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        fontFamily: 'JosefinSans',
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        size: 30,
        color: Colors.blueAccent,
      ),
      unselectedIconTheme: IconThemeData(
        size: 30,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.blueAccent,
        onPrimary: Colors.white,
        minimumSize: const Size.fromHeight(48),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size.fromHeight(50),
        foregroundColor: Colors.black,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
      ),
    ),
    canvasColor: kLightPrimaryColor,
    backgroundColor: kLightSecondaryColor,
    accentColor: kAccentColor,
    dividerColor: Colors.black,
    iconTheme: ThemeData
        .light()
        .iconTheme
        .copyWith(
      color: kDarkSecondaryColor,
    ),
  );
}