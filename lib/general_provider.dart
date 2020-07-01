import 'package:aflutterappoficeandfire/presentation/character/list/character_page.dart';
import 'package:aflutterappoficeandfire/presentation/common/route_name_builder.dart';
import 'package:aflutterappoficeandfire/presentation/house/house_page.dart';
import 'package:dio/dio.dart';
import 'package:domain/use_case/get_character_list_uc.dart';
import 'package:domain/use_case/get_house_list_uc.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'data/cache/data_source/character_cds.dart';
import 'data/cache/data_source/house_cds.dart';
import 'data/remote/data_source/character_rds.dart';
import 'data/remote/data_source/house_rds.dart';
import 'data/repository/character_repository.dart';
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
        ProxyProvider<Dio, CharacterRDS>(
          update: (context, dio, _) => CharacterRDS(
            dio: dio,
          ),
        ),
      ];

  List<SingleChildWidget> _buildCDSProviders() => [
        Provider<HouseCDS>(
          create: (context) => HouseCDS(),
        ),
        Provider<CharacterCDS>(
          create: (context) => CharacterCDS(),
        ),
      ];

  List<SingleChildWidget> _buildRepositoryProviders() => [
        ProxyProvider2<HouseCDS, HouseRDS, HouseRepository>(
          update: (context, houseCDS, houseRDS, _) => HouseRepository(
            houseCDS: houseCDS,
            houseRDS: houseRDS,
          ),
        ),
        ProxyProvider2<CharacterCDS, CharacterRDS, CharacterRepository>(
          update: (context, characterCDS, characterRDS, _) =>
              CharacterRepository(
            characterCDS: characterCDS,
            characterRDS: characterRDS,
          ),
        ),
      ];

  List<SingleChildWidget> _buildUCProviders() => [
        ProxyProvider<HouseRepository, GetHouseListUC>(
          update: (context, repository, _) => GetHouseListUC(
            repository: repository,
          ),
        ),
        ProxyProvider<CharacterRepository, GetCharacterListUC>(
          update: (context, repository, _) => GetCharacterListUC(
            repository: repository,
          ),
        ),
      ];

  List<SingleChildWidget> _buildFluroProviders() => [
        Provider<Router>(
          create: (context) => Router()
            ..define(
              RouteNameBuilder.houseListResource,
              transitionType: TransitionType.native,
              handler: Handler(
                handlerFunc: (context, _) => HousePage.create(),
              ),
            )
            ..define(
              RouteNameBuilder.characterListResource,
              transitionType: TransitionType.native,
              handler: Handler(
                handlerFunc: (context, _) => CharacterPage.create(),
              ),
            ),
        ),
        ProxyProvider<Router, RouteFactory>(
          update: (context, router, _) => (settings) => router
              .matchRoute(context, settings.name, routeSettings: settings)
              .route,
        ),
      ];

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<Dio>(
            create: (context) => Dio(),
          ),
          ..._buildRDSProviders(),
          ..._buildCDSProviders(),
          ..._buildRepositoryProviders(),
          ..._buildUCProviders(),
          ..._buildFluroProviders(),
        ],
        child: builder(context),
      );
}
