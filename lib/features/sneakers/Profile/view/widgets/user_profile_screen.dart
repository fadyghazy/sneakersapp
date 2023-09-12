import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/buildAppBar.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/edit_icon.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/editing_profile_page.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/header.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/profile_picture.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/profile_widget.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/profileinfo.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/user_information_ui.dart';
import 'package:path/path.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/user_picture_profile.dart';
class UserProfileScreen extends StatefulWidget {


  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final user = UserPreferences.getUser();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return ThemeSwitchingArea(
        child:Builder(builder: (context)=>Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: size.height*0.01),
           ProfileWidget(onClicked: ()async{
      await Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditProfilePage()));
      setState(() {

      });
      }, imagePath:user.imagePath,),


            const SizedBox(height: 24),
           const  UserInformation(),
            SizedBox(height:size.height*0.05,)



          ],
        ),
      ),
    )
        )
    );
  }
}

