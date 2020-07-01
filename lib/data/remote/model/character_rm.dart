import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_rm.g.dart';

@JsonSerializable()
class CharacterRM {
  CharacterRM({
    @required this.name,
    this.image,
  }) : assert(name != null);

  @JsonKey()
  final String name;
  @JsonKey()
  final String image;

  Map<String, dynamic> toJson() => _$CharacterRMToJson(this);
  static const fromJson = _$CharacterRMFromJson;
}
