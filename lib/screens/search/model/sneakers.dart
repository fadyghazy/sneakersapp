

import 'package:sneakers_store/features/sneakers/home/data/model/sneaker_model.dart';

import 'brand_model.dart';
class Sneakers {
  const Sneakers({
    required this.brands,
    required this.more,
  });

  final List<Brand> brands;
  final List<Sneaker> more;
}