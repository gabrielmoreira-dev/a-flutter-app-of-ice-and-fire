import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'house_rm.g.dart';

@JsonSerializable()
class HouseRM {
  HouseRM({
    @required this.name,
    this.logoURL,
  }) : assert(name != null);

  @JsonKey()
  final String name;
  @JsonKey()
  final String logoURL;

  Map<String, dynamic> toJson() => _$HouseRMToJson(this);
  static const fromJson = _$HouseRMFromJson;
}
