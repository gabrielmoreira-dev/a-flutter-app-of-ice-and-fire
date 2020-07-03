import 'package:domain/model/character.dart';
import 'package:domain/model/character_details.dart';

abstract class CharacterDataRepository {
  Future<List<Character>> getCharacterList(String houseName);

  Future<CharacterDetails> getCharacterDetails(String name);
}
