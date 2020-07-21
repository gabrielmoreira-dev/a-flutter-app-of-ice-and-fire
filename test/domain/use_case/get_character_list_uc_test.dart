import 'package:domain/data_repository/character_data_repository.dart';
import 'package:domain/model/character.dart';
import 'package:domain/use_case/get_character_list_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CharacterRepositoryMock extends Mock implements CharacterDataRepository {}

void main() {
  GetCharacterListUC uc;
  CharacterDataRepository repository;

  final houseStark = 'House Stark';
  final aryaStark = 'Arya Stark';
  final branStark = 'Bran Stark';
  final houseLannister = 'House Lannister';
  final jaimeLannister = 'Jaime Lannister';
  final houseGreyjoy = 'House Greyjoy';

  final characterList = [
    Character(
      name: aryaStark,
      house: houseStark,
      image: 'arya.png',
    ),
    Character(
      name: branStark,
      house: houseStark,
      image: 'bran.png',
    ),
    Character(
      name: jaimeLannister,
      house: houseLannister,
      image: 'jaime.png',
    ),
  ];

  setUp(() {
    repository = CharacterRepositoryMock();
    uc = GetCharacterListUC(
      repository: repository,
    );
  });

  test(
    'Should return a list containing the House Stark characters',
    () async {
      when(
        repository.getCharacterList(any),
      ).thenAnswer(
        (invocation) async => characterList
            .where(
              (item) => item.name == invocation.positionalArguments[0],
            )
            .toList(),
      );

      final result = await uc.getFuture(
        params: GetCharacterListUCParams(houseName: houseStark),
      );

      expect(
        result,
        characterList.where((element) => element.name == houseStark).toList(),
      );
      verify(repository.getCharacterList(houseStark));
      verifyNoMoreInteractions(repository);
    },
  );

  test(
    'Should return a list containing the House Lannister characters',
    () async {
      when(
        repository.getCharacterList(any),
      ).thenAnswer(
        (invocation) async => characterList
            .where(
              (item) => item.name == invocation.positionalArguments[0],
            )
            .toList(),
      );

      final result = await uc.getFuture(
        params: GetCharacterListUCParams(
          houseName: houseLannister,
        ),
      );

      expect(
        result,
        characterList
            .where((element) => element.name == houseLannister)
            .toList(),
      );
      verify(repository.getCharacterList(houseLannister));
      verifyNoMoreInteractions(repository);
    },
  );

  test(
    'Should return a empty list',
    () async {
      when(
        repository.getCharacterList(any),
      ).thenAnswer(
        (invocation) async => characterList
            .where(
              (item) => item.name == invocation.positionalArguments[0],
            )
            .toList(),
      );

      final result = await uc.getFuture(
        params: GetCharacterListUCParams(
          houseName: houseGreyjoy,
        ),
      );

      expect(result, []);
      verify(repository.getCharacterList(houseGreyjoy));
      verifyNoMoreInteractions(repository);
    },
  );
}
