
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_store/cart/presentation/view/cart_screen.dart';
import 'package:sneakers_store/core/widgets/primary_button.dart';
import 'package:sneakers_store/features/sneakers/bag/data/model/bag_model.dart';
import 'package:sneakers_store/features/sneakers/bag/view_model/cubit/bag_cubit.dart';
import 'package:sneakers_store/features/sneakers/bag/widgets/bag_list.dart';
import 'package:sneakers_store/translate.dart';

class BagBody extends StatefulWidget {
  const BagBody({Key? key}) : super(key: key);

  BagDetails _sneakersDetails(List<BagSneaker> sneakers) {



    var bagDetails = BagDetails();
    for (var sneaker in sneakers) {
      bagDetails.totalCount += sneaker.count;
      bagDetails.totalSum += sneaker.price * sneaker.count;
    }
    return bagDetails;
  }

  @override
  State<BagBody> createState() => _BagBodyState();
}

class _BagBodyState extends State<BagBody> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagCubit, List<BagSneaker>>(
        builder: (context, sneakers) {
          final details = widget._sneakersDetails(sneakers);

          return SafeArea(
            top: false,
            child: Column(
              children: [
                Expanded(
                  child: BagList(sneakers: sneakers),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Divider(height: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Translate.TotalText),
                          Text(
                            details.totalSumAsCurrency,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PrimaryButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()), (
                                route) => false);
                      },
                      title: Translate.AddToCartText,
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
