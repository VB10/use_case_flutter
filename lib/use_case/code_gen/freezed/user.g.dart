// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserFAdapter extends TypeAdapter<_$_UserF> {
  @override
  final int typeId = 2;

  @override
  _$_UserF read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_UserF(
      fields[0] as int?,
      fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_UserF obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.statusCode)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserFAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserF _$$_UserFFromJson(Map<String, dynamic> json) => _$_UserF(
      json['statusCode'] as int?,
      json['id'] as String?,
    );

Map<String, dynamic> _$$_UserFToJson(_$_UserF instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'id': instance.id,
    };
