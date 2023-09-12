
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';
import 'package:sneakers_store/business_logic/auth/login/login_cubit.dart';
import 'package:sneakers_store/business_logic/auth/signup/signup_cubit.dart';
import 'package:sneakers_store/business_logic/terms/terms_cubit.dart';
import 'package:sneakers_store/core/utils/routes/routes.dart';
import 'package:sneakers_store/core/utils/theme/theme.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/features/sneakers/bag/view_model/cubit/bag_cubit.dart';
import 'package:sneakers_store/features/sneakers/favourite/view_model/cubit/favourite_cubit.dart';
import 'package:sneakers_store/features/sneakers/home/view_models/cubit/brand_cubit.dart';
import 'package:sneakers_store/features/sneakers/home/view_models/cubit/sneaker_type_cubit.dart';
import 'package:sneakers_store/features/sneakers/main/view_models/cubit/page_cubit.dart';
import 'package:sneakers_store/screens/settings/components/darkmode_tile.dart';
import 'package:sneakers_store/screens/splash/presentation/view/splash_view2.dart';
import 'package:easy_localization/easy_localization.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final user=UserPreferences.getUser();
    final isDarkMode=Settings.getValue<bool>(DarkModeTile.KeyDarkMode,defaultValue: true);

    return
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TermsCubit(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => SignupCubit(),
          ),
        BlocProvider(
        create: (context) => BrandCubit(),
    ),
    BlocProvider(
    create: (context) => SneakerTypeCubit(),
    ),
    BlocProvider(
    create: (context) => BagCubit(),
    ),
    BlocProvider(
    create: (context) => PageCubit(),
    ),
          BlocProvider(
            create: (context) => FavouriteCubit(),
          ),
    ],
      child:
    ThemeProvider(
    initTheme: user.isDarkMode?MyThemes.kDarkTheme:MyThemes.kLightTheme,
    builder: (context, myTheme) =>

        ValueChangeObserver<bool>(
      defaultValue: true,
          cacheKey:DarkModeTile.KeyDarkMode,
          builder: (_,isDarkMode,__)=>

            GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Sneakers Store',
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
               theme: isDarkMode?MyThemes.kDarkTheme:MyThemes.kLightTheme,
                  onGenerateRoute: Routes.onGenerate,
                  home: const SneakerSplashView(),

          )
        ),
          )
    );



  }
}

