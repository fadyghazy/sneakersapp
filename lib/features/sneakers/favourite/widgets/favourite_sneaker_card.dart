import 'package:flutter/material.dart';
import 'package:sneakers_store/features/sneakers/bag/data/model/bag_model.dart';
import 'package:sneakers_store/features/sneakers/favourite/data/model/favourite_model.dart';

import '../../../../core/widgets/large_title.dart';
import '../../../../core/widgets/square_icon_btn.dart';
class FavouriteSneakerCard extends StatelessWidget {
  const FavouriteSneakerCard({
    required this.favouriteSneaker,
    required this.animation,
    this.onDelete,
   // this.onAdd,
    super.key,
  });
  final FavouriteSneaker favouriteSneaker;
  final Animation<double> animation;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ScaleTransition(
                  scale: animation.drive(Tween(begin: 0.0, end: 1.0)
                      .chain(CurveTween(curve: Curves.linear))),
                  child: Container(
                    margin: const EdgeInsets.only(top: 24, right: 42),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[100],
                      borderRadius: const BorderRadius.all(Radius.circular(32)),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  left: 0,
                  bottom: 0,
                  child: ScaleTransition(
                    scale: animation.drive(TweenSequence([
                      TweenSequenceItem(
                        tween: Tween(begin: 0.0, end: 1.0),
                        weight: 4,
                      ),
                      TweenSequenceItem(
                        tween: Tween(begin: 1.0, end: 0.8),
                        weight: 1,
                      ),
                      TweenSequenceItem(
                        tween: Tween(begin: 0.8, end: 0.9),
                        weight: 1,
                      )
                    ]).chain(CurveTween(curve: Curves.linear))),
                    child: Image.asset(
                      favouriteSneaker.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _BagSlideTransition(
                    animation: animation,
                    beginX: 0.1,
                    child: Text(favouriteSneaker.name),
                  ),
                  const SizedBox(height: 12),
                 /* _BagSlideTransition(
                    animation: animation,
                    beginX: 0.2,
                    child: LargeTitle(favouriteSneaker.totalAsCurrency),
                  ),*/
                  const SizedBox(height: 12),
                  _BagSlideTransition(
                    animation: animation,
                    beginX: 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareIconButton(
                          onTap: onDelete,
                          icon: Icons.delete,
                        ),
                      /*  Container(
                          width: 40,
                          alignment: Alignment.center,
                          child: Text(favouriteSneaker.count.toString()),
                        ),
                       SquareIconButton(
                          onTap: onAdd,
                          icon: Icons.add,
                        ),*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BagSlideTransition extends SlideTransition {
  _BagSlideTransition({
    required super.child,
    required Animation<double> animation,
    required double beginX,
  }) : super(
    position: animation.drive(
      Tween(
        begin: Offset(beginX, 0),
        end: Offset.zero,
      ),
    ),
  );
}
