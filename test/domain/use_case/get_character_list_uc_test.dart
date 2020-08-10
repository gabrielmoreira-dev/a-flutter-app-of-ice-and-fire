import 'package:domain/data_repository/character_data_repository.dart';
import 'package:domain/model/character.dart';
import 'package:domain/use_case/get_character_list_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CharacterRepositoryMock extends Mock implements CharacterDataRepository {}

void main() {
  GetCharacterListUC uc;
  CharacterDataRepository repository;

  const houseStark = 'House Stark';
  const houseLannister = 'House Lannister';
  final houseGreyjoy = 'House Greyjoy';

  final characterList = [
    Character(
      name: 'Arya Stark',
      house: houseStark,
      image: 'arya.png',
    ),
    Character(
      name: 'Bran Stark',
      house: houseStark,
      image: 'bran.png',
    ),
    Character(
      name: 'Jaime Lannister',
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

  group('Get character list', () {
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

        expect(
          await uc.getFuture(
            params: GetCharacterListUCParams(houseName: houseStark),
          ),
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

        expect(
          await uc.getFuture(
            params: GetCharacterListUCParams(
              houseName: houseLannister,
            ),
          ),
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

        expect(
          await uc.getFuture(
            params: GetCharacterListUCParams(
              houseName: houseGreyjoy,
            ),
          ),
          [],
        );
        verify(repository.getCharacterList(houseGreyjoy));
        verifyNoMoreInteractions(repository);
      },
    );
  });

  group('Get character list exceptions', () {
    test(
      'Should throw an error when calling getCharacterList method',
      () {
        when(
          repository.getCharacterList(any),
        ).thenThrow(
          Exception(),
        );

        expect(
          () async => await uc.getFuture(
            params: GetCharacterListUCParams(
              houseName: houseGreyjoy,
            ),
          ),
          throwsException,
        );
        verify(repository.getCharacterList(houseGreyjoy));
        verifyNoMoreInteractions(repository);
      },
    );
  });
}
