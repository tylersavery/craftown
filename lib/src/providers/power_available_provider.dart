import 'package:craftown/src/providers/power_generating_resources_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'power_available_provider.g.dart';

@Riverpod(keepAlive: true)
double powerAvailable(PowerAvailableRef ref) {
  final placedResources = ref.watch(powerGeneratingResourcesListProvider);

  return placedResources.fold(
    0.0,
    (pv, element) => pv + (element.sprite.resource.powerGenerated ?? 0),
  );
}
