import 'package:hive/hive.dart';

import '../model/house_cm.dart';

class HouseCDS {
  static const _houseList = 'houseList';

  Future<List<HouseCM>> getHouseList() async {
    final box = await Hive.openBox(_houseList);
    return box.get(0).cast<HouseCM>();
  }

  Future<void> upsertHouseList(List<HouseCM> houseList) async {
    final box = await Hive.openBox(_houseList);
    box.put(0, houseList);
  }
}
