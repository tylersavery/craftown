// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'placed_resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlacedResource _$PlacedResourceFromJson(Map<String, dynamic> json) {
  return _PlacedResource.fromJson(json);
}

/// @nodoc
mixin _$PlacedResource {
  String get uniqueIdentifier => throw _privateConstructorUsedError;
  ResourceSprite get sprite => throw _privateConstructorUsedError;
  List<List<Resource>> get contents => throw _privateConstructorUsedError;
  Resource? get selectedRecipe => throw _privateConstructorUsedError;
  bool get isConstructing => throw _privateConstructorUsedError;
  bool get isSelling => throw _privateConstructorUsedError;
  bool get isMining => throw _privateConstructorUsedError;
  List<Resource> get outputSlotContents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacedResourceCopyWith<PlacedResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacedResourceCopyWith<$Res> {
  factory $PlacedResourceCopyWith(
          PlacedResource value, $Res Function(PlacedResource) then) =
      _$PlacedResourceCopyWithImpl<$Res, PlacedResource>;
  @useResult
  $Res call(
      {String uniqueIdentifier,
      ResourceSprite sprite,
      List<List<Resource>> contents,
      Resource? selectedRecipe,
      bool isConstructing,
      bool isSelling,
      bool isMining,
      List<Resource> outputSlotContents});

  $ResourceCopyWith<$Res>? get selectedRecipe;
}

/// @nodoc
class _$PlacedResourceCopyWithImpl<$Res, $Val extends PlacedResource>
    implements $PlacedResourceCopyWith<$Res> {
  _$PlacedResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueIdentifier = null,
    Object? sprite = null,
    Object? contents = null,
    Object? selectedRecipe = freezed,
    Object? isConstructing = null,
    Object? isSelling = null,
    Object? isMining = null,
    Object? outputSlotContents = null,
  }) {
    return _then(_value.copyWith(
      uniqueIdentifier: null == uniqueIdentifier
          ? _value.uniqueIdentifier
          : uniqueIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      sprite: null == sprite
          ? _value.sprite
          : sprite // ignore: cast_nullable_to_non_nullable
              as ResourceSprite,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<List<Resource>>,
      selectedRecipe: freezed == selectedRecipe
          ? _value.selectedRecipe
          : selectedRecipe // ignore: cast_nullable_to_non_nullable
              as Resource?,
      isConstructing: null == isConstructing
          ? _value.isConstructing
          : isConstructing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelling: null == isSelling
          ? _value.isSelling
          : isSelling // ignore: cast_nullable_to_non_nullable
              as bool,
      isMining: null == isMining
          ? _value.isMining
          : isMining // ignore: cast_nullable_to_non_nullable
              as bool,
      outputSlotContents: null == outputSlotContents
          ? _value.outputSlotContents
          : outputSlotContents // ignore: cast_nullable_to_non_nullable
              as List<Resource>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResourceCopyWith<$Res>? get selectedRecipe {
    if (_value.selectedRecipe == null) {
      return null;
    }

    return $ResourceCopyWith<$Res>(_value.selectedRecipe!, (value) {
      return _then(_value.copyWith(selectedRecipe: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlacedResourceImplCopyWith<$Res>
    implements $PlacedResourceCopyWith<$Res> {
  factory _$$PlacedResourceImplCopyWith(_$PlacedResourceImpl value,
          $Res Function(_$PlacedResourceImpl) then) =
      __$$PlacedResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uniqueIdentifier,
      ResourceSprite sprite,
      List<List<Resource>> contents,
      Resource? selectedRecipe,
      bool isConstructing,
      bool isSelling,
      bool isMining,
      List<Resource> outputSlotContents});

  @override
  $ResourceCopyWith<$Res>? get selectedRecipe;
}

/// @nodoc
class __$$PlacedResourceImplCopyWithImpl<$Res>
    extends _$PlacedResourceCopyWithImpl<$Res, _$PlacedResourceImpl>
    implements _$$PlacedResourceImplCopyWith<$Res> {
  __$$PlacedResourceImplCopyWithImpl(
      _$PlacedResourceImpl _value, $Res Function(_$PlacedResourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uniqueIdentifier = null,
    Object? sprite = null,
    Object? contents = null,
    Object? selectedRecipe = freezed,
    Object? isConstructing = null,
    Object? isSelling = null,
    Object? isMining = null,
    Object? outputSlotContents = null,
  }) {
    return _then(_$PlacedResourceImpl(
      uniqueIdentifier: null == uniqueIdentifier
          ? _value.uniqueIdentifier
          : uniqueIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      sprite: null == sprite
          ? _value.sprite
          : sprite // ignore: cast_nullable_to_non_nullable
              as ResourceSprite,
      contents: null == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<List<Resource>>,
      selectedRecipe: freezed == selectedRecipe
          ? _value.selectedRecipe
          : selectedRecipe // ignore: cast_nullable_to_non_nullable
              as Resource?,
      isConstructing: null == isConstructing
          ? _value.isConstructing
          : isConstructing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelling: null == isSelling
          ? _value.isSelling
          : isSelling // ignore: cast_nullable_to_non_nullable
              as bool,
      isMining: null == isMining
          ? _value.isMining
          : isMining // ignore: cast_nullable_to_non_nullable
              as bool,
      outputSlotContents: null == outputSlotContents
          ? _value._outputSlotContents
          : outputSlotContents // ignore: cast_nullable_to_non_nullable
              as List<Resource>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlacedResourceImpl extends _PlacedResource {
  const _$PlacedResourceImpl(
      {required this.uniqueIdentifier,
      required this.sprite,
      final List<List<Resource>> contents = const [],
      this.selectedRecipe,
      this.isConstructing = false,
      this.isSelling = false,
      this.isMining = false,
      final List<Resource> outputSlotContents = const []})
      : _contents = contents,
        _outputSlotContents = outputSlotContents,
        super._();

  factory _$PlacedResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlacedResourceImplFromJson(json);

  @override
  final String uniqueIdentifier;
  @override
  final ResourceSprite sprite;
  final List<List<Resource>> _contents;
  @override
  @JsonKey()
  List<List<Resource>> get contents {
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contents);
  }

  @override
  final Resource? selectedRecipe;
  @override
  @JsonKey()
  final bool isConstructing;
  @override
  @JsonKey()
  final bool isSelling;
  @override
  @JsonKey()
  final bool isMining;
  final List<Resource> _outputSlotContents;
  @override
  @JsonKey()
  List<Resource> get outputSlotContents {
    if (_outputSlotContents is EqualUnmodifiableListView)
      return _outputSlotContents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outputSlotContents);
  }

  @override
  String toString() {
    return 'PlacedResource(uniqueIdentifier: $uniqueIdentifier, sprite: $sprite, contents: $contents, selectedRecipe: $selectedRecipe, isConstructing: $isConstructing, isSelling: $isSelling, isMining: $isMining, outputSlotContents: $outputSlotContents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacedResourceImpl &&
            (identical(other.uniqueIdentifier, uniqueIdentifier) ||
                other.uniqueIdentifier == uniqueIdentifier) &&
            (identical(other.sprite, sprite) || other.sprite == sprite) &&
            const DeepCollectionEquality().equals(other._contents, _contents) &&
            (identical(other.selectedRecipe, selectedRecipe) ||
                other.selectedRecipe == selectedRecipe) &&
            (identical(other.isConstructing, isConstructing) ||
                other.isConstructing == isConstructing) &&
            (identical(other.isSelling, isSelling) ||
                other.isSelling == isSelling) &&
            (identical(other.isMining, isMining) ||
                other.isMining == isMining) &&
            const DeepCollectionEquality()
                .equals(other._outputSlotContents, _outputSlotContents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uniqueIdentifier,
      sprite,
      const DeepCollectionEquality().hash(_contents),
      selectedRecipe,
      isConstructing,
      isSelling,
      isMining,
      const DeepCollectionEquality().hash(_outputSlotContents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacedResourceImplCopyWith<_$PlacedResourceImpl> get copyWith =>
      __$$PlacedResourceImplCopyWithImpl<_$PlacedResourceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlacedResourceImplToJson(
      this,
    );
  }
}

abstract class _PlacedResource extends PlacedResource {
  const factory _PlacedResource(
      {required final String uniqueIdentifier,
      required final ResourceSprite sprite,
      final List<List<Resource>> contents,
      final Resource? selectedRecipe,
      final bool isConstructing,
      final bool isSelling,
      final bool isMining,
      final List<Resource> outputSlotContents}) = _$PlacedResourceImpl;
  const _PlacedResource._() : super._();

  factory _PlacedResource.fromJson(Map<String, dynamic> json) =
      _$PlacedResourceImpl.fromJson;

  @override
  String get uniqueIdentifier;
  @override
  ResourceSprite get sprite;
  @override
  List<List<Resource>> get contents;
  @override
  Resource? get selectedRecipe;
  @override
  bool get isConstructing;
  @override
  bool get isSelling;
  @override
  bool get isMining;
  @override
  List<Resource> get outputSlotContents;
  @override
  @JsonKey(ignore: true)
  _$$PlacedResourceImplCopyWith<_$PlacedResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
