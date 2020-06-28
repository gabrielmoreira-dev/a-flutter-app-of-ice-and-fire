import 'package:domain/model/house.dart';

import '../cache/model/house_cm.dart';

extension HouseCMMapper on HouseCM {
  House toDM() => House(
        name: name,
        image: image,
      );
}

extension HouseListCMMapper on List<HouseCM> {
  List<House> toDM() => map(
        (houseItem) => houseItem.toDM(),
      ).toList();
}
