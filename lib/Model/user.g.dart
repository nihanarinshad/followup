// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'user.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class UserDetailsAdapter extends TypeAdapter<UserDetails> {
//   @override
//   final int typeId = 17;

//   @override
//   UserDetails read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return UserDetails(
//       id: fields[0] as int,
//       username: fields[1] as String,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, UserDetails obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.username);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is UserDetailsAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
