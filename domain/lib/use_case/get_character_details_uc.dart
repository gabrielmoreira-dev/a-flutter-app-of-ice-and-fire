import 'package:domain/data_repository/character_data_repository.dart';
import 'package:domain/model/character_details.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:meta/meta.dart';

class GetCharacterDetailsUC
    extends UseCase<GetCharacterDetailsUCParams, CharacterDetails> {
  GetCharacterDetailsUC({
    @required this.repository,
  }) : assert(repository != null);

  final CharacterDataRepository repository;

  @override
  Future<CharacterDetails> getRawFuture({GetCharacterDetailsUCParams params}) =>
      repository.getCharacterDetails(params.name);
}

class GetCharacterDetailsUCParams {
  GetCharacterDetailsUCParams({
    @required this.name,
  }) : assert(name != null);

  final String name;
}
