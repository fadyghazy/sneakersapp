import 'package:flutter/material.dart';
import 'package:sneakers_store/core/widgets/large_title.dart';
import 'package:sneakers_store/features/sneakers/home/data/model/sneaker_model.dart';
import 'package:sneakers_store/features/sneakers/home/view/widgets/more_sneakers_card.dart';

class MoreContent extends StatelessWidget {
  const MoreContent({required this.sneakers, super.key});

  final List<Sneaker> sneakers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LargeTitle('More'),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.trending_flat,
                  size: 32,
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var sneaker in sneakers)
                Expanded(
                  child: MoreSneakerCard(sneaker: sneaker),
                ),
            ],
          ),
        ],
      ),
    );
  }
}