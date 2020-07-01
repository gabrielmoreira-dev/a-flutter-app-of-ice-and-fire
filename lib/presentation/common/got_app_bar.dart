import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GotAppBar extends StatelessWidget implements PreferredSizeWidget {
  GotAppBar({
    @required this.title,
  }) : assert(title != null);

  final String title;

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
      );

  @override
  Size get preferredSize => AppBar().preferredSize;
}
