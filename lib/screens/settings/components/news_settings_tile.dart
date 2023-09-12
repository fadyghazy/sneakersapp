
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sneakers_store/screens/settings/components/settings_icon.dart';
import 'package:sneakers_store/translate.dart';

class NewsSettingsTile extends StatelessWidget {
  static const KeyNews= 'Key_news';
  const NewsSettingsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchSettingsTile(
      settingKey: KeyNews, title: '${Translate.NewsForYou}',leading: SettingsIcon(color: Colors.blue,icon: Icons.message,


    ),

    );
  }
}


