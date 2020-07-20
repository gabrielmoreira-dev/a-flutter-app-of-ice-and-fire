import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../infrastructure/url_builder.dart';
import '../model/character_details_rm.dart';
import '../model/character_rm.dart';

class CharacterRDS {
  CharacterRDS({
    @required this.dio,
  }) : assert(dio != null);

  final Dio dio;

  Future<List<CharacterRM>> getCharacterList(String houseName) => dio
      .get(
        UrlBuilder.characterList(houseName),
      )
      .then(
        (response) => response.data
            .map((characterItem) => CharacterRM.fromJson(characterItem))
            .toList()
            .cast<CharacterRM>(),
      );

  Future<CharacterDetailsRM> getCharacterDetails(String name) =>
      dio.get(UrlBuilder.character(name)).then(
            (response) => CharacterDetailsRM.fromJson(response.data),
          );
}
