import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/error_view.dart';

class ResponseView<State, Success extends State, Loading extends State,
    Error extends State> extends StatelessWidget {
  ResponseView({
    @required this.state,
    @required this.successWidgetBuilder,
    this.onTryAgainTap,
  })  : assert(state != null),
        assert(successWidgetBuilder != null);

  final State state;
  final Function(BuildContext context, Success success) successWidgetBuilder;
  final GestureTapCallback onTryAgainTap;

  @override
  Widget build(BuildContext context) => state is Loading || state == null
      ? Center(
          child: CircularProgressIndicator(),
        )
      : state is Error
          ? ErrorView(
              onTryAgainTap: onTryAgainTap,
            )
          : state is Success
              ? successWidgetBuilder(context, state)
              : throw UnknownStateTypeException();
}

class UnknownStateTypeException implements Exception {}
