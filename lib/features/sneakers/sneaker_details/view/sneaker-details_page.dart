import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_store/core/widgets/large_title.dart';
import 'package:sneakers_store/core/widgets/primary_button.dart';
import 'package:sneakers_store/features/sneakers/bag/view_model/cubit/bag_cubit.dart';
import 'package:sneakers_store/features/sneakers/home/data/model/sneaker_model.dart';
import 'package:sneakers_store/features/sneakers/sneaker_details/view/widgets/assets_components.dart';
import 'package:sneakers_store/features/sneakers/sneaker_details/view/widgets/description_component.dart';
import 'package:sneakers_store/features/sneakers/sneaker_details/view/widgets/sneaker_details_app_bar.dart';
import 'widgets/sizes_component.dart';

class SneakerDetailsPage extends StatefulWidget {
  const SneakerDetailsPage({required this.sneaker, super.key});

  final Sneaker sneaker;

  static const routeName = 'sneacker-detail';

  @override
  State<SneakerDetailsPage> createState() => _SneakerDetailsPageState();
}

class _SneakerDetailsPageState extends State<SneakerDetailsPage> {
  bool _visible = false;
  static const _duration = Duration(milliseconds: 300);
  final delay=2;

  @override
  void initState() {
    super.initState();
    Future.delayed(_duration, () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SneakerDetailsAppBar(sneaker: widget.sneaker),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        _AnimatedVisibility(
                          visible: _visible,
                          duration: _duration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                            FadeInDown(
                            delay: Duration(milliseconds: delay),
                    child:  AssetsComponent(assets:widget.sneaker.assets),
                            ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Divider(thickness: 3),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                FadeInDown(
                                delay: Duration(milliseconds: delay),
                                child:    LargeTitle(widget.sneaker.name),
                                ),

                          FadeInUp(
                            delay: Duration(milliseconds: delay),
                            child:    LargeTitle(widget.sneaker.priceAsCurrency),
                          ),
                                  ],
                                ),
                              ),
                          FadeInUp(
                            delay: Duration(milliseconds: delay),
                            child:   DescriptionComponent(
                                description: widget.sneaker.description,
                              ),
                          ),
                              const SizedBox(height: 24),
                          FadeInUp(
                            delay: Duration(milliseconds: delay),

                            child:    SizesComponent(sizes: widget.sneaker.sizes),
                          ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _AnimatedVisibility(
              visible: _visible,
              duration: _duration,
              child: FadeInUp(
              delay: Duration(milliseconds: delay),
    child:  PrimaryButton(
                onPressed: () => context.read<BagCubit>().add(widget.sneaker),
                title: 'Add to bag',
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}

class _AnimatedVisibility extends StatelessWidget {
  const _AnimatedVisibility({
    required this.visible,
    required this.duration,
    required this.child,
  });

  final bool visible;
  final Duration duration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: EdgeInsets.only(top: visible ? 0 : 50),
      duration: duration,
      child: AnimatedOpacity(
        opacity: visible ? 1 : 0,
        duration: duration,
        child: child,
      ),
    );
  }
}