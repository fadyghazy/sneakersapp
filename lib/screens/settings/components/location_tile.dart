
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sneakers_store/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class LocationTile extends StatelessWidget {
  static const KeyLocation='Key-location';
  const LocationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputSettingsTile(title:LocaleKeys.page_account_settings_location_text.tr(), settingKey:KeyLocation,initialValue: 'Australia',
    onChange: (location){
      /*Noop*/
    },
    );
  }
}
