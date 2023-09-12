
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sneakers_store/screens/settings/components/settings_icon.dart';
import 'package:sneakers_store/translate.dart';

class ActivitySettingsTile extends StatelessWidget {
  static const KeyActivity ='Key_activity';
  const ActivitySettingsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchSettingsTile(
      settingKey: KeyActivity, title:Translate.AccountActivity,leading: SettingsIcon(color: Colors.orange,icon: Icons.person,


    ),

    );
  }
}
