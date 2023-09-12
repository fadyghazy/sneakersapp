import 'dart:io';

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/editing_profile_page.dart';

class UserProfilePicture extends StatelessWidget {
  final String imagepath;


  const UserProfilePicture({
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
     final image=imagepath.contains('https://')?NetworkImage(imagepath):FileImage(File(imagepath));
     Size size=MediaQuery.of(context).size;
     final user=UserPreferences.getUser();
    return Container(
      height: size.height*0.2,
      width: size.width*0.40,
      margin: const EdgeInsets.only(top:10),
      child: Stack(
          children: [
             CircleAvatar(
                  radius: size.width*0.2,
                  backgroundImage: AssetImage(user.imagePath),
                ),


            Positioned(
                bottom:0,
                right: 4,
                child: Container(


                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,

                    ),

                    child: Icon(LineAwesomeIcons.pen,color:kTextColor,size: 10))),


          ]
      ),

    );
  }
}

