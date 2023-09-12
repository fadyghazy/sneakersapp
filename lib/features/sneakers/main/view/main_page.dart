import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/profile_screen.dart';
import 'package:sneakers_store/features/sneakers/favourite/view/favourite_page.dart';
import 'package:sneakers_store/features/sneakers/map/view/map_page.dart';
import 'package:sneakers_store/screens/order_tracking_page/order_tracking_page.dart';
import 'package:sneakers_store/screens/order_tracking_page/widgets/map_screen.dart';
import '../../bag/view/bag_page.dart';
import '../../favourite/favourite_page.dart';
import '../../home/view/home_page.dart';
import '../view_models/cubit/page_cubit.dart';

/*const SneakerAppBar(
            subtitle: 'Discover',
            subactions: [
              SquareIconButton(
                iconSize: 30,
                icon: Icons.search,
              ),
              SizedBox(width: 12),
              SquareIconButton(
                iconSize: 30,
                icon: Icons.notifications_outlined,
              ),
            ],
          ),

 */
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const routeName = '/';
  static const pages = [
    HomePage(),
    FavouritePage(),
   // MapView(),
    BagPage(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: pages[state],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: (value) {
              if (pages[value] is BagPage) {
                Navigator.pushNamed(context, BagPage.routeName);
              } else {
                context.read<PageCubit>().updateIndex(value);
              }
            },
            items: [
              for (var page in pages)
                BottomNavigationBarItem(
                  icon: Icon(page.icon),
                  label: '',
                ),
            ],
          ),
        );
      },
    );
  }
}