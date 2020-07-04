import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_details_rm.g.dart';

@JsonSerializable()
class CharacterDetailsRM {
  CharacterDetailsRM({
    @required this.name,
    @required this.image,
    @required this.culture,
    @required this.titles,
    this.allegiances,
  })  : assert(name != null),
        assert(image != null),
        assert(culture != null),
        assert(titles != null),
        assert(allegiances != null);

  @JsonKey()
  final String name;
  @JsonKey()
  final String image;
  @JsonKey()
  final List<String> culture;
  @JsonKey()
  final List<String> titles;
  @JsonKey()
  final List<String> allegiances;

  Map<String, dynamic> toJson() => _$CharacterDetailsRMToJson(this);
  static const fromJson = _$CharacterDetailsRMFromJson;
}
