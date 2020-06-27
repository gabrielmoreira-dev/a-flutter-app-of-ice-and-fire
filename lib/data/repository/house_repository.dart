import 'package:domain/data_repository/house_data_repository.dart';
import 'package:domain/model/house.dart';
import 'package:flutter/foundation.dart';

import '../cache/data_source/house_cds.dart';
import '../mapper/cache_to_domain.dart';
import '../mapper/remote_to_cache.dart';
import '../mapper/remote_to_domain.dart';
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
  Future<List<House>> getHouseList() =>
      houseRDS.getHouseList().then((houseList) {
        houseList.forEach((element) {
          print(element.name);
        });
        return houseCDS
            .upsertHouseList(
              houseList
                  .map(
                    (houseItem) => houseItem.toCM(),
                  )
                  .toList(),
            )
            .then(
              (_) => houseList
                  .map(
                    (houseItem) => houseItem.toDM(),
                  )
                  .toList(),
            );
      }).catchError(
        () => houseCDS.getHouseList().then(
              (houseList) => houseList
                  .map(
                    (houseItem) => houseItem.toDM(),
                  )
                  .toList(),
            ),
      );
}
