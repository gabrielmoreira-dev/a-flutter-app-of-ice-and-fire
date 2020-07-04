import 'package:flutter/foundation.dart';

abstract class CharacterDetailsState {}

class Success extends CharacterDetailsState {
  Success({
    @required this.characterDetails,
  }) : assert(characterDetails != null);

  final CharacterDetailsVM characterDetails;
}

class Loading extends CharacterDetailsState {}

class Error extends CharacterDetailsState {}

class CharacterDetailsVM {
  CharacterDetailsVM({
    @required this.name,
    @required this.image,
    @required this.culture,
    @required this.titles,
    @required this.allegiance,
  })  : assert(name != null),
        assert(image != null),
        assert(culture != null),
        assert(titles != null),
        assert(allegiance != null);

  final String name;
  final String image;
  final String culture;
  final List<String> titles;
  final List<String> allegiance;
}
