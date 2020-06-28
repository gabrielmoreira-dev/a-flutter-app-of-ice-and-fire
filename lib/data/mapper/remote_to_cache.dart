import '../cache/model/house_cm.dart';
import '../remote/model/house_rm.dart';

extension HouseRMMapper on HouseRM {
  HouseCM toCM() => HouseCM(
        name: name,
        logoURL: logoURL,
      );
}

extension HouseListRMMapper on List<HouseRM> {
  List<HouseCM> toCM() => map(
        (houseItem) => houseItem.toCM(),
      )
          .where(
            (houseItem) => houseItem.logoURL != null,
          )
          .toList();
}
