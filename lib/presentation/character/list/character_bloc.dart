import 'package:bloc/bloc.dart';
import 'package:domain/model/character.dart';
import 'package:domain/use_case/get_character_list_uc.dart';
import 'package:flutter/foundation.dart';

import '../../common/view_utils.dart';
import 'character_mapper.dart';
import 'character_models.dart';

class CharacterBloc extends Bloc<Event, CharacterState> {
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
  Stream<CharacterState> mapEventToState(Event event) async* {
    yield Loading();

    try {
      final characterList = await fetchCharacterList();

      yield Success(
        characterList: characterList.toVM(),
      );
    } catch (_) {
      yield Error();
    }
  }

  Future<List<Character>> fetchCharacterList() => getCharacterListUC.getFuture(
        params: GetCharacterListUCParams(
          houseName: houseName,
        ),
      );
}
