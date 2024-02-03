import 'package:craftown/src/models/research_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'research_menu_state.freezed.dart';

@freezed
class ResearchMenuState with _$ResearchMenuState {
  const ResearchMenuState._();

  const factory ResearchMenuState({
    @Default(false) bool isOpen,
    ResearchLevel? expandedResearchLevel,
    ResearchLevel? isResearching,
    DateTime? researchStarted,
  }) = _ResearchMenuState;

  DateTime get researchCompletes {
    if (isResearching == null || researchStarted == null) {
      return DateTime.now();
    }

    return researchStarted!.add(isResearching!.timeToUnlock);
  }
}
