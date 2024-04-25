// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PackagesDetailsAdapter extends TypeAdapter<PackagesDetails> {
  @override
  final int typeId = 6;

  @override
  PackagesDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PackagesDetails(
      p_id: fields[0] as int,
      packageName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PackagesDetails obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.p_id)
      ..writeByte(1)
      ..write(obj.packageName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PackagesDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
