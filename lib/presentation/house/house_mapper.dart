import 'package:domain/model/house.dart';

import 'house_models.dart';

extension HouseMapper on House {
  HouseVM toVM() => HouseVM(
        name: name,
        logoURL: logoURL,
      );
}

extension HouseListMapper on List<House> {
  List<HouseVM> toVM() => map(
        (houseItem) => houseItem.toVM(),
      ).toList()
        ..sort(
          (a, b) => a.name.compareTo(b.name),
        );
}
