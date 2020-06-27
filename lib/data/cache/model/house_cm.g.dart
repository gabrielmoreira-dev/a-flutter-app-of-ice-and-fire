// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HouseCMAdapter extends TypeAdapter<HouseCM> {
  @override
  final typeId = 1;

  @override
  HouseCM read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HouseCM(
      name: fields[0] as String,
      image: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HouseCM obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image);
  }
}
