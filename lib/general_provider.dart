import 'package:dio/dio.dart';
import 'package:domain/use_case/get_house_list_uc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'data/cache/data_source/house_cds.dart';
import 'data/remote/data_source/house_rds.dart';
import 'data/repository/house_repository.dart';

class GeneralProvider extends StatelessWidget {
  GeneralProvider({
    @required this.builder,
  }) : assert(builder != null);

  final WidgetBuilder builder;

  List<SingleChildWidget> _buildRDSProviders() => [
        ProxyProvider<Dio, HouseRDS>(
          update: (context, dio, _) => HouseRDS(
            dio: dio,
          ),
        ),
      ];

  List<SingleChildWidget> _buildCDSProviders() => [
        Provider(
          create: (context) => HouseCDS(),
        ),
      ];

  List<SingleChildWidget> _buildRepositoryProviders() => [
        ProxyProvider2<HouseCDS, HouseRDS, HouseRepository>(
          update: (context, houseCDS, houseRDS, _) => HouseRepository(
            houseCDS: houseCDS,
            houseRDS: houseRDS,
          ),
        ),
      ];

  List<SingleChildWidget> _buildUCProviders() => [
        ProxyProvider<HouseRepository, GetHouseListUC>(
          update: (context, repository, _) => GetHouseListUC(
            repository: repository,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider(
            create: (context) => Dio(),
          ),
          ..._buildRDSProviders(),
          ..._buildCDSProviders(),
          ..._buildRepositoryProviders(),
          ..._buildUCProviders(),
        ],
        child: builder(context),
      );
}
