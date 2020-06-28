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
    @required this.logoURL,
  })  : assert(name != null),
        assert(logoURL != null);

  final String name;
  final String logoURL;
}

abstract class HouseEvent {}

class OnTryAgainEvent extends HouseEvent {}

class OnInitEvent extends HouseEvent {}
