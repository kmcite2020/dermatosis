// part of '../../../logic/logic.dart';

import '../settings_page/advanced_themes_state.dart';

final AdvancedThemesBloc advancedThemesBloc = AdvancedThemesBloc();

class AdvancedThemesBloc {
  // final advancedThemesRM = RM.injectStream(
  //   advancedThemesRepsitory.advancedThemes,
  //   initialState: <AdvancedThemeModel>[],
  // );
  // List<AdvancedThemeModel> get advancedThemes => advancedThemesRM.state;
  void setAdvancedTheme(AdvancedThemeModel advancedThemeModel) async {
    // await advancedThemesRepsitory.setAdvancedTheme(advancedThemeModel);
  }

  void deleteAdvancedTheme(AdvancedThemeModel advancedThemeModel) async {
    // await advancedThemesRepsitory.deleteAdvancedTheme(advancedThemeModel);
  }
}
