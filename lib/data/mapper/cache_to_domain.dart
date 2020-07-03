import 'package:domain/model/character.dart';
import 'package:domain/model/character_details.dart';
import 'package:domain/model/house.dart';

import '../cache/model/character_cm.dart';
import '../cache/model/character_details_cm.dart';
import '../cache/model/house_cm.dart';

extension HouseCMMapper on HouseCM {
  House toDM() => House(
        name: name,
        logoURL: logoURL,
      );
}

extension HouseListCMMapper on List<HouseCM> {
  List<House> toDM() => map(
        (houseItem) => houseItem.toDM(),
      ).toList();
}

extension CharacterCMMapper on CharacterCM {
  Character toDM() => Character(
        name: name,
        image: image,
      );
}

extension CharacterListCMMapper on List<CharacterCM> {
  List<Character> toDM() => map(
        (characterItem) => characterItem.toDM(),
      ).toList();
}

extension CharacterDetailsCMMapper on CharacterDetailsCM {
  CharacterDetails toDM() => CharacterDetails(
        name: name,
        image: image,
        culture: culture,
        titles: titles,
        allegiance: allegiance,
      );
}
