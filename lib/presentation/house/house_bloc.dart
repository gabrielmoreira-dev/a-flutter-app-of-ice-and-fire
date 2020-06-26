import 'package:aflutterappoficeandfire/common/subscription_holder.dart';
import 'package:aflutterappoficeandfire/presentation/house/house_models.dart';
import 'package:rxdart/rxdart.dart';

class HouseBloc with SubscriptionHolder {
  HouseBloc() {
    Rx.merge(
      List<Stream<void>>.of([
        Stream.empty(),
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

  final _onNewStateSubject = BehaviorSubject<HouseState>.seeded(Loading());

  Stream<HouseState> get onNewState => _onNewStateSubject.stream;

  final _onTryAgainSubject = PublishSubject<void>();

  Sink<void> get onTryAgainSink => _onTryAgainSubject.sink;

  Stream<HouseState> _getHouseState() async* {
    yield Loading();

    try {
      yield Success(
        houseList: [
          HouseVM(
            name: 'House 1',
          ),
          HouseVM(
            name: 'House 2',
          ),
          HouseVM(
            name: 'House 3',
          ),
        ],
      );
    } catch (_) {
      yield Error();
    }
  }

  dispose() {
    _onNewStateSubject.close();
    _onTryAgainSubject.close();
    super.disposeAll();
  }
}
