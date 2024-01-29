import 'package:craftown/src/models/resource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool.freezed.dart';
part 'tool.g.dart';

enum ToolType {
  pick,
  axe,
  shovel,
  sythe,
  waterBucket,
}

@freezed
class Tool with _$Tool {
  const Tool._();

  const factory Tool({
    required String identifier,
    required String name,
    required String assetName,
    required ToolType type,
    @Default([]) List<Resource> resourcesRequired,
  }) = _Tool;

  factory Tool.fromJson(Map<String, dynamic> json) => _$ToolFromJson(json);

  String get assetPath {
    return "assets/images/tools/$assetName.png";
  }
}
