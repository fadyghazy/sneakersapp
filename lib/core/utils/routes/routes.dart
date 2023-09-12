import 'package:flutter/material.dart';
import 'package:sneakers_store/features/sneakers/bag/view/bag_page.dart';
import 'package:sneakers_store/features/sneakers/home/data/model/sneaker_model.dart';
import 'package:sneakers_store/features/sneakers/main/view/main_page.dart';
import 'package:sneakers_store/features/sneakers/sneaker_details/view/sneaker-details_page.dart';
import 'fade_page_route.dart';

class Routes {
  static Route<dynamic>? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case MainPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
        );
      case BagPage.routeName:
        return MaterialPageRoute(
          builder: (context) =>  BagPage(),
        );
      case SneakerDetailsPage.routeName:
        return FadePageRoute(
          builder: (context) {
            final sneaker = settings.arguments as Sneaker;
            return SneakerDetailsPage(sneaker: sneaker);
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}