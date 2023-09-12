
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sneakers_store/screens/settings/components/settings_icon.dart';
import 'package:sneakers_store/translate.dart';

class NewsLetterSettingsTile extends StatelessWidget {
  static const KeyNewsletter ='Key_newsletter';
  const NewsLetterSettingsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchSettingsTile(
      settingKey: KeyNewsletter, title: '${Translate.Newsletter}',leading: SettingsIcon(color: Colors.red,icon: Icons.text_snippet,


    ),

    );
  }
}