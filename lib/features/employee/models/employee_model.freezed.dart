// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmployeeModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  EmployeeRole get role => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime get startDate => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime? get endDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmployeeModelCopyWith<EmployeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeModelCopyWith<$Res> {
  factory $EmployeeModelCopyWith(
          EmployeeModel value, $Res Function(EmployeeModel) then) =
      _$EmployeeModelCopyWithImpl<$Res, EmployeeModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) EmployeeRole role,
      @HiveField(3) DateTime startDate,
      @HiveField(4) DateTime? endDate});
}

/// @nodoc
class _$EmployeeModelCopyWithImpl<$Res, $Val extends EmployeeModel>
    implements $EmployeeModelCopyWith<$Res> {
  _$EmployeeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? startDate = null,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as EmployeeRole,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmployeeModelCopyWith<$Res>
    implements $EmployeeModelCopyWith<$Res> {
  factory _$$_EmployeeModelCopyWith(
          _$_EmployeeModel value, $Res Function(_$_EmployeeModel) then) =
      __$$_EmployeeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) EmployeeRole role,
      @HiveField(3) DateTime startDate,
      @HiveField(4) DateTime? endDate});
}

/// @nodoc
class __$$_EmployeeModelCopyWithImpl<$Res>
    extends _$EmployeeModelCopyWithImpl<$Res, _$_EmployeeModel>
    implements _$$_EmployeeModelCopyWith<$Res> {
  __$$_EmployeeModelCopyWithImpl(
      _$_EmployeeModel _value, $Res Function(_$_EmployeeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? startDate = null,
    Object? endDate = freezed,
  }) {
    return _then(_$_EmployeeModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as EmployeeRole,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0)
class _$_EmployeeModel extends _EmployeeModel {
  const _$_EmployeeModel(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.role,
      @HiveField(3) required this.startDate,
      @HiveField(4) this.endDate})
      : super._();

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final EmployeeRole role;
  @override
  @HiveField(3)
  final DateTime startDate;
  @override
  @HiveField(4)
  final DateTime? endDate;

  @override
  String toString() {
    return 'EmployeeModel(id: $id, name: $name, role: $role, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmployeeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, role, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmployeeModelCopyWith<_$_EmployeeModel> get copyWith =>
      __$$_EmployeeModelCopyWithImpl<_$_EmployeeModel>(this, _$identity);
}

abstract class _EmployeeModel extends EmployeeModel {
  const factory _EmployeeModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final EmployeeRole role,
      @HiveField(3) required final DateTime startDate,
      @HiveField(4) final DateTime? endDate}) = _$_EmployeeModel;
  const _EmployeeModel._() : super._();

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  EmployeeRole get role;
  @override
  @HiveField(3)
  DateTime get startDate;
  @override
  @HiveField(4)
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeeModelCopyWith<_$_EmployeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
