import '../cache/model/character_cm.dart';
import '../cache/model/house_cm.dart';
import '../remote/model/character_rm.dart';
import '../remote/model/house_rm.dart';

extension HouseRMMapper on HouseRM {
  HouseCM toCM() => HouseCM(
        name: name,
        logoURL: logoURL,
      );
}

extension HouseListRMMapper on List<HouseRM> {
  List<HouseCM> toCM() => map(
        (houseItem) => houseItem.toCM(),
      )
          .where(
            (houseItem) => houseItem.logoURL != null,
          )
          .toList();
}

extension CharacterRMMapper on CharacterRM {
  CharacterCM toCM() => CharacterCM(
        name: name,
        image: image,
      );
}

extension CharacterListRMMapper on List<CharacterRM> {
  List<CharacterCM> toCM() => map(
        (characterItem) => characterItem.toCM(),
      )
          .where(
            (characterItem) => characterItem.image != null,
          )
          .toList();
}
