// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InventoryMenuState {
  bool get isOpen => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InventoryMenuStateCopyWith<InventoryMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryMenuStateCopyWith<$Res> {
  factory $InventoryMenuStateCopyWith(
          InventoryMenuState value, $Res Function(InventoryMenuState) then) =
      _$InventoryMenuStateCopyWithImpl<$Res, InventoryMenuState>;
  @useResult
  $Res call({bool isOpen, int selectedIndex});
}

/// @nodoc
class _$InventoryMenuStateCopyWithImpl<$Res, $Val extends InventoryMenuState>
    implements $InventoryMenuStateCopyWith<$Res> {
  _$InventoryMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? selectedIndex = null,
  }) {
    return _then(_value.copyWith(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryMenuStateImplCopyWith<$Res>
    implements $InventoryMenuStateCopyWith<$Res> {
  factory _$$InventoryMenuStateImplCopyWith(_$InventoryMenuStateImpl value,
          $Res Function(_$InventoryMenuStateImpl) then) =
      __$$InventoryMenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isOpen, int selectedIndex});
}

/// @nodoc
class __$$InventoryMenuStateImplCopyWithImpl<$Res>
    extends _$InventoryMenuStateCopyWithImpl<$Res, _$InventoryMenuStateImpl>
    implements _$$InventoryMenuStateImplCopyWith<$Res> {
  __$$InventoryMenuStateImplCopyWithImpl(_$InventoryMenuStateImpl _value,
      $Res Function(_$InventoryMenuStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? selectedIndex = null,
  }) {
    return _then(_$InventoryMenuStateImpl(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InventoryMenuStateImpl implements _InventoryMenuState {
  const _$InventoryMenuStateImpl({this.isOpen = false, this.selectedIndex = 0});

  @override
  @JsonKey()
  final bool isOpen;
  @override
  @JsonKey()
  final int selectedIndex;

  @override
  String toString() {
    return 'InventoryMenuState(isOpen: $isOpen, selectedIndex: $selectedIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryMenuStateImpl &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOpen, selectedIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryMenuStateImplCopyWith<_$InventoryMenuStateImpl> get copyWith =>
      __$$InventoryMenuStateImplCopyWithImpl<_$InventoryMenuStateImpl>(
          this, _$identity);
}

abstract class _InventoryMenuState implements InventoryMenuState {
  const factory _InventoryMenuState(
      {final bool isOpen, final int selectedIndex}) = _$InventoryMenuStateImpl;

  @override
  bool get isOpen;
  @override
  int get selectedIndex;
  @override
  @JsonKey(ignore: true)
  _$$InventoryMenuStateImplCopyWith<_$InventoryMenuStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
