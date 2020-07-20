import 'package:hive/hive.dart';

import '../model/character_cm.dart';
import '../model/character_details_cm.dart';

class CharacterCDS {
  static const _characterList = 'characterList';
  static const _characterDetails = 'characterDetails';

  Future<List<CharacterCM>> getCharacterList(String houseName) async {
    final box = await Hive.openBox(_characterList);
    return box.get(houseName).cast<CharacterCM>();
  }

  Future<void> upsertCharacterList(
      String houseName, List<CharacterCM> characterList) async {
    final box = await Hive.openBox(_characterList);
    box.put(houseName, characterList);
  }

  Future<CharacterDetailsCM> getCharacterDetails(String name) async {
    final box = await Hive.openBox<CharacterDetailsCM>(_characterDetails);
    return box.get(name);
  }

  Future<void> upsertCharacterDetails(
      CharacterDetailsCM characterDetails) async {
    final box = await Hive.openBox<CharacterDetailsCM>(_characterDetails);
    box.put(characterDetails.name, characterDetails);
  }
}
