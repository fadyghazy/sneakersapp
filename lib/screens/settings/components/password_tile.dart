
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sneakers_store/translations/locale_keys.g.dart';
import'package:easy_localization/easy_localization.dart';
class PasswordTile extends StatelessWidget {
  static const KeyPassword='Key-password';
  const PasswordTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputSettingsTile(title:LocaleKeys.page_account_settings_password.tr(), settingKey:KeyPassword,obscureText: true,
      validator: (password)=>password!=null&&password.length>=6?null:"Enter 6 characters",


    );
  }
}
