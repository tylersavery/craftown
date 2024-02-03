import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/research_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resource_available_from_research_provider.g.dart';

@Riverpod(keepAlive: true)
bool resourceAvailableFromResearch(ResourceAvailableFromResearchRef ref, Resource resource) {
  final researchLevels = resource.researchRequirements;

  final researchLevelsCompleted = ref.watch(researchListProvider);

  for (final rl in researchLevels) {
    if (!researchLevelsCompleted.contains(rl)) {
      return false;
    }
  }
  return true;
}
