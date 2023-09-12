
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/features/sneakers/Profile/model/usermodel.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:size.width*0.32),
      child: Container(
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
                  right: 0,
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
      ),
    );
  }
}