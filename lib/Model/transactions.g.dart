// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionDetailsAdapter extends TypeAdapter<TransactionDetails> {
  @override
  final int typeId = 7;

  @override
  TransactionDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionDetails(
      date: fields[2] as DateTime,
      t_id: fields[0] as int,
      amount: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionDetails obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.t_id)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
