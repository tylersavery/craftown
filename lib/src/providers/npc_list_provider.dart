import 'package:craftown/src/models/character.dart';
import 'package:craftown/src/models/npc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'npc_list_provider.g.dart';

@riverpod
class NpcList extends _$NpcList {
  @override
  List<Npc> build() {
    // Start with one test NPC
    return [
      Npc(
        id: 'npc_001',
        name: 'Alex the Helper',
        character: Character(
          skin: CharacterSkin.maleWhiteBlondHair,
          name: 'Alex',
        ),
        tier: NpcTier.apprentice,
        tileX: 16.0,
        tileY: 12.0,
      ),
    ];
  }

  void addNpc(Npc npc) {
    state = [...state, npc];
  }

  void removeNpc(String id) {
    state = state.where((npc) => npc.id != id).toList();
  }

  void updateNpc(Npc updatedNpc) {
    state = state.map((npc) {
      return npc.id == updatedNpc.id ? updatedNpc : npc;
    }).toList();
  }

  Npc? getNpc(String id) {
    try {
      return state.firstWhere((npc) => npc.id == id);
    } catch (e) {
      return null;
    }
  }
}
