import 'package:domain/model/house.dart';

import 'house_models.dart';

extension HouseMapper on House {
  HouseVM toVM() => HouseVM(
        name: name,
        logoURL: logoURL,
      );
}
