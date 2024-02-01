import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_list_provider.g.dart';

@Riverpod(keepAlive: true)
class RecipesList extends _$RecipesList {
  @override
  List<Resource> build() {
    return Resources.craftable;
  }
}
