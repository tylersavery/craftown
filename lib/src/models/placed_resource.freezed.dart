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
  bool get isSmelting => throw _privateConstructorUsedError;
  List<Resource> get outputSlotContents => throw _privateConstructorUsedError;
  int get tileX => throw _privateConstructorUsedError;
  int get tileY => throw _privateConstructorUsedError;
  int get tileSizeX => throw _privateConstructorUsedError;
  int get tileSizeY => throw _privateConstructorUsedError;
  int get rotationQuarterTurns => throw _privateConstructorUsedError;

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
      bool isSmelting,
      List<Resource> outputSlotContents,
      int tileX,
      int tileY,
      int tileSizeX,
      int tileSizeY,
      int rotationQuarterTurns});

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
    Object? isSmelting = null,
    Object? outputSlotContents = null,
    Object? tileX = null,
    Object? tileY = null,
    Object? tileSizeX = null,
    Object? tileSizeY = null,
    Object? rotationQuarterTurns = null,
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
      isSmelting: null == isSmelting
          ? _value.isSmelting
          : isSmelting // ignore: cast_nullable_to_non_nullable
              as bool,
      outputSlotContents: null == outputSlotContents
          ? _value.outputSlotContents
          : outputSlotContents // ignore: cast_nullable_to_non_nullable
              as List<Resource>,
      tileX: null == tileX
          ? _value.tileX
          : tileX // ignore: cast_nullable_to_non_nullable
              as int,
      tileY: null == tileY
          ? _value.tileY
          : tileY // ignore: cast_nullable_to_non_nullable
              as int,
      tileSizeX: null == tileSizeX
          ? _value.tileSizeX
          : tileSizeX // ignore: cast_nullable_to_non_nullable
              as int,
      tileSizeY: null == tileSizeY
          ? _value.tileSizeY
          : tileSizeY // ignore: cast_nullable_to_non_nullable
              as int,
      rotationQuarterTurns: null == rotationQuarterTurns
          ? _value.rotationQuarterTurns
          : rotationQuarterTurns // ignore: cast_nullable_to_non_nullable
              as int,
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
      bool isSmelting,
      List<Resource> outputSlotContents,
      int tileX,
      int tileY,
      int tileSizeX,
      int tileSizeY,
      int rotationQuarterTurns});

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
    Object? isSmelting = null,
    Object? outputSlotContents = null,
    Object? tileX = null,
    Object? tileY = null,
    Object? tileSizeX = null,
    Object? tileSizeY = null,
    Object? rotationQuarterTurns = null,
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
      isSmelting: null == isSmelting
          ? _value.isSmelting
          : isSmelting // ignore: cast_nullable_to_non_nullable
              as bool,
      outputSlotContents: null == outputSlotContents
          ? _value._outputSlotContents
          : outputSlotContents // ignore: cast_nullable_to_non_nullable
              as List<Resource>,
      tileX: null == tileX
          ? _value.tileX
          : tileX // ignore: cast_nullable_to_non_nullable
              as int,
      tileY: null == tileY
          ? _value.tileY
          : tileY // ignore: cast_nullable_to_non_nullable
              as int,
      tileSizeX: null == tileSizeX
          ? _value.tileSizeX
          : tileSizeX // ignore: cast_nullable_to_non_nullable
              as int,
      tileSizeY: null == tileSizeY
          ? _value.tileSizeY
          : tileSizeY // ignore: cast_nullable_to_non_nullable
              as int,
      rotationQuarterTurns: null == rotationQuarterTurns
          ? _value.rotationQuarterTurns
          : rotationQuarterTurns // ignore: cast_nullable_to_non_nullable
              as int,
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
      this.isSmelting = false,
      final List<Resource> outputSlotContents = const [],
      required this.tileX,
      required this.tileY,
      required this.tileSizeX,
      required this.tileSizeY,
      this.rotationQuarterTurns = 0})
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
  @override
  @JsonKey()
  final bool isSmelting;
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
  final int tileX;
  @override
  final int tileY;
  @override
  final int tileSizeX;
  @override
  final int tileSizeY;
  @override
  @JsonKey()
  final int rotationQuarterTurns;

  @override
  String toString() {
    return 'PlacedResource(uniqueIdentifier: $uniqueIdentifier, sprite: $sprite, contents: $contents, selectedRecipe: $selectedRecipe, isConstructing: $isConstructing, isSelling: $isSelling, isMining: $isMining, isSmelting: $isSmelting, outputSlotContents: $outputSlotContents, tileX: $tileX, tileY: $tileY, tileSizeX: $tileSizeX, tileSizeY: $tileSizeY, rotationQuarterTurns: $rotationQuarterTurns)';
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
            (identical(other.isSmelting, isSmelting) ||
                other.isSmelting == isSmelting) &&
            const DeepCollectionEquality()
                .equals(other._outputSlotContents, _outputSlotContents) &&
            (identical(other.tileX, tileX) || other.tileX == tileX) &&
            (identical(other.tileY, tileY) || other.tileY == tileY) &&
            (identical(other.tileSizeX, tileSizeX) ||
                other.tileSizeX == tileSizeX) &&
            (identical(other.tileSizeY, tileSizeY) ||
                other.tileSizeY == tileSizeY) &&
            (identical(other.rotationQuarterTurns, rotationQuarterTurns) ||
                other.rotationQuarterTurns == rotationQuarterTurns));
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
      isSmelting,
      const DeepCollectionEquality().hash(_outputSlotContents),
      tileX,
      tileY,
      tileSizeX,
      tileSizeY,
      rotationQuarterTurns);

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
      final bool isSmelting,
      final List<Resource> outputSlotContents,
      required final int tileX,
      required final int tileY,
      required final int tileSizeX,
      required final int tileSizeY,
      final int rotationQuarterTurns}) = _$PlacedResourceImpl;
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
  bool get isSmelting;
  @override
  List<Resource> get outputSlotContents;
  @override
  int get tileX;
  @override
  int get tileY;
  @override
  int get tileSizeX;
  @override
  int get tileSizeY;
  @override
  int get rotationQuarterTurns;
  @override
  @JsonKey(ignore: true)
  _$$PlacedResourceImplCopyWith<_$PlacedResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
