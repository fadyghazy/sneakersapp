import 'package:sneakers_store/core/utils/double/double.dart';
class FavouriteSneaker {
  FavouriteSneaker({
    required this.id,
    required this.count,
    required this.name,
    required this.image,
    required this.price,
  });

  final int id;
  int count;
  final String name;
  final String image;
  final double price;

  double get total => price * count;

  String get totalAsCurrency => total.toCurrency();
}

class FavouriteDetails {
  FavouriteDetails({
    this.totalCount = 0,
    this.totalSum = 0,
  });

  int totalCount;
  double totalSum;

  String get totalSumAsCurrency => totalSum.toCurrency();
}