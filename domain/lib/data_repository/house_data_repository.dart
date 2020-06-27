import 'package:domain/model/house.dart';

abstract class HouseDataRepository {
  Future<List<House>> getHouseList();
}
