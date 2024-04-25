// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryDetailsAdapter extends TypeAdapter<HistoryDetails> {
  @override
  final int typeId = 11;

  @override
  HistoryDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryDetails(
      h_id: fields[0] as int,
      comments: fields[1] as String,
      nextappoinmentdate: fields[2] as DateTime,
      status_name: fields[3] as String,
      appoinmentdate: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryDetails obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.h_id)
      ..writeByte(1)
      ..write(obj.comments)
      ..writeByte(2)
      ..write(obj.nextappoinmentdate)
      ..writeByte(3)
      ..write(obj.status_name)
      ..writeByte(4)
      ..write(obj.appoinmentdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
