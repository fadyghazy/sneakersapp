// this localization class and here  inside we put then all the locals inside which our app should support
//and this means that we have different languages some translation files in our folders and in our case we will support your english ,arabic,hindian,spanish,german
//and if you want later to integrate another language then you can simply look up for language codes and then you can basically search here for your country for your language and then you can find here
// this code which you then put here inside ,now we have added supported languages we also want to add some translation for all the different languages in our system
import 'package:flutter/material.dart';
//now we also want to create all the other files to also put these translations inside
// i have created right now for each of the locals here a different file and now we can for example go inside hindi file and here we add then  the translation for this language key

class L10n{
  static final all=[
    const Locale('en'),//english language
    const Locale('ar'),//arabic language
    const Locale('hi'),//hindi language
    const Locale('es'),//spain language
    const Locale('de'),//german language


  ];
}