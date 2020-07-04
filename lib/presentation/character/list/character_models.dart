import 'package:flutter/foundation.dart';

abstract class CharacterState {}

class Success extends CharacterState {
  Success({
    @required this.characterList,
  }) : assert(characterList != null);

  final List<CharacterVM> characterList;
}

class Loading extends CharacterState {}

class Error extends CharacterState {}

class CharacterVM {
  CharacterVM({
    @required this.name,
    @required this.image,
  })  : assert(name != null),
        assert(image != null);

  final String name;
  final String image;
}
