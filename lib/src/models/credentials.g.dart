// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCredentialsAdapter extends TypeAdapter<HiveCredentials> {
  @override
  final int typeId = 1;

  @override
  HiveCredentials read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCredentials()
      ..endpoint = fields[0] as String
      ..token = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, HiveCredentials obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.endpoint)
      ..writeByte(1)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCredentialsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
