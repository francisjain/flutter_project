// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentModels.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelsAdapter extends TypeAdapter<StudentModels> {
  @override
  final int typeId = 0;

  @override
  StudentModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModels(
      name: fields[1] as String,
      age: fields[2] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModels obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
