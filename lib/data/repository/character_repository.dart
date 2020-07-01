import 'package:domain/data_repository/character_data_repository.dart';
import 'package:domain/model/character.dart';
import 'package:flutter/foundation.dart';

import '../cache/data_source/character_cds.dart';
import '../mapper/cache_to_domain.dart';
import '../mapper/remote_to_cache.dart';
import '../remote/data_source/character_rds.dart';

class CharacterRepository extends CharacterDataRepository {
  CharacterRepository({
    @required this.characterCDS,
    @required this.characterRDS,
  })  : assert(characterCDS != null),
        assert(characterRDS != null);

  final CharacterCDS characterCDS;
  final CharacterRDS characterRDS;

  @override
  Future<List<Character>> getCharacterList(String houseName) => characterRDS
      .getCharacterList(houseName)
      .then(
        (characterListRM) => characterListRM.toCM(),
      )
      .then(
        (characterListCM) =>
            characterCDS.upsertCharacterList(houseName, characterListCM).then(
                  (_) => characterListCM.toDM(),
                ),
      )
      .catchError(
        (e) => characterCDS.getCharacterList(houseName).then(
              (characterListCM) => characterListCM.toDM(),
            ),
      );
}
