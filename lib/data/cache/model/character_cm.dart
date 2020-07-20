import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'character_cm.g.dart';

@HiveType(typeId: 2)
class CharacterCM {
  CharacterCM({
    @required this.name,
    this.image,
  }) : assert(name != null);

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String image;
}
