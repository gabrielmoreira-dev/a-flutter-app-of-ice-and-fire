import 'package:aflutterappoficeandfire/data/remote/model/house_rm.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class HouseRDS {
  HouseRDS({
    @required this.dio,
  }) : assert(dio != null);

  final Dio dio;

  Future<List<HouseRM>> getHouseList() =>
      dio.get('https://api.got.show/api/show/houses').then(
            (response) => response.data
                .map((houseData) => HouseRM.fromJson(houseData))
                .toList()
                .cast<HouseRM>(),
          );
}
