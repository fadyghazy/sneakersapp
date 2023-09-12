import 'package:flutter/material.dart';
class SlidingImage extends StatelessWidget {
  const SlidingImage({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (BuildContext context, _) {
        return SlideTransition
          (
            position:slidingAnimation ,
            child:CircleAvatar(

              backgroundImage:AssetImage("assets/images/20201225201649583970.jpg") ,
              radius:40,));
      },

    );

  }

}