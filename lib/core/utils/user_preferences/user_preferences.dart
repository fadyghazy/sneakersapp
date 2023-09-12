import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sneakers_store/features/sneakers/Profile/model/usermodel.dart';
import 'package:sneakers_store/translate.dart';

class UserPreferences{
  // we create a key to store our user data into chache
  static const _KeyUser='user';
  static late SharedPreferences _preferences;
  static  User MyUser=User(
    imagePath:"https://freesvg.org/img/abstract-user-flat-1.png",
      about: 'flutter developer who has 2 years experience and has getting his chance to work in orange digital center as trainee and then get certification from amit learning and after that getting his chance in a workshop from orange digital center to improve his skills with getting a high grade and stil looking for his chance to improve him self as a great developer as he wish'
      /*flutter developer who has 2 years experience and has getting his chance to work in orange digital center as trainee and then get certification from amit learning
      and after that getting his chance in a workshop from orange digital center to improve his skills with getting a high grade and stil looking for his chance to
      improve him self as a great developer as he wish*/,
      isDarkMode: false, email: 'fadyghazy@gmail.com', name:'FadyGhazy'/*fadyghazy@gmail.com*/

  );
  static Future init()async{
    _preferences=await SharedPreferences.getInstance();
  }
  //creating two methods first to set our user data locally with shered preference database
  static Future setUser(User user)async{
     final json=jsonEncode(user.toJson());
     await _preferences.setString(_KeyUser, json);
  }
  // loading profilePage with user model data that had been stored in shared preferences
  static User getUser(){
    final json=_preferences.getString(_KeyUser);
  // we access user information through Shared Preferences with this method getString
    return json==null?MyUser:User.fromjson(jsonDecode(json));
  }
}