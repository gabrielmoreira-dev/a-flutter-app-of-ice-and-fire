import 'package:domain/data_repository/house_data_repository.dart';
import 'package:domain/model/house.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:meta/meta.dart';

class GetHouseListUC extends UseCase<void, List<House>> {
  GetHouseListUC({
    @required this.repository,
  }) : assert(repository != null);

  final HouseDataRepository repository;

  @override
  Future<List<House>> getRawFuture({void params}) => repository.getHouseList();
}
