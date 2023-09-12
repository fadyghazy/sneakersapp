import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sneakers_store/core/widgets/empty_page.dart';
import 'package:sneakers_store/features/sneakers/bag/data/model/bag_model.dart';
import 'package:sneakers_store/features/sneakers/bag/view_model/cubit/bag_cubit.dart';
import 'package:sneakers_store/features/sneakers/bag/widgets/bag_sneaker_card.dart';
import 'package:sneakers_store/features/sneakers/bag/widgets/emptybagpage.dart';
import 'package:sneakers_store/translate.dart';

class Body extends StatefulWidget {
  const Body({
    required this.sneakers,
    super.key,
  });

  final List<BagSneaker> sneakers;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<BagSneaker> _sneakers = [];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _sneakers = List.from(widget.sneakers);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final latestSneakers = context.read<BagCubit>().latestSneakers();

      for (var sneaker in latestSneakers.reversed) {
        await Future.delayed(const Duration(milliseconds: 300), () {
          _sneakers.insert(0, sneaker);
          _listKey.currentState
              ?.insertItem(0, duration: const Duration(milliseconds: 200));
        });
      }
    });
  }
 @override
  Widget build(BuildContext context) {
   if (widget.sneakers.isEmpty) {
     return  EmptyBagPage(
       icon: Icons.shopping_cart_outlined,
       title: '${Translate.bagemptytext}',
     );
   }

   return AnimatedList(
     key: _listKey,
     physics: const BouncingScrollPhysics(),
     initialItemCount: _sneakers.length,
     itemBuilder: (context, index, animation) {
       final bagSneaker = _sneakers[index];

       return _buildItem(
         bagSneaker,
         animation,
         onAdd: () {
           context.read<BagCubit>().addOne(bagSneaker.id);
         },
         onDelete: () {
           context.read<BagCubit>().removeOne(bagSneaker.id);

           final sneaker = widget.sneakers.firstWhereOrNull(
                 (element) => element.id == bagSneaker.id,
           );

           if (sneaker == null) {
             _sneakers.removeAt(index);

             AnimatedList.of(context).removeItem(
               index,
                   (context, animation) => _buildItem(bagSneaker, animation),
             );
           }
         },
       );
     },
   );
 }

  Widget _buildItem(
      BagSneaker bagSneaker,
      Animation<double> animation, {
        Function()? onDelete,
        Function()? onAdd,
      }) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: BagSneakerCard(
          key: Key('${bagSneaker.id}item'),
          bagSneaker: bagSneaker,
          animation: animation,
          onDelete: onDelete,
          onAdd: onAdd,
        ),
      ),
    );
  }
}