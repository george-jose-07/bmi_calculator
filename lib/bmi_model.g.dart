// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BmiModelAdapter extends TypeAdapter<BmiModel> {
  @override
  final int typeId = 0;

  @override
  BmiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BmiModel(
      age: fields[0] as int,
      height: fields[1] as double,
      weight: fields[3] as double,
      date: fields[4] as DateTime,
      gender: fields[2] as String,
      bmiValue: fields[6] as double,
      bodyNature: fields[7] as String,
    )..id = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, BmiModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.age)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.bmiValue)
      ..writeByte(7)
      ..write(obj.bodyNature);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BmiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
