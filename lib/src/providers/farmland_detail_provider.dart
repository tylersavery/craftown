import 'package:collection/collection.dart';
import 'package:craftown/src/components/farmland_sprite.dart';
import 'package:craftown/src/models/farmland.dart';
import 'package:craftown/src/models/resource.dart';
import 'package:craftown/src/providers/farmland_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'farmland_detail_provider.g.dart';

@Riverpod(keepAlive: true)
class FarmlandDetail extends _$FarmlandDetail {
  @override
  Farmland? build(String arg) {
    return ref.read(farmlandListProvider).firstWhereOrNull((element) => element.identifier == arg);
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

  void setWateringCount(int amount) {
    if (state == null) {
      return;
    }
    state = state!.copyWith(wateringCount: amount);
  }
}
