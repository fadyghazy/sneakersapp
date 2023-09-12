
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sneakers_store/screens/settings/components/activity_settings_tile.dart';
import 'package:sneakers_store/screens/settings/components/appupdates_tile.dart';
import 'package:sneakers_store/screens/settings/components/news_letters_settings_tile.dart';
import 'package:sneakers_store/screens/settings/components/news_settings_tile.dart';
import 'package:sneakers_store/screens/settings/components/settings_icon.dart';
import 'package:sneakers_store/translate.dart';

class NotificationPage extends StatelessWidget {
  static const KeyNews= 'Key_news';
  static const KeyActivity ='Key_activity';
  static const KeyNewsletter ='Key_newsletter';
  static const KeyAppUpdates='Key_appUpdates';
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(title:'${Translate.Notifications}',subtitle: '${Translate.Newsletter}, ${Translate.Appupdates}',leading: SettingsIcon(color: Colors.redAccent,icon:Icons.notifications,
      
    ),
      child: SettingsScreen(title: "${Translate.Notifications}",
        children: [
        NewsSettingsTile(),
        ActivitySettingsTile(),
        NewsLetterSettingsTile(),
        AppUpdatesSettingsTile(),
      ],

      ),
    );
  }
}
