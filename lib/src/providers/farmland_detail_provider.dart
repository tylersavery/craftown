import 'package:collection/collection.dart';
import 'package:craftown/src/components/farmland_sprite.dart';
import 'package:craftown/src/models/farmland.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/farmland_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FarmlandDetailProvider extends StateNotifier<Farmland?> {
  final Ref ref;
  final String identifier;
  FarmlandDetailProvider(this.ref, this.identifier) : super(null) {
    state = ref.read(farmlandProvider).firstWhereOrNull((element) => element.identifier == identifier);
  }

  void setState(FarmlandState s) {
    if (state == null) {
      print("Farm state IS NULL");
      return;
    }
    state = state!.copyWith(state: s);
  }

  void setSeed(Resource? resource) {
    if (state == null) {
      return;
    }
    state = state!.copyWith(seed: resource);
  }

  void setCompleteAt(DateTime? dateTime) {
    if (state == null) {
      return;
    }
    state = state!.copyWith(completeAt: dateTime);
  }
}

final farmlandDetailProvider = StateNotifierProvider.family<FarmlandDetailProvider, Farmland?, String>((ref, identifier) {
  return FarmlandDetailProvider(ref, identifier);
});
