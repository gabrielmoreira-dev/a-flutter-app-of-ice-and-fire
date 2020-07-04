import 'package:domain/model/character_details.dart';
import 'package:domain/use_case/get_character_details_uc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/view_utils.dart';
import 'character_details_mapper.dart';
import 'character_details_models.dart';

class CharacterDetailsBloc extends Bloc<Event, CharacterDetailsState> {
  CharacterDetailsBloc({
    @required this.getCharacterDetailsUC,
    @required this.name,
  })  : assert(getCharacterDetailsUC != null),
        assert(name != null) {
    add(OnInitEvent());
  }

  final GetCharacterDetailsUC getCharacterDetailsUC;
  final String name;

  @override
  CharacterDetailsState get initialState => Loading();

  @override
  Stream<CharacterDetailsState> mapEventToState(Event event) async* {
    yield Loading();

    try {
      final characterDetails = await fetchCharacterDetails();
      yield Success(
        characterDetails: characterDetails.toVM(),
      );
    } catch (e) {
      print(e);
      yield Error();
    }
  }

  Future<CharacterDetails> fetchCharacterDetails() =>
      getCharacterDetailsUC.getFuture(
        params: GetCharacterDetailsUCParams(
          name: name,
        ),
      );
}
