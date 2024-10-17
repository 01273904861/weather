// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seven_day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SevenDaysWeatherModelAdapter extends TypeAdapter<SevenDaysWeatherModel> {
  @override
  final int typeId = 0;

  @override
  SevenDaysWeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SevenDaysWeatherModel(
      name: fields[0] as String,
      forecastDays: (fields[1] as List).cast<DayWeatherModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, SevenDaysWeatherModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.forecastDays);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SevenDaysWeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
