
import 'package:animate_do/animate_do.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/core/utils/theme/theme.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/header.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/profile_list_item.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/profileinfo.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/user_profile_screen.dart';
import 'package:sneakers_store/features/sneakers/main/view/widgets/navigation_page.dart';
import 'package:sneakers_store/screens/Terms/presentation/views/TermsScreen.dart';
import 'package:sneakers_store/screens/login/login_screen/login_screen.dart';
import 'package:sneakers_store/screens/login2/login_screen.dart';
import 'package:sneakers_store/screens/settings/settings_screen.dart';
import 'package:sneakers_store/screens/support/presentation/views/SupportScreen/supportScreen.dart';
import 'package:sneakers_store/translate.dart';

class ProfileScreen extends NavigationPage {
  const ProfileScreen({super.key}) : super(icon: Icons.person);

  static const routeName = '/profile';


  @override
  Widget build(BuildContext context) {
    final int delay=2;
    final user = UserPreferences.getUser();
   Size size=MediaQuery.of(context).size;
    return ThemeSwitchingArea(
      child:Builder(builder: (context)=>Scaffold(
          body:Column(
              children: [
                SizedBox(height: size.height*0.05),
        FadeInDown(
          delay: Duration(milliseconds: delay),
          child:
          Header()),
                SizedBox(height: 10),
        FadeInUp(
          delay: Duration(milliseconds: delay),
          child:   Container(
                    height: size.height*0.5,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ProfileListItem(
                            onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfileScreen()));
                            },
                            icon: LineAwesomeIcons.user_shield,
                            text: Translate.PrivacyText,


                          ),
                          SizedBox(height: 10,),

                          ProfileListItem(
                            icon: LineAwesomeIcons.history,
                            text: Translate.TermsConditionsText, onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsScreen()));
                          },



                          ),
                          SizedBox(height:10 ,),

                          ProfileListItem(
                            icon: LineAwesomeIcons.history,
                            text: Translate.HelpSupportText, onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SupportScreen()));
                          },



                          ),
                          SizedBox(height: 10,),

                          ProfileListItem(
                            icon: LineAwesomeIcons.cog,
                            text: Translate.SettingsText, onTap: () async{
                           await Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
                          },



                          ),
                          SizedBox(height: 10,),
                          ProfileListItem(
                            icon: LineAwesomeIcons.user_plus,
                            text: Translate.InivteFriendText, onTap: () {

                          },

                          ),
                          SizedBox(height: 10,),
                          ProfileListItem(
                            icon: LineAwesomeIcons.alternate_sign_out,
                            text: Translate.LogoutText,
                            hasNavigation: false, onTap: () {

                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title:  Text(Translate.LogoutText),
                                content:  Text(Translate.ContentLogout),
                                actions: [

                                  //btn cancel + btn sure
                                  Row(
                                    children: [
                                      //btn cancel
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(

                                            onPressed: () {
                                              Navigator.pop(ctx);
                                            },

                                            child: Text(Translate.CancelLogout),
                                          ),
                                        ),
                                      ),

                                      //btn sure
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: OutlinedButton(

                                            onPressed: () {
                                              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => false);

                                              /*  CacheHelper.put(key: tokenKey, value: "")
                                           .then((value) {
                                          token = "";
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoginScreen(),
                                            ),
                                                (Route<dynamic> route) => false,
                                          );
                                        });*/
                                            },
                                            child: Text(Translate.SureLogout),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },


                          ),

                        ],
                      ),
                    ),
                  )
        )

              ],
            ),
          )
      ),);



  }
}