import 'package:dermatosis/objectbox.g.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'main.dart';

export 'dart:async';
export 'dart:io';

export 'package:dermatosis/dashboard/dashboard_page.dart';
export 'package:dermatosis/settings/settings_page/advanced_themes_state.dart';
export 'package:dermatosis/settings/settings_page/settings.dart';
export 'package:manager/manager.dart';
export 'package:path_provider/path_provider.dart';
export 'package:states_rebuilder/states_rebuilder.dart';

late Store store;

void main() async {
  final appInfo = await PackageInfo.fromPlatform();
  store = await openStore(
    directory:
        (await getApplicationDocumentsDirectory()).path + appInfo.appName,
  );
  await RM.storageInitializer(HiveStorage());
  runApp(App());
}

class App extends UI {
  @override
  void didMountWidget(BuildContext context) => FlutterNativeSplash.remove();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: settingsRM.materialColor(),
        ),
        lightIsWhite: settingsRM.trueThemeMode(),
        subThemesData: FlexSubThemesData(
          defaultRadius: settingsRM.borderRadius(),
          filledButtonRadius: settingsRM.borderRadius(),
        ),
        appBarStyle: FlexAppBarStyle.surface,
      ).copyWith(
        switchTheme: SwitchThemeData(
          trackOutlineColor: WidgetStatePropertyAll(
            settingsRM.materialColor(),
          ),
          thumbColor: WidgetStatePropertyAll(
            settingsRM.materialColor(),
          ),
          thumbIcon: const WidgetStatePropertyAll(
            Icon(Icons.bubble_chart),
          ),
        ),
      ),
      darkTheme: FlexThemeData.dark(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: settingsRM.materialColor(),
          brightness: Brightness.dark,
        ),
        darkIsTrueBlack: settingsRM.trueThemeMode(),
        subThemesData: FlexSubThemesData(
          defaultRadius: settingsRM.borderRadius(),
          filledButtonRadius: settingsRM.borderRadius(),
          appBarCenterTitle: true,
          switchSchemeColor: SchemeColor.background,
        ),
        appBarStyle: FlexAppBarStyle.primary,
      ).copyWith(
        switchTheme: SwitchThemeData(
          trackOutlineColor: WidgetStatePropertyAll(
            settingsRM.materialColor(),
          ),
          thumbColor: WidgetStatePropertyAll(
            settingsRM.materialColor(),
          ),
          thumbIcon: WidgetStatePropertyAll(
            Icon(Icons.bubble_chart),
          ),
        ),
      ),
      themeMode: settingsRM.themeMode(),
      home: DashboardPage(),
    );
  }
}

final to = navigator.to;
final toReplacement = navigator.toReplacement;
final back = navigator.back;
