import 'package:domain/data_repository/character_data_repository.dart';
import 'package:domain/model/character.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:meta/meta.dart';

class GetCharacterListUC
    extends UseCase<GetCharacterListUCParams, List<Character>> {
  GetCharacterListUC({
    @required this.repository,
  }) : assert(repository != null);

  final CharacterDataRepository repository;

  @override
  Future<List<Character>> getRawFuture({GetCharacterListUCParams params}) =>
      repository.getCharacterList(params.houseName);
}

class GetCharacterListUCParams {
  const GetCharacterListUCParams({
    @required this.houseName,
  }) : assert(houseName != null);

  final String houseName;
}
