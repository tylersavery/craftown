import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_list_provider.g.dart';

enum RecipeListType {
  craftable,
  constructable,
}

@Riverpod(keepAlive: true)
class RecipesList extends _$RecipesList {
  @override
  List<Resource> build(RecipeListType type) {
    switch (type) {
      case RecipeListType.craftable:
        return Resources.craftable;
      case RecipeListType.constructable:
        return Resources.constructable;
    }
  }
}
