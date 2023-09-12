
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sneakers_store/screens/settings/components/language_tile.dart';
import 'package:sneakers_store/screens/settings/components/location_tile.dart';
import 'package:sneakers_store/screens/settings/components/password_tile.dart';
import 'package:sneakers_store/screens/settings/components/settings_icon.dart';
import'package:easy_localization/easy_localization.dart';
import 'package:sneakers_store/translate.dart';
import 'package:sneakers_store/translations/locale_keys.g.dart';
class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {

    return SimpleSettingsTile(title:Translate.PageAccountSettingsNameText,subtitle: '${Translate.PrivacyText},${Translate.PageAccountSettingsPageSession1},${Translate.PageAccountSettingsLanguageText}',leading: SettingsIcon(icon: Icons.person, color:Colors.green),
      child: SettingsScreen(
        title:LocaleKeys.page_account_settings_name_text.tr() ,
        children: [
          LanguageTile(),
          LocationTile(),
          PasswordTile(),
          SimpleSettingsTile(title:LocaleKeys.page_account_settings_page_session.tr(),subtitle: '',leading: SettingsIcon(icon: Icons.lock,color: Colors.blue,),
            onTap: ()=>ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(Translate.ClickedPrivacy))),),
          SimpleSettingsTile(title: LocaleKeys.page_account_settings_page_session1.tr(),subtitle: '',leading: SettingsIcon(icon: Icons.security,color: Colors.red,),
            onTap: ()=>ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(Translate.ClickedSecurity))),),
          SimpleSettingsTile(title: LocaleKeys.page_account_settings_page_subtitle3.tr(),subtitle: '',leading: SettingsIcon(icon: Icons.account_circle_outlined,color: Colors.purple,),
            onTap: ()=>ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(Translate.ClickedAccountInfo))),)
        ],

      ),
    );
  }
}
