// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'loginUserDetals.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class LoginUserDataDetailAdapter extends TypeAdapter<LoginUserDataDetail> {
//   @override
//   final int typeId = 16;

//   @override
//   LoginUserDataDetail read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LoginUserDataDetail(
//       commission: fields[0] as double,
//       dob: fields[1] as DateTime,
//       email: fields[2] as String,
//       firstname: fields[3] as String,
//       gender: fields[4] as String,
//       id: fields[5] as int,
//       lastname: fields[6] as String,
//       package_id: fields[9] as int,
//       phone: fields[10] as int,
//       tenant_name: fields[11] as String,
//       user_type: fields[12] as String,
//       username: fields[13] as String,
//       wallet: fields[14] as double,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LoginUserDataDetail obj) {
//     writer
//       ..writeByte(13)
//       ..writeByte(0)
//       ..write(obj.commission)
//       ..writeByte(1)
//       ..write(obj.dob)
//       ..writeByte(2)
//       ..write(obj.email)
//       ..writeByte(3)
//       ..write(obj.firstname)
//       ..writeByte(4)
//       ..write(obj.gender)
//       ..writeByte(5)
//       ..write(obj.id)
//       ..writeByte(6)
//       ..write(obj.lastname)
//       ..writeByte(9)
//       ..write(obj.package_id)
//       ..writeByte(10)
//       ..write(obj.phone)
//       ..writeByte(11)
//       ..write(obj.tenant_name)
//       ..writeByte(12)
//       ..write(obj.user_type)
//       ..writeByte(13)
//       ..write(obj.username)
//       ..writeByte(14)
//       ..write(obj.wallet);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LoginUserDataDetailAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
