import 'package:bloc/bloc.dart';
import 'package:domain/use_case/get_character_list_uc.dart';
import 'package:flutter/foundation.dart';

import 'character_mapper.dart';
import 'character_models.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc({
    @required this.getCharacterListUC,
    @required this.houseName,
  })  : assert(getCharacterListUC != null),
        assert(houseName != null) {
    add(OnInitEvent());
  }

  final GetCharacterListUC getCharacterListUC;
  final String houseName;

  @override
  CharacterState get initialState => Loading();

  @override
  Stream<CharacterState> mapEventToState(CharacterEvent event) async* {
    yield Loading();

    try {
      final characterList = await getCharacterListUC.getFuture(
        params: GetCharacterListUCParams(
          houseName: houseName,
        ),
      );

      yield Success(
        characterList: characterList.toVM(),
      );
    } catch (_) {
      yield Error();
    }
  }
}
