import 'package:domain/model/character_details.dart';

import 'character_details_models.dart';

extension CharacterDetailsMapper on CharacterDetails {
  CharacterDetailsVM toVM() => CharacterDetailsVM(
        name: name,
        image: image,
        culture: culture,
        titles: titles,
        allegiance: allegiances,
      );
}
