import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../infrastructure/url_builder.dart';
import '../model/house_rm.dart';

class HouseRDS {
  HouseRDS({
    @required this.dio,
  }) : assert(dio != null);

  final Dio dio;

  Future<List<HouseRM>> getHouseList() => dio
      .get(
        UrlBuilder.houseList(),
      )
      .then(
        (response) => response.data
            .map((houseItem) => HouseRM.fromJson(houseItem))
            .toList()
            .cast<HouseRM>(),
      );
}
