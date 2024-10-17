// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayWeatherModelAdapter extends TypeAdapter<DayWeatherModel> {
  @override
  final int typeId = 1;

  @override
  DayWeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayWeatherModel(
      avgTemp: fields[1] as double,
      maxTemp: fields[2] as double,
      minTemp: fields[3] as double,
      humidity: fields[4] as int,
      wind: fields[5] as double,
      image: fields[6] as String,
      dayOfWeek: fields[7] as String,
      monthDate: fields[8] as String,
      hourModels: (fields[0] as List).cast<HourModel>(),
      condition: fields[10] as String,
      date: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DayWeatherModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.hourModels)
      ..writeByte(1)
      ..write(obj.avgTemp)
      ..writeByte(2)
      ..write(obj.maxTemp)
      ..writeByte(3)
      ..write(obj.minTemp)
      ..writeByte(4)
      ..write(obj.humidity)
      ..writeByte(5)
      ..write(obj.wind)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.dayOfWeek)
      ..writeByte(8)
      ..write(obj.monthDate)
      ..writeByte(9)
      ..write(obj.date)
      ..writeByte(10)
      ..write(obj.condition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayWeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
