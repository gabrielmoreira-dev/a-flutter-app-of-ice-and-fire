import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(AnAppOfIceAndFire());
}

class AnAppOfIceAndFire extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'An App of Ice and Fire',
    debugShowCheckedModeBanner: false,
    home: Placeholder(),
  );
}
