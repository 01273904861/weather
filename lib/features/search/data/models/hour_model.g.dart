// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HourModelAdapter extends TypeAdapter<HourModel> {
  @override
  final int typeId = 2;

  @override
  HourModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HourModel(
      image: fields[0] as String,
      time: fields[1] as String,
      temp: fields[2] as double,
      condition: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HourModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.temp)
      ..writeByte(3)
      ..write(obj.condition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
