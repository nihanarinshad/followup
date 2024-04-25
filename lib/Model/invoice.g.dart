// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvoiceDetailsAdapter extends TypeAdapter<InvoiceDetails> {
  @override
  final int typeId = 8;

  @override
  InvoiceDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvoiceDetails(
      packageName: fields[2] as String,
      date: fields[3] as DateTime,
      userid: fields[4] as int,
      userName: fields[5] as String,
      amount: fields[1] as int,
      iv_id: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, InvoiceDetails obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.iv_id)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.packageName)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.userid)
      ..writeByte(5)
      ..write(obj.userName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
