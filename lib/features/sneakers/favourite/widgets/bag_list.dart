import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_store/features/sneakers/bag/data/model/bag_model.dart';
import 'package:sneakers_store/features/sneakers/bag/view_model/cubit/bag_cubit.dart';
import 'package:sneakers_store/features/sneakers/bag/widgets/emptybagpage.dart';
import 'package:sneakers_store/features/sneakers/favourite/data/model/favourite_model.dart';
import 'package:sneakers_store/features/sneakers/favourite/view_model/cubit/favourite_cubit.dart';
import 'package:sneakers_store/translate.dart';

import '../../../../core/widgets/empty_page.dart';
import 'favourite_sneaker_card.dart';

class FavouriteList extends StatefulWidget {
  const FavouriteList({
    required this.favouritesneakers,
    super.key,
  });

  final List<FavouriteSneaker> favouritesneakers;

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  List<FavouriteSneaker> _favouritesneakers = [];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _favouritesneakers  = List.from(widget.favouritesneakers);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final latestSneakers = context.read<FavouriteCubit>().latestSneakers();

      for (var sneaker in latestSneakers.reversed) {
        await Future.delayed(const Duration(milliseconds: 300), () {
          _favouritesneakers .insert(0,sneaker);
          _listKey.currentState
              ?.insertItem(0, duration: const Duration(milliseconds: 200));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favouritesneakers.isEmpty) {
      return  EmptyBagPage(
        icon: Icons.shopping_cart_outlined,
        title: '${Translate.bagemptytext}',
      );
    }

    return AnimatedList(
      key: _listKey,
      physics: const BouncingScrollPhysics(),
      initialItemCount: _favouritesneakers .length,
      itemBuilder: (context, index, animation) {
        final favouriteSneaker = _favouritesneakers[index];
        return _buildItem(
          favouriteSneaker ,
          animation,
          onAdd: () {
            context.read<BagCubit>().addOne(favouriteSneaker.id);
          },
          onDelete: () {
            context.read<BagCubit>().removeOne(favouriteSneaker.id);

            final favouritesneaker = widget.favouritesneakers.firstWhereOrNull(
                  (element) => element.id == favouriteSneaker .id,
            );

            if (favouritesneaker  == null) {
              _favouritesneakers.removeAt(index);

              AnimatedList.of(context).removeItem(
                index,
                    (context, animation) => _buildItem(favouriteSneaker, animation),
              );
            }
          },
        );
      },
    );
  }

  Widget _buildItem(
      FavouriteSneaker favouriteSneaker,
      Animation<double> animation, {
        Function()? onDelete,
        Function()? onAdd,
      }) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: FavouriteSneakerCard(
          key: Key('${favouriteSneaker.id}item'),
          favouriteSneaker: favouriteSneaker,
          animation: animation,
          onDelete: onDelete,
        ),
      ),
    );
  }
}