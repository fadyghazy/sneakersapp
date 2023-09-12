import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_store/features/sneakers/home/data/model/brand_model.dart';
import 'package:sneakers_store/features/sneakers/home/data/model/sneaker_model.dart';
import 'package:sneakers_store/features/sneakers/home/view/widgets/newsneaker_view.dart';
import 'package:sneakers_store/features/sneakers/home/view/widgets/sneakers_view.dart';
import 'package:sneakers_store/features/sneakers/home/view/widgets/upcomingsneaker_view.dart';
import 'package:sneakers_store/features/sneakers/home/view_models/cubit/sneaker_type_cubit.dart';

class SneakersContent extends StatelessWidget {
  const SneakersContent({
    required this.brand,
    super.key,
  });

  final Brand brand;

  static const sneakerTypes = [
    SneakerType.upcoming,
    SneakerType.featured,
    SneakerType.newModel
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SneakerTypeCubit, int>(
      builder: (context, activeTypeIndex) {
        final sneakers = brand.sneakersByType(sneakerTypes[activeTypeIndex]);

        return Stack(
          children: [
          Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(
            left: 16,
            top: 8,
            bottom: 16,
          ),
          child: Column(
            children: [
              for (var i = 0; i < sneakerTypes.length; i++)
                Expanded(
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: TextButton(
                      onPressed: () =>
                          context.read<SneakerTypeCubit>().updateIndex(i),
                      child: Text(
                        sneakerTypes[i].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: i == activeTypeIndex
                              ? Colors.black
                              : Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
            ), if (sneakers.isNotEmpty&&sneakerTypes[activeTypeIndex]==SneakerType.upcoming)UpcomingSneakersView(sneakers: sneakers)
            else if
              (sneakers.isNotEmpty&&sneakerTypes[activeTypeIndex]==SneakerType.featured) SneakersView(sneakers: sneakers)
              else if(sneakers.isNotEmpty&&sneakerTypes[activeTypeIndex]==SneakerType.newModel)NewSneakersView(sneakers: sneakers)
          ],
        );
      },
    );
  }
}