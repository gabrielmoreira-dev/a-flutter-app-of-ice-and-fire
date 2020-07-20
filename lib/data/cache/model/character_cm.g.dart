// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterCMAdapter extends TypeAdapter<CharacterCM> {
  @override
  final typeId = 2;

  @override
  CharacterCM read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharacterCM(
      name: fields[0] as String,
      image: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CharacterCM obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image);
  }
}
