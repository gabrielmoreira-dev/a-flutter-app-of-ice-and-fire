import 'package:domain/use_case/get_house_list_uc.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../../common/subscription_holder.dart';
import 'house_mapper.dart';
import 'house_models.dart';

class HouseBloc with SubscriptionHolder {
  HouseBloc({
    @required this.getHouseListUC,
  }) : assert(getHouseListUC != null) {
    Rx.merge(
      List<Stream<void>>.of([
        Stream.value(null),
        _onTryAgainSubject,
      ]),
    )
        .flatMap(
          (_) => _getHouseState(),
        )
        .listen(
          _onNewStateSubject.add,
        );
  }

  final GetHouseListUC getHouseListUC;

  final _onNewStateSubject = BehaviorSubject<HouseState>.seeded(Loading());

  Stream<HouseState> get onNewState => _onNewStateSubject.stream;

  final _onTryAgainSubject = PublishSubject<void>();

  Sink<void> get onTryAgainSink => _onTryAgainSubject.sink;

  Stream<HouseState> _getHouseState() async* {
    yield Loading();

    try {
      final houseList = await getHouseListUC.getFuture();

      yield Success(
        houseList: houseList
            .map(
              (houseItem) => houseItem.toVM(),
            )
            .toList(),
      );
    } catch (e) {
      yield Error();
    }
  }

  dispose() {
    _onNewStateSubject.close();
    _onTryAgainSubject.close();
    super.disposeAll();
  }
}
