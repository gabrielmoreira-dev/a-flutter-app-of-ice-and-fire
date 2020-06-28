import 'package:domain/data_repository/house_data_repository.dart';
import 'package:domain/model/house.dart';
import 'package:flutter/foundation.dart';

import '../cache/data_source/house_cds.dart';
import '../mapper/cache_to_domain.dart';
import '../mapper/remote_to_cache.dart';
import '../remote/data_source/house_rds.dart';

class HouseRepository extends HouseDataRepository {
  HouseRepository({
    @required this.houseCDS,
    @required this.houseRDS,
  })  : assert(houseCDS != null),
        assert(houseRDS != null);

  final HouseCDS houseCDS;
  final HouseRDS houseRDS;

  @override
  Future<List<House>> getHouseList() => houseRDS
      .getHouseList()
      .then(
        (houseList) => houseList.toCM(),
      )
      .then(
        (houseListCM) => houseCDS.upsertHouseList(houseListCM).then(
              (_) => houseListCM.toDM(),
            ),
      )
      .catchError(
        (_) => houseCDS.getHouseList().then(
              (houseListCM) => houseListCM.toDM(),
            ),
      );
}
