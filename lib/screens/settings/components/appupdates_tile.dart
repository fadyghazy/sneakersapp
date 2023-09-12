
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sneakers_store/screens/settings/components/settings_icon.dart';
import 'package:sneakers_store/translate.dart';

class AppUpdatesSettingsTile extends StatelessWidget {
  static const KeyAppUpdates='Key_appUpdates';
  const AppUpdatesSettingsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchSettingsTile(
      settingKey: KeyAppUpdates, title: '${Translate.Appupdates}',leading: SettingsIcon(color: Colors.green,icon: Icons.update,


    ),

    );
  }
}