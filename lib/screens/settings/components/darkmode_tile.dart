
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sneakers_store/screens/settings/components/settings_icon.dart';
import 'package:sneakers_store/translate.dart';

class DarkModeTile extends StatelessWidget {
  static const KeyDarkMode='Key_dark_mode';
  const DarkModeTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchSettingsTile(settingKey:KeyDarkMode, title:Translate.DarkModeText,leading: SettingsIcon(icon:Icons.dark_mode,color: Color(0xff642ef3),),onChange: (_){

    },
    );
  }
}
