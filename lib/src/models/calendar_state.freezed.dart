// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CalendarState _$CalendarStateFromJson(Map<String, dynamic> json) {
  return _CalendarState.fromJson(json);
}

/// @nodoc
mixin _$CalendarState {
  int get monthIndex => throw _privateConstructorUsedError;
  int get yearIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarStateCopyWith<CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res, CalendarState>;
  @useResult
  $Res call({int monthIndex, int yearIndex});
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res, $Val extends CalendarState>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthIndex = null,
    Object? yearIndex = null,
  }) {
    return _then(_value.copyWith(
      monthIndex: null == monthIndex
          ? _value.monthIndex
          : monthIndex // ignore: cast_nullable_to_non_nullable
              as int,
      yearIndex: null == yearIndex
          ? _value.yearIndex
          : yearIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarStateImplCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$$CalendarStateImplCopyWith(
          _$CalendarStateImpl value, $Res Function(_$CalendarStateImpl) then) =
      __$$CalendarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int monthIndex, int yearIndex});
}

/// @nodoc
class __$$CalendarStateImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$CalendarStateImpl>
    implements _$$CalendarStateImplCopyWith<$Res> {
  __$$CalendarStateImplCopyWithImpl(
      _$CalendarStateImpl _value, $Res Function(_$CalendarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthIndex = null,
    Object? yearIndex = null,
  }) {
    return _then(_$CalendarStateImpl(
      monthIndex: null == monthIndex
          ? _value.monthIndex
          : monthIndex // ignore: cast_nullable_to_non_nullable
              as int,
      yearIndex: null == yearIndex
          ? _value.yearIndex
          : yearIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalendarStateImpl extends _CalendarState {
  const _$CalendarStateImpl({this.monthIndex = 0, this.yearIndex = 0})
      : super._();

  factory _$CalendarStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarStateImplFromJson(json);

  @override
  @JsonKey()
  final int monthIndex;
  @override
  @JsonKey()
  final int yearIndex;

  @override
  String toString() {
    return 'CalendarState(monthIndex: $monthIndex, yearIndex: $yearIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarStateImpl &&
            (identical(other.monthIndex, monthIndex) ||
                other.monthIndex == monthIndex) &&
            (identical(other.yearIndex, yearIndex) ||
                other.yearIndex == yearIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, monthIndex, yearIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarStateImplCopyWith<_$CalendarStateImpl> get copyWith =>
      __$$CalendarStateImplCopyWithImpl<_$CalendarStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarStateImplToJson(
      this,
    );
  }
}

abstract class _CalendarState extends CalendarState {
  const factory _CalendarState({final int monthIndex, final int yearIndex}) =
      _$CalendarStateImpl;
  const _CalendarState._() : super._();

  factory _CalendarState.fromJson(Map<String, dynamic> json) =
      _$CalendarStateImpl.fromJson;

  @override
  int get monthIndex;
  @override
  int get yearIndex;
  @override
  @JsonKey(ignore: true)
  _$$CalendarStateImplCopyWith<_$CalendarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
