import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'house_bloc.dart';

class HousePage extends StatelessWidget {
  HousePage({
    @required this.bloc,
  }) : assert(bloc != null);

  final HouseBloc bloc;

  static Widget create() => Provider<HouseBloc>(
        create: (_) => HouseBloc(),
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
        body: Placeholder(),
      );
}
