import 'package:bloc/bloc.dart';
import 'package:domain/use_case/get_house_list_uc.dart';
import 'package:flutter/foundation.dart';

import 'house_mapper.dart';
import 'house_models.dart';

class HouseBloc extends Bloc<HouseEvent, HouseState> {
  HouseBloc({
    @required this.getHouseListUC,
  }) : assert(getHouseListUC != null) {
    Stream.value(null).listen(
      (_) => add(
        OnInitEvent(),
      ),
    );
  }

  final GetHouseListUC getHouseListUC;

  @override
  HouseState get initialState => Loading();

  @override
  Stream<HouseState> mapEventToState(HouseEvent event) async* {
    /// This method fetches the House data and sort it alphabetically.

    yield Loading();

    try {
      final houseList = await getHouseListUC.getFuture();

      yield Success(
        houseList: houseList
            .map(
              (houseItem) => houseItem.toVM(),
            )
            .toList()
              ..sort(
                (a, b) => a.name.compareTo(b.name),
              ),
      );
    } catch (e) {
      yield Error();
    }
  }
}
