import 'package:sneakers_store/core/utils/double/double.dart';
import 'package:sneakers_store/features/sneakers/home/data/model/sneaker_model.dart';
class Cart {
  Cart({
    required this.sneaker,

    required this.id,
    required this.count,
    required this.name,
    required this.image,
    required this.price,
  });
 final Sneaker sneaker;
  final int id;
  int count;
  final String name;
  final String image;
  final double price;

  double get total => price * count;

  String get totalAsCurrency => total.toCurrency();
}

class BagDetails {
  BagDetails({
    this.totalCount = 0,
    this.totalSum = 0,
  });

  int totalCount;
  double totalSum;

  String get totalSumAsCurrency => totalSum.toCurrency();
}