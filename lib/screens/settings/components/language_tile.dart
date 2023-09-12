
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sneakers_store/translate.dart';
import 'package:sneakers_store/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class LanguageTile extends StatefulWidget {
  static const KeyLanguage='Key-language';
  const LanguageTile({Key? key}) : super(key: key);
  @override
  State<LanguageTile> createState() => _LanguageTileState();
}

class _LanguageTileState extends State<LanguageTile> {
  @override
  Widget build(BuildContext context) {


    return DropDownSettingsTile(title:LocaleKeys.page_account_settings_language_text.tr(), settingKey:LanguageTile.KeyLanguage, selected:1, values:<int,String>{
    1:"${Translate.EnglishLanguageText}",
    2:"${Translate.SpanishLanguageText}",
    3:"${Translate.GermanLanguageText}",
    4:"${Translate.HindiLanguageText}",
      5:"${Translate.ArabicLanguageText}",
    },onChange: (selectedItem)async{
       if(selectedItem==1){
         await context.setLocale(Locale('en'));

       }else if(selectedItem==2){
         await context.setLocale(Locale('es'));
       }
       else if(selectedItem==3){
        await  context.setLocale(Locale('de'));
       }
       else if(selectedItem==4){
         await context.setLocale(Locale('hi'));
       }
       else {
        await context.setLocale(Locale('ar'));
       }


    },
    );
  }
}
