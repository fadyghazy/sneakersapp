import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sneakers_store/core/widgets/dynamic_ink_well.dart';
import 'package:sneakers_store/core/widgets/hero_color.dart';
import 'package:sneakers_store/core/widgets/hero_image.dart';
import 'package:sneakers_store/core/widgets/large_title.dart';
import 'package:sneakers_store/features/sneakers/sneaker_details/view/sneaker-details_page.dart';
import '../../data/model/sneaker_model.dart';

class NewSneakerCard extends StatelessWidget {
  const NewSneakerCard({
    required this.sneaker,
    required this.size,
    super.key,
  });

  final Sneaker sneaker;
  final double size;

  @override
  Widget build(BuildContext context) {
    final estimatedColor = sneaker.estimatedColor;
    final cardRotateAngle = -pi / 10 * size;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: DynamicInkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                SneakerDetailsPage.routeName,
                arguments: sneaker,
              );
            },
            child: (tappedDown) => Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(cardRotateAngle),
              child: Stack(
                children: [
                  HeroColor(
                    tag: '${sneaker.id}color',
                    child: Container(
                      margin: const EdgeInsets.only(right: 36),
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(16)),
                        color: sneaker.color,
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            sneaker.brandName.toUpperCase(),
                            style: TextStyle(color: estimatedColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: LargeTitle(sneaker.shortName.toUpperCase(),
                                color: estimatedColor),
                          ),
                          Text(
                            sneaker.priceAsCurrency,
                            style: TextStyle(color: estimatedColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 42,
                    top: 4,
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite_outline,
                        color: estimatedColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    right: 42,
                    bottom: 4,
                    child: IconButton(
                      icon: Icon(
                        Icons.trending_flat,
                        color: estimatedColor,
                      ),
                      onPressed: () {},
                    ),
                  ),

                  Positioned(
                    left: 0,
                    child: Container(
                      height: 88,
                      width: 24,
                      color: Colors.pink,
                      alignment: Alignment.center,
                      child: const RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          'New',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: size * 200,
          top: 32,
          bottom: 32,
          child: DynamicInkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                SneakerDetailsPage.routeName,
                arguments: sneaker,
              );
            },
            child: (tappedDown) => HeroImage(
              tag: '${sneaker.id}image',
              child: AnimatedScale(
                scale: tappedDown ? 0.8 : 1.0,
                duration: const Duration(milliseconds: 100),
                child: Image.asset(
                  sneaker.image,
                  height: 50,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}