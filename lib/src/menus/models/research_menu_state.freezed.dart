// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'research_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResearchMenuState {
  bool get isOpen => throw _privateConstructorUsedError;
  ResearchLevel? get expandedResearchLevel =>
      throw _privateConstructorUsedError;
  ResearchLevel? get isResearching => throw _privateConstructorUsedError;
  DateTime? get researchStarted => throw _privateConstructorUsedError;
  double get scrollOffset => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResearchMenuStateCopyWith<ResearchMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResearchMenuStateCopyWith<$Res> {
  factory $ResearchMenuStateCopyWith(
          ResearchMenuState value, $Res Function(ResearchMenuState) then) =
      _$ResearchMenuStateCopyWithImpl<$Res, ResearchMenuState>;
  @useResult
  $Res call(
      {bool isOpen,
      ResearchLevel? expandedResearchLevel,
      ResearchLevel? isResearching,
      DateTime? researchStarted,
      double scrollOffset});

  $ResearchLevelCopyWith<$Res>? get expandedResearchLevel;
  $ResearchLevelCopyWith<$Res>? get isResearching;
}

/// @nodoc
class _$ResearchMenuStateCopyWithImpl<$Res, $Val extends ResearchMenuState>
    implements $ResearchMenuStateCopyWith<$Res> {
  _$ResearchMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? expandedResearchLevel = freezed,
    Object? isResearching = freezed,
    Object? researchStarted = freezed,
    Object? scrollOffset = null,
  }) {
    return _then(_value.copyWith(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      expandedResearchLevel: freezed == expandedResearchLevel
          ? _value.expandedResearchLevel
          : expandedResearchLevel // ignore: cast_nullable_to_non_nullable
              as ResearchLevel?,
      isResearching: freezed == isResearching
          ? _value.isResearching
          : isResearching // ignore: cast_nullable_to_non_nullable
              as ResearchLevel?,
      researchStarted: freezed == researchStarted
          ? _value.researchStarted
          : researchStarted // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scrollOffset: null == scrollOffset
          ? _value.scrollOffset
          : scrollOffset // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResearchLevelCopyWith<$Res>? get expandedResearchLevel {
    if (_value.expandedResearchLevel == null) {
      return null;
    }

    return $ResearchLevelCopyWith<$Res>(_value.expandedResearchLevel!, (value) {
      return _then(_value.copyWith(expandedResearchLevel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResearchLevelCopyWith<$Res>? get isResearching {
    if (_value.isResearching == null) {
      return null;
    }

    return $ResearchLevelCopyWith<$Res>(_value.isResearching!, (value) {
      return _then(_value.copyWith(isResearching: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResearchMenuStateImplCopyWith<$Res>
    implements $ResearchMenuStateCopyWith<$Res> {
  factory _$$ResearchMenuStateImplCopyWith(_$ResearchMenuStateImpl value,
          $Res Function(_$ResearchMenuStateImpl) then) =
      __$$ResearchMenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isOpen,
      ResearchLevel? expandedResearchLevel,
      ResearchLevel? isResearching,
      DateTime? researchStarted,
      double scrollOffset});

  @override
  $ResearchLevelCopyWith<$Res>? get expandedResearchLevel;
  @override
  $ResearchLevelCopyWith<$Res>? get isResearching;
}

/// @nodoc
class __$$ResearchMenuStateImplCopyWithImpl<$Res>
    extends _$ResearchMenuStateCopyWithImpl<$Res, _$ResearchMenuStateImpl>
    implements _$$ResearchMenuStateImplCopyWith<$Res> {
  __$$ResearchMenuStateImplCopyWithImpl(_$ResearchMenuStateImpl _value,
      $Res Function(_$ResearchMenuStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? expandedResearchLevel = freezed,
    Object? isResearching = freezed,
    Object? researchStarted = freezed,
    Object? scrollOffset = null,
  }) {
    return _then(_$ResearchMenuStateImpl(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      expandedResearchLevel: freezed == expandedResearchLevel
          ? _value.expandedResearchLevel
          : expandedResearchLevel // ignore: cast_nullable_to_non_nullable
              as ResearchLevel?,
      isResearching: freezed == isResearching
          ? _value.isResearching
          : isResearching // ignore: cast_nullable_to_non_nullable
              as ResearchLevel?,
      researchStarted: freezed == researchStarted
          ? _value.researchStarted
          : researchStarted // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scrollOffset: null == scrollOffset
          ? _value.scrollOffset
          : scrollOffset // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ResearchMenuStateImpl extends _ResearchMenuState {
  const _$ResearchMenuStateImpl(
      {this.isOpen = false,
      this.expandedResearchLevel,
      this.isResearching,
      this.researchStarted,
      this.scrollOffset = 0})
      : super._();

  @override
  @JsonKey()
  final bool isOpen;
  @override
  final ResearchLevel? expandedResearchLevel;
  @override
  final ResearchLevel? isResearching;
  @override
  final DateTime? researchStarted;
  @override
  @JsonKey()
  final double scrollOffset;

  @override
  String toString() {
    return 'ResearchMenuState(isOpen: $isOpen, expandedResearchLevel: $expandedResearchLevel, isResearching: $isResearching, researchStarted: $researchStarted, scrollOffset: $scrollOffset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResearchMenuStateImpl &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.expandedResearchLevel, expandedResearchLevel) ||
                other.expandedResearchLevel == expandedResearchLevel) &&
            (identical(other.isResearching, isResearching) ||
                other.isResearching == isResearching) &&
            (identical(other.researchStarted, researchStarted) ||
                other.researchStarted == researchStarted) &&
            (identical(other.scrollOffset, scrollOffset) ||
                other.scrollOffset == scrollOffset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOpen, expandedResearchLevel,
      isResearching, researchStarted, scrollOffset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResearchMenuStateImplCopyWith<_$ResearchMenuStateImpl> get copyWith =>
      __$$ResearchMenuStateImplCopyWithImpl<_$ResearchMenuStateImpl>(
          this, _$identity);
}

abstract class _ResearchMenuState extends ResearchMenuState {
  const factory _ResearchMenuState(
      {final bool isOpen,
      final ResearchLevel? expandedResearchLevel,
      final ResearchLevel? isResearching,
      final DateTime? researchStarted,
      final double scrollOffset}) = _$ResearchMenuStateImpl;
  const _ResearchMenuState._() : super._();

  @override
  bool get isOpen;
  @override
  ResearchLevel? get expandedResearchLevel;
  @override
  ResearchLevel? get isResearching;
  @override
  DateTime? get researchStarted;
  @override
  double get scrollOffset;
  @override
  @JsonKey(ignore: true)
  _$$ResearchMenuStateImplCopyWith<_$ResearchMenuStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
