import 'package:domain/data_repository/house_data_repository.dart';
import 'package:domain/model/house.dart';
import 'package:domain/use_case/get_house_list_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HouseRepositoryMock extends Mock implements HouseDataRepository {}

void main() {
  GetHouseListUC uc;
  HouseDataRepository repository;

  final houseList = [
    House(
      name: 'House 1',
      logoURL: 'house1.png',
    ),
    House(
      name: 'House 2',
      logoURL: 'house2.png',
    ),
  ];

  setUp(
    () {
      repository = HouseRepositoryMock();
      uc = GetHouseListUC(
        repository: repository,
      );
    },
  );

  test(
    'Should return a house list',
    () async {
      when(
        repository.getHouseList(),
      ).thenAnswer(
        (_) async => houseList,
      );

      final result = await uc.getFuture();

      expect(result, houseList);
      verify(repository.getHouseList());
      verifyNoMoreInteractions(repository);
    },
  );
}
