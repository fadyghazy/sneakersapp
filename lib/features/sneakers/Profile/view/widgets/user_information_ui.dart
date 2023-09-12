
import 'package:flutter/material.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/Button_default.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/numbers_widget.dart';
import 'package:sneakers_store/translate.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user=UserPreferences.getUser();
    return Column(
      children: [
        Text(user.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
        const SizedBox(height: 10),
        Text(user.email,style: TextStyle(color: Colors.grey),),
        const SizedBox(height: 10),
        InformationButton(text: '${Translate.Upgrade_To_Pro}', onClicked: ()async{

        }),
        const SizedBox(height: 24),

       const  NumbersWidget(),
        const SizedBox(height: 48),
        AboutButton(),
        const SizedBox(height:10),


      ],
    );
  }
}
class AboutButton extends StatelessWidget {
  const AboutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user=UserPreferences.MyUser;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text("${Translate.About}",style: TextStyle(
          fontSize: 24,fontWeight: FontWeight.bold,
        ),),
        SizedBox(height: 16),
        Text(user.about,style: TextStyle(fontSize: 16,height: 1.4),)

      ],
    )
    );
  }
}

