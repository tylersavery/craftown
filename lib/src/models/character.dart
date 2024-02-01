import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

enum CharacterSkin {
  maleWhiteBlondHair("10", "Character10"),
  maleWhiteBrownHair("11", "Character11"),
  maleDarkBlackHair("03", "Character03"),
  femaleWhitePinkHat("16", "Character16"),
  femaleBlackBlackHair("18", "Character18"),
  femaleBlackBrownHair("30", "Character30"),
  ;

  final String id;

  final String assetNameSpace;

  const CharacterSkin(this.id, this.assetNameSpace);

  String get thumbnailAssetPath {
    return "assets/images/characters/$assetNameSpace/${assetNameSpace}_Walk_Down.png";
  }
}

CharacterSkin characterSkinFromJson(String value) {
  return CharacterSkin.values.firstWhere((element) => element.id == value);
}

String characterSkinToJson(CharacterSkin value) {
  return value.id;
}

@freezed
class Character with _$Character {
  const Character._();

  const factory Character({
    @JsonKey(fromJson: characterSkinFromJson, toJson: characterSkinToJson) required CharacterSkin skin,
    required String name,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
}
