import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

part 'character_details_cm.g.dart';

@HiveType(typeId: 3)
class CharacterDetailsCM {
  CharacterDetailsCM({
    @required this.name,
    @required this.image,
    @required this.culture,
    @required this.titles,
    @required this.allegiance,
  })  : assert(name != null),
        assert(image != null),
        assert(culture != null),
        assert(titles != null),
        assert(allegiance != null);

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String culture;
  @HiveField(3)
  final List<String> titles;
  @HiveField(4)
  final List<String> allegiance;
}
