import 'package:domain/data_repository/character_data_repository.dart';
import 'package:domain/model/character_details.dart';
import 'package:domain/use_case/get_character_details_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CharacterRepositoryMock extends Mock implements CharacterDataRepository {}

void main() {
  GetCharacterDetailsUC uc;
  CharacterDataRepository repository;

  final jonSnow = 'Jon Snow';

  final characterSet = {
    jonSnow: CharacterDetails(
      name: jonSnow,
      image: 'jonSnow.png',
      titles: [],
      culture: [],
    ),
  };

  setUp(() {
    repository = CharacterRepositoryMock();
    uc = GetCharacterDetailsUC(
      repository: repository,
    );
  });

  test('Should return the character Jon Snow', () async {
    when(
      repository.getCharacterDetails(any),
    ).thenAnswer(
      (invocation) async => characterSet[invocation.positionalArguments[0]],
    );

    final result = await uc.getFuture(
      params: GetCharacterDetailsUCParams(name: jonSnow),
    );

    expect(result, characterSet[jonSnow]);
    verify(repository.getCharacterDetails(jonSnow));
    verifyNoMoreInteractions(repository);
  });

  test('Should return null', () async {
    when(
      repository.getCharacterDetails(any),
    ).thenAnswer(
      (invocation) async => characterSet[invocation.positionalArguments[0]],
    );

    final result = await uc.getFuture(
      params: GetCharacterDetailsUCParams(name: ''),
    );

    expect(result, null);
    verify(repository.getCharacterDetails(''));
    verifyNoMoreInteractions(repository);
  });
}
