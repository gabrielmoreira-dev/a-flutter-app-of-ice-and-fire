import 'package:domain/model/character.dart';

import 'character_models.dart';

extension CharacterMapper on Character {
  CharacterVM toVM() => CharacterVM(
        name: name,
        image: image,
      );
}

extension CharacterListMapper on List<Character> {
  List<CharacterVM> toVM() =>
      map((characterItem) => characterItem.toVM()).toList()
        ..sort(
          (a, b) => a.name.compareTo(b.name),
        );
}
