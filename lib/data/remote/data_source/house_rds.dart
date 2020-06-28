import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../infrastructure/url_builder.dart';
import '../model/house_rm.dart';

class HouseRDS {
  HouseRDS({
    @required this.dio,
  }) : assert(dio != null);

  final Dio dio;

  /// Returns a list of [HouseRM] taking care to select only the data containing
  /// the image - data without an image is not interesting to the app.
  Future<List<HouseRM>> getHouseList() => dio
      .get(
        UrlBuilder.houseList,
      )
      .then(
        (response) => response.data
            .map((houseData) => HouseRM.fromJson(houseData))
            .toList()
            .cast<HouseRM>(),
      );
}
