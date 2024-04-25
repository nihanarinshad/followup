// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderator_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModeratorDetailsAdapter extends TypeAdapter<ModeratorDetails> {
  @override
  final int typeId = 2;

  @override
  ModeratorDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModeratorDetails(
      m_id: fields[0] as int,
      moderatorName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModeratorDetails obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.m_id)
      ..writeByte(1)
      ..write(obj.moderatorName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModeratorDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
