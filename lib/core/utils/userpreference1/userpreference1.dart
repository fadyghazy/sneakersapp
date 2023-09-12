import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sneakers_store/core/utils/userpreference1/model/user1model.dart';
import 'package:sneakers_store/features/sneakers/Profile/model/usermodel.dart';

class UserPreferences1{
  // we create a key to store our user data into chache
  static const _KeyUser='user1';
  static late SharedPreferences _preferences;
  static const MyUser1=User1(
    price:20,
  );
  static Future init()async{
    _preferences=await SharedPreferences.getInstance();
  }
  //creating two methods first to set our user data locally with shered preference database
  static Future setUser(User1 user1)async{
    final json=jsonEncode(user1.toJson());
    await _preferences.setString(_KeyUser, json);
  }
  // loading profilePage with user model data that had been stored in shared preferences
  static User1 getUser(){
    final json=_preferences.getString(_KeyUser);
    // we access user information through Shared Preferences with this method getString
    return json==null?MyUser1:User1.fromjson(jsonDecode(json));
  }
}