
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_store/cart/presentation/view/cart_screen.dart';
import 'package:sneakers_store/core/widgets/primary_button.dart';
import 'package:sneakers_store/features/sneakers/bag/data/model/bag_model.dart';
import 'package:sneakers_store/features/sneakers/bag/view_model/cubit/bag_cubit.dart';
import 'package:sneakers_store/features/sneakers/bag/widgets/bag_list.dart';
import 'package:sneakers_store/features/sneakers/favourite/data/model/favourite_model.dart';
import 'package:sneakers_store/features/sneakers/favourite/favourite_list.dart';
import 'package:sneakers_store/features/sneakers/favourite/view_model/cubit/favourite_cubit.dart';
import 'package:sneakers_store/translate.dart';

class FavouriteBody extends StatefulWidget {
  const FavouriteBody({Key? key}) : super(key: key);

  FavouriteDetails _sneakersDetails(List<FavouriteSneaker> favouritesneakers) {



    var favouriteDetails = FavouriteDetails();
    for (var sneaker in favouritesneakers) {
      favouriteDetails.totalCount += sneaker.count;
      favouriteDetails.totalSum += sneaker.price * sneaker.count;
    }
    return favouriteDetails;
  }

  @override
  State<FavouriteBody> createState() => _FavouriteBodyState();
}

class _FavouriteBodyState extends State<FavouriteBody> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, List<FavouriteSneaker>>(
        builder: (context, sneakers) {
          final details = widget._sneakersDetails(sneakers);

          return SafeArea(
            top: false,
            child: Column(
              children: [
                Expanded(
                  child: FavouriteList(favouritesneakers: sneakers,),
                ),
              ],
            ),
          );
        });
  }
}
