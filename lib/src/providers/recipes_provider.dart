import 'package:craftown/src/data/resources.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipesProvider extends StateNotifier<List<Resource>> {
  final Ref ref;
  RecipesProvider(this.ref, List<Resource> initialState) : super(initialState);
}

final recipesProvider = StateNotifierProvider<RecipesProvider, List<Resource>>((ref) {
  return RecipesProvider(ref, Resources.craftable);
});
