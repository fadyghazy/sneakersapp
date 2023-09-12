
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_store/cart/presentation/view/cart_screen.dart';
import 'package:sneakers_store/cart/presentation/view/widgets/body.dart';
import 'package:sneakers_store/cart/presentation/view/widgets/check_out_card.dart';
import 'package:sneakers_store/constants.dart';
import 'package:sneakers_store/core/widgets/primary_button.dart';
import 'package:sneakers_store/core/widgets/sneakers_appbar.dart';
import 'package:sneakers_store/features/sneakers/bag/data/model/bag_model.dart';
import 'package:sneakers_store/features/sneakers/bag/view_model/cubit/bag_cubit.dart';
import 'package:sneakers_store/features/sneakers/bag/widgets/bag_list.dart';
import 'package:sneakers_store/features/sneakers/main/view/widgets/navigation_page.dart';
import 'package:sneakers_store/screens/intro/model/intro_model.dart';
import 'package:sneakers_store/translate.dart';
class CartScreenBody extends NavigationPage {
  const CartScreenBody({super.key}) : super(icon: Icons.shopping_cart_outlined);
  static const routeName = '/cart';
  BagDetails _sneakersDetails(List<BagSneaker> sneakers) {
    var bagDetails = BagDetails();
    for (var sneaker in sneakers) {
      bagDetails.totalCount += sneaker.count;
      bagDetails.totalSum += sneaker.price * sneaker.count;
    }
    return bagDetails;
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagCubit, List<BagSneaker>>(
        builder: (context, sneakers) {
          final details = _sneakersDetails(sneakers);


          return Scaffold(
            appBar: AppBar(
              title: Column(
                children: [
                  Text(
                    Translate.CartMessageText,
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "${details.totalCount} ${Translate.Items}",
                    style: Theme
                        .of(context)
                        .textTheme
                        .caption,
                  ),
                ],
              ),
            ),
            body: Body(sneakers: sneakers,),
            bottomNavigationBar: const CheckoutCard()
          );
        }
    );

    }
  }