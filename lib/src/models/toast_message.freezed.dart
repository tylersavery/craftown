// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toast_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ToastMessage {
  String get identifier => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ToastMessageType get type => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToastMessageCopyWith<ToastMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToastMessageCopyWith<$Res> {
  factory $ToastMessageCopyWith(
          ToastMessage value, $Res Function(ToastMessage) then) =
      _$ToastMessageCopyWithImpl<$Res, ToastMessage>;
  @useResult
  $Res call(
      {String identifier,
      String message,
      ToastMessageType type,
      Duration duration,
      bool isVisible});
}

/// @nodoc
class _$ToastMessageCopyWithImpl<$Res, $Val extends ToastMessage>
    implements $ToastMessageCopyWith<$Res> {
  _$ToastMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? message = null,
    Object? type = null,
    Object? duration = null,
    Object? isVisible = null,
  }) {
    return _then(_value.copyWith(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ToastMessageType,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToastMessageImplCopyWith<$Res>
    implements $ToastMessageCopyWith<$Res> {
  factory _$$ToastMessageImplCopyWith(
          _$ToastMessageImpl value, $Res Function(_$ToastMessageImpl) then) =
      __$$ToastMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String identifier,
      String message,
      ToastMessageType type,
      Duration duration,
      bool isVisible});
}

/// @nodoc
class __$$ToastMessageImplCopyWithImpl<$Res>
    extends _$ToastMessageCopyWithImpl<$Res, _$ToastMessageImpl>
    implements _$$ToastMessageImplCopyWith<$Res> {
  __$$ToastMessageImplCopyWithImpl(
      _$ToastMessageImpl _value, $Res Function(_$ToastMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? message = null,
    Object? type = null,
    Object? duration = null,
    Object? isVisible = null,
  }) {
    return _then(_$ToastMessageImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ToastMessageType,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToastMessageImpl implements _ToastMessage {
  const _$ToastMessageImpl(
      {required this.identifier,
      required this.message,
      this.type = ToastMessageType.info,
      this.duration = const Duration(milliseconds: 2000),
      this.isVisible = true});

  @override
  final String identifier;
  @override
  final String message;
  @override
  @JsonKey()
  final ToastMessageType type;
  @override
  @JsonKey()
  final Duration duration;
  @override
  @JsonKey()
  final bool isVisible;

  @override
  String toString() {
    return 'ToastMessage(identifier: $identifier, message: $message, type: $type, duration: $duration, isVisible: $isVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToastMessageImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, identifier, message, type, duration, isVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToastMessageImplCopyWith<_$ToastMessageImpl> get copyWith =>
      __$$ToastMessageImplCopyWithImpl<_$ToastMessageImpl>(this, _$identity);
}

abstract class _ToastMessage implements ToastMessage {
  const factory _ToastMessage(
      {required final String identifier,
      required final String message,
      final ToastMessageType type,
      final Duration duration,
      final bool isVisible}) = _$ToastMessageImpl;

  @override
  String get identifier;
  @override
  String get message;
  @override
  ToastMessageType get type;
  @override
  Duration get duration;
  @override
  bool get isVisible;
  @override
  @JsonKey(ignore: true)
  _$$ToastMessageImplCopyWith<_$ToastMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
