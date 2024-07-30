import 'dart:io';

export 'package:flutter/material.dart';
export 'package:path_provider/path_provider.dart';
export 'package:states_rebuilder/states_rebuilder.dart';

import 'main.dart';

export 'package:hive_flutter/hive_flutter.dart';
export 'package:dermatosis/features/dashboard/dashboard_page.dart';

export 'features/settings/settings_page/themes.dart';

part 'features/core/constants.dart';

final directoryRM = RM.injectFuture(getApplicationCacheDirectory);

final patientsBoxRM = RM.injectFuture(
  () async {
    await Hive.initFlutter();
    return Hive.openBox('patients');
  },
);
Box get patientsBox => patientsBoxRM.state;

Directory get directory => directoryRM.state;

void main() => runApp(App());

typedef UI = ReactiveStatelessWidget;

class App extends UI {
  @override
  Widget build(BuildContext context) => throw UnimplementedError();
}
