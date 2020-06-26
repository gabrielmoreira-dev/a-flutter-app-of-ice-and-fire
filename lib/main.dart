import 'package:aflutterappoficeandfire/presentation/common/got_colors.dart';
import 'package:aflutterappoficeandfire/presentation/house/house_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(AnAppOfIceAndFire());
}

class AnAppOfIceAndFire extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: GotColors.darkBlue,
          ),
          scaffoldBackgroundColor: GotColors.lightBlue,
        ),
        title: 'An App of Ice and Fire',
        debugShowCheckedModeBanner: false,
        home: HousePage.create(),
      );
}
