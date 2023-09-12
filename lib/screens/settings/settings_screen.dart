
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/screens/settings/components/account_page.dart';
import 'package:sneakers_store/screens/settings/components/darkmode_tile.dart';
import 'package:sneakers_store/screens/settings/components/notifications_page.dart';
import 'package:sneakers_store/screens/settings/components/profile_settings_icon.dart';
import 'package:sneakers_store/screens/settings/components/setting_header.dart';
import 'package:sneakers_store/screens/settings/components/settings_icon.dart';
import 'package:sneakers_store/translate.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    Size size=MediaQuery.of(context).size;
    return ThemeSwitchingArea(
        child:Builder(builder: (context)=> Scaffold(
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.all(24),
                children: [
                  SettingsHeader(),
                  ProfileSettingsIcon(),
                  DarkModeTile(),
                  SettingsGroup(
                      title: Translate.PageAccountSettingsPageSession,
                      children: [
                        AccountPage(),
                        NotificationPage(),
                        SimpleSettingsTile(title:Translate.LogoutText,
                          subtitle: '',
                          leading: SettingsIcon(icon: Icons.logout, color: Colors.blue),
                          onTap: () {
                            Settings.clearCache();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(Translate.ClickedLogout)));

                          }
                        ),SimpleSettingsTile(title:Translate.DeleteAccount,
                          subtitle: '',
                          leading: SettingsIcon(icon: Icons.delete, color: Colors.redAccent,),
                          onTap: ()=>ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(Translate.ClickedDeleteAccount))),
                        ),
                      ]
                  ),
                  const SizedBox(
                     height: 32,
                  ),
                  SettingsGroup(title:Translate.FEEDBACK, children: [
                    const SizedBox(
                      height: 8,
                    ),
                    SimpleSettingsTile(title:Translate.ReportABug,
                      subtitle: '',
                      leading: SettingsIcon(icon: Icons.bug_report, color: Colors.teal,),
                      onTap: ()=>ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(Translate.ClickedReportABug))),
                    ),SimpleSettingsTile(title:Translate.SendFeedback,
                      subtitle: '',
                      leading: const SettingsIcon(icon: Icons.thumb_up, color: Colors.purple,),
                         onTap: ()=>ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(content: Text(Translate.ClickedSendFeedBack))),
                    ),

                  ])
                ]
            )
        )
    )
        )

    );

  }
  
}