import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_store/core/widgets/hero_color.dart';
import 'package:sneakers_store/core/widgets/hero_image.dart';
import 'package:sneakers_store/features/sneakers/bag/data/model/bag_model.dart';
import 'package:sneakers_store/features/sneakers/bag/view_model/cubit/bag_cubit.dart';
import 'package:sneakers_store/features/sneakers/favourite/data/model/favourite_model.dart';
import 'package:sneakers_store/features/sneakers/favourite/view_model/cubit/favourite_cubit.dart';
import 'package:sneakers_store/features/sneakers/home/data/model/sneaker_model.dart';

class SneakerDetailsAppBar extends StatefulWidget {
  const SneakerDetailsAppBar({required this.sneaker, super.key});
  final Sneaker sneaker;
  @override

  State<SneakerDetailsAppBar> createState() => _SneakerDetailsAppBarState();
}

class _SneakerDetailsAppBarState extends State<SneakerDetailsAppBar> {
  bool isFavourite=false;
  @override
  Widget build(BuildContext context) {
    final radius = MediaQuery.of(context).size.width / 1.4;
             return SliverAppBar(
               pinned: true,
               backgroundColor: widget.sneaker.color,
               expandedHeight: 350,
               toolbarHeight: 80,
               foregroundColor: widget.sneaker.estimatedColor,
               centerTitle: true,
               automaticallyImplyLeading: false,
               leading: IconButton(
                 icon: const Icon(Icons.keyboard_backspace),
                 onPressed: () => Navigator.pop(context),
               ),
               title: Text(
                 widget.sneaker.brandName,
                 style: TextStyle(
                   fontSize: 24,
                   color: widget.sneaker.estimatedColor,
                 ),
               ),
               flexibleSpace: FlexibleSpaceBar(
                 background: Stack(
                   children: [
                     Container(
                       color: Theme
                           .of(context)
                           .scaffoldBackgroundColor,
                       width: MediaQuery
                           .of(context)
                           .size
                           .width,
                       height: MediaQuery
                           .of(context)
                           .size
                           .height,
                     ),
                     Positioned(
                       top: -radius / 1.2,
                       right: -radius / 2,
                       child: HeroColor(
                         tag: '${widget.sneaker.id}color',
                         child: CircleAvatar(
                           radius: radius,
                           backgroundColor: widget.sneaker.color,
                         ),
                       ),
                     ),
                     Positioned(
                       top: 80,
                       left: 0,
                       right: 0,
                       child: HeroImage(
                         tag: '${widget.sneaker.id}image',
                         child: RotationTransition(
                           turns: const AlwaysStoppedAnimation(15 / 360),
                           child: Image.asset(
                             widget.sneaker.image,
                             height: 350,
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
               actions: [
                 Center(
                   child: Padding(
                     padding: const EdgeInsets.only(right: 16),
                     child: Material(
                       elevation: 3,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(80),
                       ),
                       clipBehavior: Clip.antiAliasWithSaveLayer,
                       color: widget.sneaker.color,
                       child: InkWell(
                         onTap: () {
    isFavourite != isFavourite;
    if(isFavourite==false){
    context.read<FavouriteCubit>().add(
    widget.sneaker);
    }else{
      context.read<FavouriteCubit>().removeOne(widget.sneaker.id);
    }
    },
                         child: Container(
                           padding: EdgeInsets.all(8),
                           child:isFavourite?Icon(
                             Icons.favorite_outline,
                             color: widget.sneaker.estimatedColor,
                           ):Icon(
                             Icons.favorite_outlined,color: Colors.red,
                           ),
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             );
           }
  }