// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Recipe {
  String get name => throw _privateConstructorUsedError;
  String get assetFileName => throw _privateConstructorUsedError;
  List<Ingredient> get resourceIngredients =>
      throw _privateConstructorUsedError;
  int get secondsToCraft => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {String name,
      String assetFileName,
      List<Ingredient> resourceIngredients,
      int secondsToCraft});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? assetFileName = null,
    Object? resourceIngredients = null,
    Object? secondsToCraft = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      assetFileName: null == assetFileName
          ? _value.assetFileName
          : assetFileName // ignore: cast_nullable_to_non_nullable
              as String,
      resourceIngredients: null == resourceIngredients
          ? _value.resourceIngredients
          : resourceIngredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      secondsToCraft: null == secondsToCraft
          ? _value.secondsToCraft
          : secondsToCraft // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
          _$RecipeImpl value, $Res Function(_$RecipeImpl) then) =
      __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String assetFileName,
      List<Ingredient> resourceIngredients,
      int secondsToCraft});
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
      _$RecipeImpl _value, $Res Function(_$RecipeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? assetFileName = null,
    Object? resourceIngredients = null,
    Object? secondsToCraft = null,
  }) {
    return _then(_$RecipeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      assetFileName: null == assetFileName
          ? _value.assetFileName
          : assetFileName // ignore: cast_nullable_to_non_nullable
              as String,
      resourceIngredients: null == resourceIngredients
          ? _value._resourceIngredients
          : resourceIngredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      secondsToCraft: null == secondsToCraft
          ? _value.secondsToCraft
          : secondsToCraft // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RecipeImpl extends _Recipe {
  const _$RecipeImpl(
      {required this.name,
      required this.assetFileName,
      final List<Ingredient> resourceIngredients = const [],
      required this.secondsToCraft})
      : _resourceIngredients = resourceIngredients,
        super._();

  @override
  final String name;
  @override
  final String assetFileName;
  final List<Ingredient> _resourceIngredients;
  @override
  @JsonKey()
  List<Ingredient> get resourceIngredients {
    if (_resourceIngredients is EqualUnmodifiableListView)
      return _resourceIngredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resourceIngredients);
  }

  @override
  final int secondsToCraft;

  @override
  String toString() {
    return 'Recipe(name: $name, assetFileName: $assetFileName, resourceIngredients: $resourceIngredients, secondsToCraft: $secondsToCraft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.assetFileName, assetFileName) ||
                other.assetFileName == assetFileName) &&
            const DeepCollectionEquality()
                .equals(other._resourceIngredients, _resourceIngredients) &&
            (identical(other.secondsToCraft, secondsToCraft) ||
                other.secondsToCraft == secondsToCraft));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      assetFileName,
      const DeepCollectionEquality().hash(_resourceIngredients),
      secondsToCraft);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);
}

abstract class _Recipe extends Recipe {
  const factory _Recipe(
      {required final String name,
      required final String assetFileName,
      final List<Ingredient> resourceIngredients,
      required final int secondsToCraft}) = _$RecipeImpl;
  const _Recipe._() : super._();

  @override
  String get name;
  @override
  String get assetFileName;
  @override
  List<Ingredient> get resourceIngredients;
  @override
  int get secondsToCraft;
  @override
  @JsonKey(ignore: true)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
