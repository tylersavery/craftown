import 'package:craftown/src/providers/power_consuming_resources_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'power_consumption_provider.g.dart';

@Riverpod(keepAlive: true)
double powerConsumption(PowerConsumptionRef ref) {
  final placedResources = ref.watch(powerConsumingResourcesListProvider);

  return placedResources.fold(
    0.0,
    (pv, element) => pv + (element.sprite.resource.powerConsumed ?? 0),
  );
}
