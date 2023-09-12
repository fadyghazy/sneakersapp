
import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/features/sneakers/Profile/model/usermodel.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/profile_screen.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/Button_default.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/buildAppBar.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/custom_text_field.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/profile_widget.dart';
import'package:path/path.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/user_picture_profile.dart';
import 'package:sneakers_store/translate.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;
  @override
  void initState() {

    super.initState();
    user=UserPreferences.getUser();
  }
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child:Builder(builder: (context)=>Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
         Padding(
           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.22),
             child:ProfileWidget(onClicked:()async{

                 final image=await ImagePicker().getImage(source: ImageSource.gallery);
                 if(image==null)return;
                 // and with this we make sure that we copy our image from our library galarey to our application document directory
                 final directory=await getApplicationDocumentsDirectory();
                 final name=basename(image.path);
                 final imageFile=File('${directory.path}/$name');
                 final newImage=await File(image.path).copy(imageFile.path);

                 setState(() {
                   // with this we save the reference to our start image which we have here in our application Document directory
                   user=user.copy(imagePath: newImage.path);
                 });
               },
              imagePath:user.imagePath,),
           ),
          const SizedBox(height: 24),

          CustomProfileTextField(
           label: "${Translate.NameHintText}",text:user.name,
            OnChanged: (name){
              //creating a new method called copy so this will create a copy of current user data object and only will manipulate one field whicch that UserName
               // and we will create copy method with user class and here we are already used it for changing the name within user object
              user=user.copy(name:name);

             // now i want if i change anything in textfield and now we want to store the text field value   in user model

            },

            ),
          const SizedBox(height: 24),
          CustomProfileTextField(
            label: '${Translate.EmailHintTextMessage}',text:user.email,
            OnChanged: (email){
              // we change email within user model and this means that if modify your email then your email will going inside User class
              user=user.copy(email:email);
            },

          ),
          const SizedBox(height: 24),
          CustomProfileTextField(
            label: "${Translate.About}",text:user.about,
            OnChanged: (about){
              user=user.copy(about:about);

            },
            maxLines:5

          ),
          InformationButton(text: 'Save', onClicked: () async{
             // here we want if we click on this button then we will call this setUser Method which store the user data model into cache by SharedPreference
            // and now if we click on save button now we can store every time  our user data that we modify it before
            UserPreferences.setUser(user);
             await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ProfileScreen()), (route) => false);
          },)




        ],
      ),
    )
        )
    );
  }
}

