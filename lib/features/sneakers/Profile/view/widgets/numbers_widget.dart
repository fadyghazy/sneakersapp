
import 'package:flutter/material.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/number_button.dart';
import 'package:sneakers_store/features/sneakers/Profile/view/widgets/number_divider.dart';
import 'package:sneakers_store/translate.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NumberButton(value: "4.8", text:"${Translate.RankingText}"),
          NumberDivider(),
          NumberButton(value: "35", text:"${Translate.FollowingText}"),
          NumberDivider(),
          NumberButton(value: "50", text:"${Translate.FollowersText}"),
          NumberDivider()

        ],
      ),
    );
  }
}
