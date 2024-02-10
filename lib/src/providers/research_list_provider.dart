import 'package:craftown/src/models/research_level.dart';
import 'package:craftown/src/tutorial/tutorial_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'research_list_provider.g.dart';

@Riverpod(keepAlive: true)
class ResearchList extends _$ResearchList {
  @override
  List<ResearchLevel> build() {
    return [];
  }

  void set(List<ResearchLevel> researchLevels) {
    state = researchLevels;
  }

  void completeResearch(ResearchLevel researchLevel) {
    state = [...state, researchLevel];

    ref.read(tutorialProvider.notifier).checkProgress();
  }
}
