import 'package:craftown/src/providers/power_generating_resources_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dirty_resources_sustainability_penalty_provider.g.dart';

@Riverpod(keepAlive: true)
double dirtyResourcesSustainablityPenalty(DirtyResourcesSustainablityPenaltyRef ref) {
  final powerGeneratingResources = ref.watch(powerGeneratingResourcesListProvider);

  return powerGeneratingResources.fold(0.0, (pv, element) => pv + element.sprite.resource.sustainabilityPenalty);
}
