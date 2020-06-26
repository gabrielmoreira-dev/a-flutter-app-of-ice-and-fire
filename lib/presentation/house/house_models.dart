import 'package:flutter/foundation.dart';

abstract class HouseState {}

class Success extends HouseState {
  Success({
    @required this.houseList,
  }) : assert(houseList != null);

  final List<HouseVM> houseList;
}

class Loading extends HouseState {}

class Error extends HouseState {}

class HouseVM {
  HouseVM({
    @required this.name,
    this.image,
  }) : assert(name != null);

  final String name;
  final String image;
}
