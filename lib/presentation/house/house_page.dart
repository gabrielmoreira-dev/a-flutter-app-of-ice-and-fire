import 'package:domain/use_case/get_house_list_uc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../common/got_app_bar.dart';
import '../common/got_grid_view.dart';
import '../common/response_view.dart';
import '../common/route_name_builder.dart';
import '../common/view_utils.dart';
import 'house_bloc.dart';
import 'house_models.dart';

class HousePage extends StatelessWidget {
  HousePage({
    @required this.bloc,
  }) : assert(bloc != null);

  final HouseBloc bloc;

  static Widget create() => BlocProvider(
        create: (context) => HouseBloc(
          getHouseListUC: Provider.of<GetHouseListUC>(context, listen: false),
        ),
        child: Consumer<HouseBloc>(
          builder: (context, bloc, _) => HousePage(
            bloc: bloc,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: GotAppBar(
          title: 'An App of Ice And Fire',
        ),
        body: BlocBuilder<HouseBloc, HouseState>(
          bloc: bloc,
          builder: (context, state) =>
              ResponseView<HouseState, Success, Loading, Error>(
            state: state,
            onTryAgainTap: () => bloc.add(
              OnTryAgainEvent(),
            ),
            successWidgetBuilder: (context, success) => GotGridView(
              itemList: success.houseList
                  .map(
                    (houseItem) => CardItemVM(
                      name: houseItem.name,
                      image: houseItem.logoURL,
                    ),
                  )
                  .toList(),
              onTap: (houseName) => Navigator.pushNamed(
                context,
                RouteNameBuilder.characterList(houseName),
              ),
              expanded: false,
            ),
          ),
        ),
      );
}
