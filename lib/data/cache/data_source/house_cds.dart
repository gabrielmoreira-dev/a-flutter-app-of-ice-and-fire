import 'package:hive/hive.dart';

import '../model/house_cm.dart';

class HouseCDS {
  static const _houseList = 'houseList';

  Future<List<HouseCM>> getHouseList() async {
    try {
      final box = await Hive.openBox(_houseList);
      return box.getAt(0).cast<HouseCM>();
    } catch (_) {
      return <HouseCM>[];
    }
  }

  Future<void> upsertHouseList(List<HouseCM> houseList) async {
    final box = await Hive.openBox(_houseList);
    box.putAt(0, houseList);
  }
}
