import 'package:aflutterappoficeandfire/presentation/common/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AsyncSnapshotResponseView<Success, Loading, Error>
    extends StatelessWidget {
  AsyncSnapshotResponseView({
    @required this.snapshot,
    @required this.successWidgetBuilder,
    this.onTryAgainTap,
  })  : assert(snapshot != null),
        assert(successWidgetBuilder != null);

  final AsyncSnapshot snapshot;
  final Function(BuildContext context, Success success) successWidgetBuilder;
  final GestureTapCallback onTryAgainTap;

  @override
  Widget build(BuildContext context) =>
      snapshot.data is Loading || snapshot.data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : snapshot.data is Error
              ? ErrorView(
                  onTryAgainTap: onTryAgainTap,
                )
              : snapshot.data is Success
                  ? successWidgetBuilder(context, snapshot.data)
                  : throw UnknownStateTypeException();
}

class UnknownStateTypeException implements Exception {}
