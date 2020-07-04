import 'package:bloc/bloc.dart';
import 'package:domain/model/house.dart';
import 'package:domain/use_case/get_house_list_uc.dart';
import 'package:flutter/foundation.dart';

import '../common/view_utils.dart';
import 'house_mapper.dart';
import 'house_models.dart';

class HouseBloc extends Bloc<Event, HouseState> {
  HouseBloc({
    @required this.getHouseListUC,
  }) : assert(getHouseListUC != null) {
    add(OnInitEvent());
  }

  final GetHouseListUC getHouseListUC;

  @override
  HouseState get initialState => Loading();

  @override
  Stream<HouseState> mapEventToState(Event event) async* {
    /// This method fetches the House data and sort it alphabetically.

    yield Loading();

    try {
      final houseList = await fetchHouseList();

      yield Success(
        houseList: houseList.toVM(),
      );
    } catch (_) {
      yield Error();
    }
  }

  Future<List<House>> fetchHouseList() => getHouseListUC.getFuture();
}
