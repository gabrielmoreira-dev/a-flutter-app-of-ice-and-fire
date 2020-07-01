import 'package:aflutterappoficeandfire/presentation/common/route_name_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'data/cache/model/character_cm.dart';
import 'data/cache/model/house_cm.dart';
import 'general_provider.dart';
import 'presentation/common/got_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocDir.path)
    ..registerAdapter(HouseCMAdapter())
    ..registerAdapter(CharacterCMAdapter());

  runApp(
    GeneralProvider(
      builder: (context) => AnAppOfIceAndFire(),
    ),
  );
}

class AnAppOfIceAndFire extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.black87,
          ),
          scaffoldBackgroundColor: GotColors.deepBlue,
          fontFamily: 'Got',
        ),
        title: 'An App of Ice and Fire',
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNameBuilder.houseListResource,
        onGenerateRoute: Provider.of<RouteFactory>(context, listen: false),
      );
}
