import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_store/core/widgets/sneakers_appbar.dart';
import 'package:sneakers_store/core/widgets/square_icon_btn.dart';
import 'package:sneakers_store/features/sneakers/home/view/more_content.dart';
import 'package:sneakers_store/features/sneakers/home/view/sneakers_content.dart';
import 'package:sneakers_store/features/sneakers/home/view/widgets/top_container.dart';
import 'package:sneakers_store/features/sneakers/home/view_models/cubit/brand_cubit.dart';
import 'package:sneakers_store/features/sneakers/main/view/widgets/navigation_page.dart';
import 'package:sneakers_store/features/sneakers/sneaker_details/model/mock_s.dart';
import 'package:sneakers_store/translate.dart';



class HomePage extends NavigationPage {
  const HomePage({super.key}) : super(icon: Icons.home_outlined);


  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BrandCubit, int>(
      builder: (context, activeBrandIndex) {
        return Scaffold(
/*
          appBar:  SneakerAppBar(
            subtitle: Translate.SearchText,
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
          ),*/
          body:
                DefaultTabController(
                  length: mockSneakers.brands.length,
                  child: ListView(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
                        child: Column(
                          children: [
                            const TopContainer(title: "Fady Store", searchBarTitle: 'Search Product',),
                      TabBar(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        isScrollable: true,
                        onTap: context.read<BrandCubit>().updateIndex,
                        indicatorColor: Colors.transparent,
                        tabs: [
                          for (var i = 0; i < mockSneakers.brands.length; i++)
                            Tab(
                              child: Text(
                                mockSneakers.brands[i].name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: i == activeBrandIndex
                                      ? Colors.black
                                      : Colors.grey[400],
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(
                        height: 350,
                        child: SneakersContent(
                          brand: mockSneakers.brands[activeBrandIndex],
                        ),
                      ),
                      MoreContent(
                        sneakers: mockSneakers.more,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
