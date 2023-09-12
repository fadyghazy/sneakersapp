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
import 'package:sneakers_store/features/sneakers/main/view/widgets/navigation_page.dart';
import 'package:sneakers_store/translate.dart';
class BagPage extends NavigationPage {
  const BagPage({super.key}) : super(icon: Icons.shopping_cart_outlined);
  static const routeName = '/bag';

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
          appBar: SneakerAppBar(
            height: 120,
            elevation: 2,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            subtitle: Translate.BagText,
            subactions: [
              Text(
                '${Translate.TotalText} ${details.totalCount} ${Translate.Items}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          body: BagBody()
        );
      },
    );
  }
}