// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_form.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerformDetailsAdapter extends TypeAdapter<CustomerformDetails> {
  @override
  final int typeId = 15;

  @override
  CustomerformDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerformDetails(
      id: fields[0] as int,
      formname: fields[1] as String,
      fieldname: fields[2] as String,
      feildtype: fields[3] as String,
      defaultvalue: fields[4] as String,
      required: fields[5] as String,
      includedreg: fields[6] as String,
      modifiedby: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerformDetails obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.formname)
      ..writeByte(2)
      ..write(obj.fieldname)
      ..writeByte(3)
      ..write(obj.feildtype)
      ..writeByte(4)
      ..write(obj.defaultvalue)
      ..writeByte(5)
      ..write(obj.required)
      ..writeByte(6)
      ..write(obj.includedreg)
      ..writeByte(7)
      ..write(obj.modifiedby);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerformDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
