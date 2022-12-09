// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserF _$UserFFromJson(Map<String, dynamic> json) {
  return _UserF.fromJson(json);
}

/// @nodoc
mixin _$UserF {
  @HiveField(0)
  int? get statusCode => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFCopyWith<UserF> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFCopyWith<$Res> {
  factory $UserFCopyWith(UserF value, $Res Function(UserF) then) =
      _$UserFCopyWithImpl<$Res>;
  $Res call({@HiveField(0) int? statusCode, @HiveField(1) String? id});
}

/// @nodoc
class _$UserFCopyWithImpl<$Res> implements $UserFCopyWith<$Res> {
  _$UserFCopyWithImpl(this._value, this._then);

  final UserF _value;
  // ignore: unused_field
  final $Res Function(UserF) _then;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserFCopyWith<$Res> implements $UserFCopyWith<$Res> {
  factory _$$_UserFCopyWith(_$_UserF value, $Res Function(_$_UserF) then) =
      __$$_UserFCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) int? statusCode, @HiveField(1) String? id});
}

/// @nodoc
class __$$_UserFCopyWithImpl<$Res> extends _$UserFCopyWithImpl<$Res>
    implements _$$_UserFCopyWith<$Res> {
  __$$_UserFCopyWithImpl(_$_UserF _value, $Res Function(_$_UserF) _then)
      : super(_value, (v) => _then(v as _$_UserF));

  @override
  _$_UserF get _value => super._value as _$_UserF;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_UserF(
      statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveConstants.hiveF)
class _$_UserF implements _UserF {
  _$_UserF(@HiveField(0) this.statusCode, @HiveField(1) this.id);

  factory _$_UserF.fromJson(Map<String, dynamic> json) =>
      _$$_UserFFromJson(json);

  @override
  @HiveField(0)
  final int? statusCode;
  @override
  @HiveField(1)
  final String? id;

  @override
  String toString() {
    return 'UserF(statusCode: $statusCode, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserF &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(statusCode),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_UserFCopyWith<_$_UserF> get copyWith =>
      __$$_UserFCopyWithImpl<_$_UserF>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserFToJson(
      this,
    );
  }
}

abstract class _UserF implements UserF {
  factory _UserF(
          @HiveField(0) final int? statusCode, @HiveField(1) final String? id) =
      _$_UserF;

  factory _UserF.fromJson(Map<String, dynamic> json) = _$_UserF.fromJson;

  @override
  @HiveField(0)
  int? get statusCode;
  @override
  @HiveField(1)
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_UserFCopyWith<_$_UserF> get copyWith =>
      throw _privateConstructorUsedError;
}
