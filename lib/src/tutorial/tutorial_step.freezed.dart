// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutorial_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TutorialStep _$TutorialStepFromJson(Map<String, dynamic> json) {
  return _TutorialStep.fromJson(json);
}

/// @nodoc
mixin _$TutorialStep {
  int get index => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<Ingredient> get resourcesRequired => throw _privateConstructorUsedError;
  List<Ingredient> get placedResourcesRequired =>
      throw _privateConstructorUsedError;
  List<ResearchLevel> get researchLevelsRequired =>
      throw _privateConstructorUsedError;
  bool get powerAvailableRequired => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TutorialStepCopyWith<TutorialStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorialStepCopyWith<$Res> {
  factory $TutorialStepCopyWith(
          TutorialStep value, $Res Function(TutorialStep) then) =
      _$TutorialStepCopyWithImpl<$Res, TutorialStep>;
  @useResult
  $Res call(
      {int index,
      String name,
      String description,
      List<Ingredient> resourcesRequired,
      List<Ingredient> placedResourcesRequired,
      List<ResearchLevel> researchLevelsRequired,
      bool powerAvailableRequired});
}

/// @nodoc
class _$TutorialStepCopyWithImpl<$Res, $Val extends TutorialStep>
    implements $TutorialStepCopyWith<$Res> {
  _$TutorialStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? name = null,
    Object? description = null,
    Object? resourcesRequired = null,
    Object? placedResourcesRequired = null,
    Object? researchLevelsRequired = null,
    Object? powerAvailableRequired = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      resourcesRequired: null == resourcesRequired
          ? _value.resourcesRequired
          : resourcesRequired // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      placedResourcesRequired: null == placedResourcesRequired
          ? _value.placedResourcesRequired
          : placedResourcesRequired // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      researchLevelsRequired: null == researchLevelsRequired
          ? _value.researchLevelsRequired
          : researchLevelsRequired // ignore: cast_nullable_to_non_nullable
              as List<ResearchLevel>,
      powerAvailableRequired: null == powerAvailableRequired
          ? _value.powerAvailableRequired
          : powerAvailableRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TutorialStepImplCopyWith<$Res>
    implements $TutorialStepCopyWith<$Res> {
  factory _$$TutorialStepImplCopyWith(
          _$TutorialStepImpl value, $Res Function(_$TutorialStepImpl) then) =
      __$$TutorialStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int index,
      String name,
      String description,
      List<Ingredient> resourcesRequired,
      List<Ingredient> placedResourcesRequired,
      List<ResearchLevel> researchLevelsRequired,
      bool powerAvailableRequired});
}

/// @nodoc
class __$$TutorialStepImplCopyWithImpl<$Res>
    extends _$TutorialStepCopyWithImpl<$Res, _$TutorialStepImpl>
    implements _$$TutorialStepImplCopyWith<$Res> {
  __$$TutorialStepImplCopyWithImpl(
      _$TutorialStepImpl _value, $Res Function(_$TutorialStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? name = null,
    Object? description = null,
    Object? resourcesRequired = null,
    Object? placedResourcesRequired = null,
    Object? researchLevelsRequired = null,
    Object? powerAvailableRequired = null,
  }) {
    return _then(_$TutorialStepImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      resourcesRequired: null == resourcesRequired
          ? _value._resourcesRequired
          : resourcesRequired // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      placedResourcesRequired: null == placedResourcesRequired
          ? _value._placedResourcesRequired
          : placedResourcesRequired // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      researchLevelsRequired: null == researchLevelsRequired
          ? _value._researchLevelsRequired
          : researchLevelsRequired // ignore: cast_nullable_to_non_nullable
              as List<ResearchLevel>,
      powerAvailableRequired: null == powerAvailableRequired
          ? _value.powerAvailableRequired
          : powerAvailableRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TutorialStepImpl extends _TutorialStep {
  const _$TutorialStepImpl(
      {required this.index,
      required this.name,
      required this.description,
      final List<Ingredient> resourcesRequired = const [],
      final List<Ingredient> placedResourcesRequired = const [],
      final List<ResearchLevel> researchLevelsRequired = const [],
      this.powerAvailableRequired = false})
      : _resourcesRequired = resourcesRequired,
        _placedResourcesRequired = placedResourcesRequired,
        _researchLevelsRequired = researchLevelsRequired,
        super._();

  factory _$TutorialStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$TutorialStepImplFromJson(json);

  @override
  final int index;
  @override
  final String name;
  @override
  final String description;
  final List<Ingredient> _resourcesRequired;
  @override
  @JsonKey()
  List<Ingredient> get resourcesRequired {
    if (_resourcesRequired is EqualUnmodifiableListView)
      return _resourcesRequired;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resourcesRequired);
  }

  final List<Ingredient> _placedResourcesRequired;
  @override
  @JsonKey()
  List<Ingredient> get placedResourcesRequired {
    if (_placedResourcesRequired is EqualUnmodifiableListView)
      return _placedResourcesRequired;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placedResourcesRequired);
  }

  final List<ResearchLevel> _researchLevelsRequired;
  @override
  @JsonKey()
  List<ResearchLevel> get researchLevelsRequired {
    if (_researchLevelsRequired is EqualUnmodifiableListView)
      return _researchLevelsRequired;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_researchLevelsRequired);
  }

  @override
  @JsonKey()
  final bool powerAvailableRequired;

  @override
  String toString() {
    return 'TutorialStep(index: $index, name: $name, description: $description, resourcesRequired: $resourcesRequired, placedResourcesRequired: $placedResourcesRequired, researchLevelsRequired: $researchLevelsRequired, powerAvailableRequired: $powerAvailableRequired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TutorialStepImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._resourcesRequired, _resourcesRequired) &&
            const DeepCollectionEquality().equals(
                other._placedResourcesRequired, _placedResourcesRequired) &&
            const DeepCollectionEquality().equals(
                other._researchLevelsRequired, _researchLevelsRequired) &&
            (identical(other.powerAvailableRequired, powerAvailableRequired) ||
                other.powerAvailableRequired == powerAvailableRequired));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      index,
      name,
      description,
      const DeepCollectionEquality().hash(_resourcesRequired),
      const DeepCollectionEquality().hash(_placedResourcesRequired),
      const DeepCollectionEquality().hash(_researchLevelsRequired),
      powerAvailableRequired);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TutorialStepImplCopyWith<_$TutorialStepImpl> get copyWith =>
      __$$TutorialStepImplCopyWithImpl<_$TutorialStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TutorialStepImplToJson(
      this,
    );
  }
}

abstract class _TutorialStep extends TutorialStep {
  const factory _TutorialStep(
      {required final int index,
      required final String name,
      required final String description,
      final List<Ingredient> resourcesRequired,
      final List<Ingredient> placedResourcesRequired,
      final List<ResearchLevel> researchLevelsRequired,
      final bool powerAvailableRequired}) = _$TutorialStepImpl;
  const _TutorialStep._() : super._();

  factory _TutorialStep.fromJson(Map<String, dynamic> json) =
      _$TutorialStepImpl.fromJson;

  @override
  int get index;
  @override
  String get name;
  @override
  String get description;
  @override
  List<Ingredient> get resourcesRequired;
  @override
  List<Ingredient> get placedResourcesRequired;
  @override
  List<ResearchLevel> get researchLevelsRequired;
  @override
  bool get powerAvailableRequired;
  @override
  @JsonKey(ignore: true)
  _$$TutorialStepImplCopyWith<_$TutorialStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
