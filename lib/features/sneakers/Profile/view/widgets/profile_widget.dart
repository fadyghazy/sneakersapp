
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;
  final bool isEdit;

  const ProfileWidget(
      {Key? key, required this.imagePath, required this.onClicked,this.isEdit=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    final image=imagePath.contains('https://')?NetworkImage(imagePath):FileImage(File(imagePath));
    final user = UserPreferences.getUser();
    return Stack(
        children: [
        //  AnimatedAlign(alignment: alignment, duration: duration)
          GestureDetector(
            onTap:onClicked,
            child: CircleAvatar(
              radius: size.width*0.2,
             backgroundColor: Colors.white,
              backgroundImage: image as ImageProvider,

            ),
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

    );


  }
}

