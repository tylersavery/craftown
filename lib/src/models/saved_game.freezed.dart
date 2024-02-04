// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedGame _$SavedGameFromJson(Map<String, dynamic> json) {
  return _SavedGame.fromJson(json);
}

/// @nodoc
mixin _$SavedGame {
  String get identifier => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  Character get character => throw _privateConstructorUsedError;
  DateTime get savedAt => throw _privateConstructorUsedError;
  List<InventorySlot> get inventory => throw _privateConstructorUsedError;
  double get playerPositionX => throw _privateConstructorUsedError;
  double get playerPositionY => throw _privateConstructorUsedError;
  List<PlacedResource> get placedResources =>
      throw _privateConstructorUsedError;
  Stats get stats => throw _privateConstructorUsedError;
  Resource? get inHand => throw _privateConstructorUsedError;
  List<Farmland> get farmlands => throw _privateConstructorUsedError;
  List<ResearchLevel> get researchLevels => throw _privateConstructorUsedError;
  ResearchLevel? get isResearching => throw _privateConstructorUsedError;
  DateTime? get researchStarted => throw _privateConstructorUsedError;
  CalendarState get calendarState => throw _privateConstructorUsedError;
  List<PlacedFarmland> get placedFarmlands =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedGameCopyWith<SavedGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedGameCopyWith<$Res> {
  factory $SavedGameCopyWith(SavedGame value, $Res Function(SavedGame) then) =
      _$SavedGameCopyWithImpl<$Res, SavedGame>;
  @useResult
  $Res call(
      {String identifier,
      String fileName,
      Character character,
      DateTime savedAt,
      List<InventorySlot> inventory,
      double playerPositionX,
      double playerPositionY,
      List<PlacedResource> placedResources,
      Stats stats,
      Resource? inHand,
      List<Farmland> farmlands,
      List<ResearchLevel> researchLevels,
      ResearchLevel? isResearching,
      DateTime? researchStarted,
      CalendarState calendarState,
      List<PlacedFarmland> placedFarmlands});

  $CharacterCopyWith<$Res> get character;
  $StatsCopyWith<$Res> get stats;
  $ResourceCopyWith<$Res>? get inHand;
  $ResearchLevelCopyWith<$Res>? get isResearching;
  $CalendarStateCopyWith<$Res> get calendarState;
}

/// @nodoc
class _$SavedGameCopyWithImpl<$Res, $Val extends SavedGame>
    implements $SavedGameCopyWith<$Res> {
  _$SavedGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? fileName = null,
    Object? character = null,
    Object? savedAt = null,
    Object? inventory = null,
    Object? playerPositionX = null,
    Object? playerPositionY = null,
    Object? placedResources = null,
    Object? stats = null,
    Object? inHand = freezed,
    Object? farmlands = null,
    Object? researchLevels = null,
    Object? isResearching = freezed,
    Object? researchStarted = freezed,
    Object? calendarState = null,
    Object? placedFarmlands = null,
  }) {
    return _then(_value.copyWith(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character,
      savedAt: null == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inventory: null == inventory
          ? _value.inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<InventorySlot>,
      playerPositionX: null == playerPositionX
          ? _value.playerPositionX
          : playerPositionX // ignore: cast_nullable_to_non_nullable
              as double,
      playerPositionY: null == playerPositionY
          ? _value.playerPositionY
          : playerPositionY // ignore: cast_nullable_to_non_nullable
              as double,
      placedResources: null == placedResources
          ? _value.placedResources
          : placedResources // ignore: cast_nullable_to_non_nullable
              as List<PlacedResource>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Stats,
      inHand: freezed == inHand
          ? _value.inHand
          : inHand // ignore: cast_nullable_to_non_nullable
              as Resource?,
      farmlands: null == farmlands
          ? _value.farmlands
          : farmlands // ignore: cast_nullable_to_non_nullable
              as List<Farmland>,
      researchLevels: null == researchLevels
          ? _value.researchLevels
          : researchLevels // ignore: cast_nullable_to_non_nullable
              as List<ResearchLevel>,
      isResearching: freezed == isResearching
          ? _value.isResearching
          : isResearching // ignore: cast_nullable_to_non_nullable
              as ResearchLevel?,
      researchStarted: freezed == researchStarted
          ? _value.researchStarted
          : researchStarted // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      calendarState: null == calendarState
          ? _value.calendarState
          : calendarState // ignore: cast_nullable_to_non_nullable
              as CalendarState,
      placedFarmlands: null == placedFarmlands
          ? _value.placedFarmlands
          : placedFarmlands // ignore: cast_nullable_to_non_nullable
              as List<PlacedFarmland>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<$Res> get character {
    return $CharacterCopyWith<$Res>(_value.character, (value) {
      return _then(_value.copyWith(character: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatsCopyWith<$Res> get stats {
    return $StatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResourceCopyWith<$Res>? get inHand {
    if (_value.inHand == null) {
      return null;
    }

    return $ResourceCopyWith<$Res>(_value.inHand!, (value) {
      return _then(_value.copyWith(inHand: value) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $CalendarStateCopyWith<$Res> get calendarState {
    return $CalendarStateCopyWith<$Res>(_value.calendarState, (value) {
      return _then(_value.copyWith(calendarState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SavedGameImplCopyWith<$Res>
    implements $SavedGameCopyWith<$Res> {
  factory _$$SavedGameImplCopyWith(
          _$SavedGameImpl value, $Res Function(_$SavedGameImpl) then) =
      __$$SavedGameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String identifier,
      String fileName,
      Character character,
      DateTime savedAt,
      List<InventorySlot> inventory,
      double playerPositionX,
      double playerPositionY,
      List<PlacedResource> placedResources,
      Stats stats,
      Resource? inHand,
      List<Farmland> farmlands,
      List<ResearchLevel> researchLevels,
      ResearchLevel? isResearching,
      DateTime? researchStarted,
      CalendarState calendarState,
      List<PlacedFarmland> placedFarmlands});

  @override
  $CharacterCopyWith<$Res> get character;
  @override
  $StatsCopyWith<$Res> get stats;
  @override
  $ResourceCopyWith<$Res>? get inHand;
  @override
  $ResearchLevelCopyWith<$Res>? get isResearching;
  @override
  $CalendarStateCopyWith<$Res> get calendarState;
}

/// @nodoc
class __$$SavedGameImplCopyWithImpl<$Res>
    extends _$SavedGameCopyWithImpl<$Res, _$SavedGameImpl>
    implements _$$SavedGameImplCopyWith<$Res> {
  __$$SavedGameImplCopyWithImpl(
      _$SavedGameImpl _value, $Res Function(_$SavedGameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? fileName = null,
    Object? character = null,
    Object? savedAt = null,
    Object? inventory = null,
    Object? playerPositionX = null,
    Object? playerPositionY = null,
    Object? placedResources = null,
    Object? stats = null,
    Object? inHand = freezed,
    Object? farmlands = null,
    Object? researchLevels = null,
    Object? isResearching = freezed,
    Object? researchStarted = freezed,
    Object? calendarState = null,
    Object? placedFarmlands = null,
  }) {
    return _then(_$SavedGameImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character,
      savedAt: null == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inventory: null == inventory
          ? _value._inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as List<InventorySlot>,
      playerPositionX: null == playerPositionX
          ? _value.playerPositionX
          : playerPositionX // ignore: cast_nullable_to_non_nullable
              as double,
      playerPositionY: null == playerPositionY
          ? _value.playerPositionY
          : playerPositionY // ignore: cast_nullable_to_non_nullable
              as double,
      placedResources: null == placedResources
          ? _value._placedResources
          : placedResources // ignore: cast_nullable_to_non_nullable
              as List<PlacedResource>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Stats,
      inHand: freezed == inHand
          ? _value.inHand
          : inHand // ignore: cast_nullable_to_non_nullable
              as Resource?,
      farmlands: null == farmlands
          ? _value._farmlands
          : farmlands // ignore: cast_nullable_to_non_nullable
              as List<Farmland>,
      researchLevels: null == researchLevels
          ? _value._researchLevels
          : researchLevels // ignore: cast_nullable_to_non_nullable
              as List<ResearchLevel>,
      isResearching: freezed == isResearching
          ? _value.isResearching
          : isResearching // ignore: cast_nullable_to_non_nullable
              as ResearchLevel?,
      researchStarted: freezed == researchStarted
          ? _value.researchStarted
          : researchStarted // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      calendarState: null == calendarState
          ? _value.calendarState
          : calendarState // ignore: cast_nullable_to_non_nullable
              as CalendarState,
      placedFarmlands: null == placedFarmlands
          ? _value._placedFarmlands
          : placedFarmlands // ignore: cast_nullable_to_non_nullable
              as List<PlacedFarmland>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedGameImpl extends _SavedGame {
  const _$SavedGameImpl(
      {required this.identifier,
      required this.fileName,
      required this.character,
      required this.savedAt,
      final List<InventorySlot> inventory = const [],
      required this.playerPositionX,
      required this.playerPositionY,
      final List<PlacedResource> placedResources = const [],
      required this.stats,
      this.inHand,
      final List<Farmland> farmlands = const [],
      final List<ResearchLevel> researchLevels = const [],
      this.isResearching,
      this.researchStarted,
      required this.calendarState,
      final List<PlacedFarmland> placedFarmlands = const []})
      : _inventory = inventory,
        _placedResources = placedResources,
        _farmlands = farmlands,
        _researchLevels = researchLevels,
        _placedFarmlands = placedFarmlands,
        super._();

  factory _$SavedGameImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedGameImplFromJson(json);

  @override
  final String identifier;
  @override
  final String fileName;
  @override
  final Character character;
  @override
  final DateTime savedAt;
  final List<InventorySlot> _inventory;
  @override
  @JsonKey()
  List<InventorySlot> get inventory {
    if (_inventory is EqualUnmodifiableListView) return _inventory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inventory);
  }

  @override
  final double playerPositionX;
  @override
  final double playerPositionY;
  final List<PlacedResource> _placedResources;
  @override
  @JsonKey()
  List<PlacedResource> get placedResources {
    if (_placedResources is EqualUnmodifiableListView) return _placedResources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placedResources);
  }

  @override
  final Stats stats;
  @override
  final Resource? inHand;
  final List<Farmland> _farmlands;
  @override
  @JsonKey()
  List<Farmland> get farmlands {
    if (_farmlands is EqualUnmodifiableListView) return _farmlands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_farmlands);
  }

  final List<ResearchLevel> _researchLevels;
  @override
  @JsonKey()
  List<ResearchLevel> get researchLevels {
    if (_researchLevels is EqualUnmodifiableListView) return _researchLevels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_researchLevels);
  }

  @override
  final ResearchLevel? isResearching;
  @override
  final DateTime? researchStarted;
  @override
  final CalendarState calendarState;
  final List<PlacedFarmland> _placedFarmlands;
  @override
  @JsonKey()
  List<PlacedFarmland> get placedFarmlands {
    if (_placedFarmlands is EqualUnmodifiableListView) return _placedFarmlands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placedFarmlands);
  }

  @override
  String toString() {
    return 'SavedGame(identifier: $identifier, fileName: $fileName, character: $character, savedAt: $savedAt, inventory: $inventory, playerPositionX: $playerPositionX, playerPositionY: $playerPositionY, placedResources: $placedResources, stats: $stats, inHand: $inHand, farmlands: $farmlands, researchLevels: $researchLevels, isResearching: $isResearching, researchStarted: $researchStarted, calendarState: $calendarState, placedFarmlands: $placedFarmlands)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedGameImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt) &&
            const DeepCollectionEquality()
                .equals(other._inventory, _inventory) &&
            (identical(other.playerPositionX, playerPositionX) ||
                other.playerPositionX == playerPositionX) &&
            (identical(other.playerPositionY, playerPositionY) ||
                other.playerPositionY == playerPositionY) &&
            const DeepCollectionEquality()
                .equals(other._placedResources, _placedResources) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.inHand, inHand) || other.inHand == inHand) &&
            const DeepCollectionEquality()
                .equals(other._farmlands, _farmlands) &&
            const DeepCollectionEquality()
                .equals(other._researchLevels, _researchLevels) &&
            (identical(other.isResearching, isResearching) ||
                other.isResearching == isResearching) &&
            (identical(other.researchStarted, researchStarted) ||
                other.researchStarted == researchStarted) &&
            (identical(other.calendarState, calendarState) ||
                other.calendarState == calendarState) &&
            const DeepCollectionEquality()
                .equals(other._placedFarmlands, _placedFarmlands));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      identifier,
      fileName,
      character,
      savedAt,
      const DeepCollectionEquality().hash(_inventory),
      playerPositionX,
      playerPositionY,
      const DeepCollectionEquality().hash(_placedResources),
      stats,
      inHand,
      const DeepCollectionEquality().hash(_farmlands),
      const DeepCollectionEquality().hash(_researchLevels),
      isResearching,
      researchStarted,
      calendarState,
      const DeepCollectionEquality().hash(_placedFarmlands));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedGameImplCopyWith<_$SavedGameImpl> get copyWith =>
      __$$SavedGameImplCopyWithImpl<_$SavedGameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedGameImplToJson(
      this,
    );
  }
}

abstract class _SavedGame extends SavedGame {
  const factory _SavedGame(
      {required final String identifier,
      required final String fileName,
      required final Character character,
      required final DateTime savedAt,
      final List<InventorySlot> inventory,
      required final double playerPositionX,
      required final double playerPositionY,
      final List<PlacedResource> placedResources,
      required final Stats stats,
      final Resource? inHand,
      final List<Farmland> farmlands,
      final List<ResearchLevel> researchLevels,
      final ResearchLevel? isResearching,
      final DateTime? researchStarted,
      required final CalendarState calendarState,
      final List<PlacedFarmland> placedFarmlands}) = _$SavedGameImpl;
  const _SavedGame._() : super._();

  factory _SavedGame.fromJson(Map<String, dynamic> json) =
      _$SavedGameImpl.fromJson;

  @override
  String get identifier;
  @override
  String get fileName;
  @override
  Character get character;
  @override
  DateTime get savedAt;
  @override
  List<InventorySlot> get inventory;
  @override
  double get playerPositionX;
  @override
  double get playerPositionY;
  @override
  List<PlacedResource> get placedResources;
  @override
  Stats get stats;
  @override
  Resource? get inHand;
  @override
  List<Farmland> get farmlands;
  @override
  List<ResearchLevel> get researchLevels;
  @override
  ResearchLevel? get isResearching;
  @override
  DateTime? get researchStarted;
  @override
  CalendarState get calendarState;
  @override
  List<PlacedFarmland> get placedFarmlands;
  @override
  @JsonKey(ignore: true)
  _$$SavedGameImplCopyWith<_$SavedGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
