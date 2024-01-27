// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InventorySlot _$InventorySlotFromJson(Map<String, dynamic> json) {
  return _InventorySlot.fromJson(json);
}

/// @nodoc
mixin _$InventorySlot {
  Resource? get resource => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventorySlotCopyWith<InventorySlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventorySlotCopyWith<$Res> {
  factory $InventorySlotCopyWith(
          InventorySlot value, $Res Function(InventorySlot) then) =
      _$InventorySlotCopyWithImpl<$Res, InventorySlot>;
  @useResult
  $Res call({Resource? resource, int count});

  $ResourceCopyWith<$Res>? get resource;
}

/// @nodoc
class _$InventorySlotCopyWithImpl<$Res, $Val extends InventorySlot>
    implements $InventorySlotCopyWith<$Res> {
  _$InventorySlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resource = freezed,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      resource: freezed == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as Resource?,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResourceCopyWith<$Res>? get resource {
    if (_value.resource == null) {
      return null;
    }

    return $ResourceCopyWith<$Res>(_value.resource!, (value) {
      return _then(_value.copyWith(resource: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InventorySlotImplCopyWith<$Res>
    implements $InventorySlotCopyWith<$Res> {
  factory _$$InventorySlotImplCopyWith(
          _$InventorySlotImpl value, $Res Function(_$InventorySlotImpl) then) =
      __$$InventorySlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Resource? resource, int count});

  @override
  $ResourceCopyWith<$Res>? get resource;
}

/// @nodoc
class __$$InventorySlotImplCopyWithImpl<$Res>
    extends _$InventorySlotCopyWithImpl<$Res, _$InventorySlotImpl>
    implements _$$InventorySlotImplCopyWith<$Res> {
  __$$InventorySlotImplCopyWithImpl(
      _$InventorySlotImpl _value, $Res Function(_$InventorySlotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resource = freezed,
    Object? count = null,
  }) {
    return _then(_$InventorySlotImpl(
      resource: freezed == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as Resource?,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventorySlotImpl implements _InventorySlot {
  const _$InventorySlotImpl({this.resource, this.count = 0});

  factory _$InventorySlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventorySlotImplFromJson(json);

  @override
  final Resource? resource;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'InventorySlot(resource: $resource, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventorySlotImpl &&
            (identical(other.resource, resource) ||
                other.resource == resource) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, resource, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventorySlotImplCopyWith<_$InventorySlotImpl> get copyWith =>
      __$$InventorySlotImplCopyWithImpl<_$InventorySlotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventorySlotImplToJson(
      this,
    );
  }
}

abstract class _InventorySlot implements InventorySlot {
  const factory _InventorySlot({final Resource? resource, final int count}) =
      _$InventorySlotImpl;

  factory _InventorySlot.fromJson(Map<String, dynamic> json) =
      _$InventorySlotImpl.fromJson;

  @override
  Resource? get resource;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$InventorySlotImplCopyWith<_$InventorySlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
