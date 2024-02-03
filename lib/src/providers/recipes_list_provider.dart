import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/resource_available_from_research_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_list_provider.g.dart';

enum RecipeListType {
  craftable,
  constructable,
}

// @Riverpod(keepAlive: true)
// class RecipesList extends _$RecipesList {
//   @override
//   List<Resource> build(RecipeListType type) {
//     switch (type) {
//       case RecipeListType.craftable:
//         return Resources.craftable.where((r) => ref.watch(resourceAvailableFromResearchProvider(r))).toList();
//       case RecipeListType.constructable:
//         return Resources.constructable.where((r) => ref.watch(resourceAvailableFromResearchProvider(r))).toList();
//     }
//   }
// }

@Riverpod(keepAlive: true)
List<Resource> recipeList(RecipeListRef ref, RecipeListType type) {
  switch (type) {
    case RecipeListType.craftable:
      return Resources.craftable.where((r) => ref.watch(resourceAvailableFromResearchProvider(r))).toList();
    case RecipeListType.constructable:
      return Resources.constructable.where((r) => ref.watch(resourceAvailableFromResearchProvider(r))).toList();
  }
}
