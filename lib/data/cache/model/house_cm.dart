import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'house_cm.g.dart';

@HiveType(typeId: 1)
class HouseCM {
  HouseCM({
    @required this.name,
    this.image,
  }) : assert(name != null);

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String image;
}
