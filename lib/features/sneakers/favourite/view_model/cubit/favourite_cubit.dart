
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_store/core/utils/user_preferences/user_preferences.dart';
import 'package:sneakers_store/features/sneakers/bag/data/model/bag_model.dart';
import 'package:sneakers_store/features/sneakers/favourite/data/model/favourite_model.dart';
import '../../../home/data/model/sneaker_model.dart';


class FavouriteCubit extends Cubit<List<FavouriteSneaker>> {
  FavouriteCubit() : super([]);
  final _latestSneakers = <FavouriteSneaker>[];

  List<FavouriteSneaker> latestSneakers() {
    var result = <FavouriteSneaker>[];
    if (_latestSneakers.isNotEmpty) {
      result = List<FavouriteSneaker>.from(_latestSneakers.reversed);
      _latestSneakers.clear();

      emit(List<FavouriteSneaker>.from([...result, ...state]));
    }

    return result;
  }

  void add(Sneaker sneaker) {
    final favouriteSneaker = state.firstWhereOrNull(
          (element) => element.id == sneaker.id,
    );

    if (favouriteSneaker != null) {
      if (favouriteSneaker.count < 20) {
        favouriteSneaker.count += 1;
      }
    } else {
      _latestSneakers.add(
        FavouriteSneaker(
          id: sneaker.id,
          count: 1,
          name: sneaker.name,
          image: sneaker.image,
          price: sneaker.price,
        ),
      );
    }
  }

  void addOne(int id) {
    final favouriteSneaker = state.firstWhereOrNull(
          (element) => element.id == id,
    );

    if (favouriteSneaker != null && favouriteSneaker.count < 20) {
      favouriteSneaker.count += 1;

      emit(List<FavouriteSneaker>.from(state));
    }
  }

  void removeOne(int id) {
    final favouriteSneaker = state.firstWhereOrNull(
          (element) => element.id == id,
    );

    if (favouriteSneaker != null) {
      if (favouriteSneaker.count == 1) {
        state.remove(favouriteSneaker);
      } else {
        favouriteSneaker.count -= 1;
      }
    }

    emit(List<FavouriteSneaker>.from(state));
  }
}