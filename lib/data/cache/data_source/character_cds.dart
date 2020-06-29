import 'package:hive/hive.dart';

import '../model/character_cm.dart';

class CharacterCDS {
  static const _characterList = 'characterList';

  Future<List<CharacterCM>> getCharacterList(String houseName) async {
    try {
      final box = await Hive.openBox(_characterList);
      return box.get(houseName).cast<CharacterCM>();
    } catch (_) {
      return <CharacterCM>[];
    }
  }

  Future<void> upsertCharacterList(
      String houseName, List<CharacterCM> characterList) async {
    final box = await Hive.openBox(_characterList);
    box.put(houseName, characterList);
  }
}
