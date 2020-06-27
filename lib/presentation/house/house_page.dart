import 'package:domain/use_case/get_house_list_uc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../common/async_snapshot_response_view.dart';
import '../common/card_grid_view.dart';
import 'house_bloc.dart';
import 'house_models.dart';

class HousePage extends StatelessWidget {
  HousePage({
    @required this.bloc,
  }) : assert(bloc != null);

  final HouseBloc bloc;

  static Widget create() => ProxyProvider<GetHouseListUC, HouseBloc>(
        update: (context, getHouseListUC, bloc) =>
            bloc ??
            HouseBloc(
              getHouseListUC: getHouseListUC,
            ),
        child: Consumer<HouseBloc>(
          builder: (context, bloc, _) => HousePage(
            bloc: bloc,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('An App of Ice And Fire'),
        ),
        body: StreamBuilder<HouseState>(
          stream: bloc.onNewState,
          builder: (context, snapshot) =>
              AsyncSnapshotResponseView<Success, Loading, Error>(
            snapshot: snapshot,
            onTryAgainTap: () => bloc.onTryAgainSink.add(null),
            successWidgetBuilder: (context, success) => GotGridView(
              itemList: success.houseList
                  .map(
                    (houseItem) => CardItemVM(
                      name: houseItem.name,
                      image: houseItem.image,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
}
