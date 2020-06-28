import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  ErrorView({
    @required this.onTryAgainTap,
  }) : assert(onTryAgainTap != null);

  final GestureTapCallback onTryAgainTap;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text('Error'),
          Text('Could not show the data. Please try again.'),
          RaisedButton(
            onPressed: onTryAgainTap,
            child: Text('Try again'),
          ),
        ],
      );
}
