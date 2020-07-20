// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterDetailsCMAdapter extends TypeAdapter<CharacterDetailsCM> {
  @override
  final typeId = 3;

  @override
  CharacterDetailsCM read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharacterDetailsCM(
      name: fields[0] as String,
      image: fields[1] as String,
      culture: (fields[2] as List)?.cast<String>(),
      titles: (fields[3] as List)?.cast<String>(),
      allegiances: (fields[4] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CharacterDetailsCM obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.culture)
      ..writeByte(3)
      ..write(obj.titles)
      ..writeByte(4)
      ..write(obj.allegiances);
  }
}
