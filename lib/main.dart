import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/core/utils/userpreference1/userpreference1.dart';
import 'package:sneakers_store/data/data_provider/local/cache_helper.dart';
import 'package:sneakers_store/data/data_provider/remote/dio_helper.dart';
import 'package:sneakers_store/translations/codegen_loader.g.dart';
import 'myapplication.dart';
import 'package:easy_localization/easy_localization.dart';
void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await EasyLocalization.ensureInitialized();
 await UserPreferences.init();
 await UserPreferences1.init();
 await CacheHelper.init();
 await DioHelper.init();
 await Settings.init(cacheProvider: SharePreferenceCache());
   Stripe.publishableKey="pk_test_51N8BAnGWTAOnxPUSHtow8DEnfWiiPoAdoe7QxCKS4TR8vu3ZEo9SOJ4WC311H5Py2PwH7k8ksAnbfwGUH0pUt2bA00ZZp4hjYo";

 runApp(EasyLocalization(
     path: 'assets/translations',
     supportedLocales: [
       Locale('en'),Locale('ar'),Locale('es'),Locale('de'),Locale('hi'),
     ],
     fallbackLocale: Locale('en'),
     assetLoader: CodegenLoader(),
     child: const  MyApp()));
}
