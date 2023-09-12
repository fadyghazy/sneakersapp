
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/core/utils/theme/theme.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/features/sneakers/Profile/model/usermodel.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/editing_profile_page.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/profile_picture.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/profile_widget.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/user_picture_profile.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/user_profile_screen.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    Size size=MediaQuery.of(context).size;
    return Expanded(
      child: Column(
          children: [
            ProfileWidget(onClicked: () async{

                await Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfileScreen()));
                   setState(() {

                   });
              }, imagePath:user.imagePath,),

            SizedBox(height: 20,),
            Container(
              width: size.width,
              child: Column(children: [
    Text(user.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
    ),
    const SizedBox(height: 10),
    Text(user.email,style: TextStyle(color: Colors.grey),),
    const SizedBox(height: 10),

          ],

        ),
            )
        ]
    )
    );

  }
}

