// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WithdrawelDetailsAdapter extends TypeAdapter<WithdrawelDetails> {
  @override
  final int typeId = 9;

  @override
  WithdrawelDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WithdrawelDetails(
      w_id: fields[0] as int,
      amount: fields[1] as int,
      date: fields[2] as DateTime,
      status: fields[3] as String,
      user_id: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WithdrawelDetails obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.w_id)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.user_id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WithdrawelDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
