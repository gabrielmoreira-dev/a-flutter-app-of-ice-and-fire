// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDetailsRM _$CharacterDetailsRMFromJson(Map<String, dynamic> json) {
  return CharacterDetailsRM(
    name: json['name'] as String,
    image: json['image'] as String,
    culture: json['culture'] as String,
    titles: (json['titles'] as List)?.map((e) => e as String)?.toList(),
    allegiance: (json['allegiance'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CharacterDetailsRMToJson(CharacterDetailsRM instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'culture': instance.culture,
      'titles': instance.titles,
      'allegiance': instance.allegiance,
    };
