// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusDetailsAdapter extends TypeAdapter<StatusDetails> {
  @override
  final int typeId = 3;

  @override
  StatusDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatusDetails(
      s_Id: fields[0] as int,
      status: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StatusDetails obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.s_Id)
      ..writeByte(1)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
