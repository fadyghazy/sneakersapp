import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_store/cart/presentation/view/cart_screen.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/core/widgets/primary_button.dart';
import 'package:sneakers_store/core/widgets/sneakers_appbar.dart';
import 'package:sneakers_store/features/sneakers/Profile/model/usermodel.dart';
import 'package:sneakers_store/features/sneakers/bag/data/model/bag_model.dart';
import 'package:sneakers_store/features/sneakers/bag/view_model/cubit/bag_cubit.dart';
import 'package:sneakers_store/features/sneakers/bag/widgets/bag_body.dart';
import 'package:sneakers_store/features/sneakers/bag/widgets/bag_list.dart';
import 'package:sneakers_store/features/sneakers/bag/widgets/emptybagpage.dart';
import 'package:sneakers_store/features/sneakers/favourite/data/model/favourite_model.dart';
import 'package:sneakers_store/features/sneakers/favourite/view_model/cubit/favourite_cubit.dart';
import 'package:sneakers_store/features/sneakers/favourite/widgets/favourite_body.dart';
import 'package:sneakers_store/features/sneakers/main/view/widgets/navigation_page.dart';
import 'package:sneakers_store/translate.dart';
class FavouritePage extends NavigationPage {
  const FavouritePage({super.key}) : super(icon: Icons.favorite_outline);
  static const routeName = '/favorites';

  FavouriteDetails _sneakersDetails(List<FavouriteSneaker> favouritesneakers) {
    var favouriteDetails = FavouriteDetails();
    for (var sneaker in favouritesneakers) {
      favouriteDetails.totalCount += sneaker.count;
      favouriteDetails.totalSum += sneaker.price * sneaker.count;
    }
    return favouriteDetails;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, List<FavouriteSneaker>>(
      builder: (context, sneakers) {
        final details = _sneakersDetails(sneakers);
        return Scaffold(
          appBar: SneakerAppBar(
            height: 120,
            elevation: 2,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            subtitle: Translate.FavouriteText,
            subactions: [
              Text(
                '${Translate.TotalText} ${details.totalCount} ${Translate.Items}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          body: FavouriteBody()
        );
      },
    );
  }
}