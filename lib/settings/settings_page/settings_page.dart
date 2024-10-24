import '../../main.dart';
import 'advanced_theming_page.dart';

class SettingsPage extends UI {
  const SettingsPage({super.key});
  static const name = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(SettingsPage.name),
        // leading: LeadingBackButton(),
      ),
      body: ListView(
        children: [
          DropdownButtonFormField(
            value: settingsRM.themeMode(),
            items: ThemeMode.values
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name.toUpperCase()),
                  ),
                )
                .toList(),
            onChanged: settingsRM.themeMode,
          ).pad(),
          SwitchListTile(
            title: const Text('TRUE COLORS MODE'),
            subtitle: const Text('toggle true balck or white'),
            value: settingsRM.trueThemeMode(),
            onChanged: settingsRM.trueThemeMode,
          ),
          SwitchListTile(
            title: const Text('ADVANCED THEMING'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('enable advanced theming').pad(),
                ElevatedButton(
                  onPressed: () {
                    to(AdvancedThemingPage());
                  },
                  child: const Text('Go to Advanced Theming'),
                ),
              ],
            ),
            value: settingsRM.isAdvancedThemeMode(),
            onChanged: settingsRM.isAdvancedThemeMode,
          ),
          GridView.count(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: Colors.primaries.take(settingsRM.isColorsVisible() ? 18 : 2).map<Widget>(
              (e) {
                return ElevatedButton(
                  onPressed: switch (e == settingsRM.materialColor()) {
                    false => () => settingsRM.materialColor(e),
                    true => null,
                  },
                  child: null,
                  style: ElevatedButton.styleFrom(backgroundColor: e),
                ).pad();
              },
            ).toList()
              ..insert(
                0,
                Switch(
                  value: settingsRM.isColorsVisible(),
                  onChanged: settingsRM.isColorsVisible,
                ),
              )
              ..add(
                const ColorIndexWidget(),
              ),
          ),
          Slider(
            label: 'ELEVATION',
            value: settingsRM.elevation(),
            onChanged: settingsRM.elevation,
            min: 0,
            max: 20,
          ),
          Slider(
            label: 'HEIGHT',
            value: settingsRM.height(),
            onChanged: settingsRM.height,
            min: 0,
            max: 120,
          ),
          Slider(
            label: 'PADDING',
            value: settingsRM.padding(),
            onChanged: settingsRM.padding,
            min: 0,
            max: 30,
          ),
          Slider(
            label: 'BORDER RADIUS',
            value: settingsRM.borderRadius(),
            onChanged: settingsRM.borderRadius,
            min: 0,
            max: 30,
          ),
          Slider(
            label: 'TEXT SCALE FACTOR',
            value: settingsRM.textScaleFactor(),
            onChanged: settingsRM.textScaleFactor,
            min: .5,
            max: 3,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('BACKUP ALL DATA LOCALLY'),
          ).pad(),
          ElevatedButton(
            onPressed: () {},
            child: const Text('RESTORE DATA FROM BACKUP'),
          ).pad(),
          ElevatedButton(
            onPressed: () {},
            child: const Text('GOTO ARCHIVES'),
          ).pad(),
          ElevatedButton(
            onPressed: () {},
            child: const Text('CLEAR ALL ARCHIVES'),
          ).pad(),
          ElevatedButton(
            onPressed: () {
              // router.to(InformationsPage.name);
            },
            child: const Text('DEVICE INFORMATIONS'),
          ).pad(),
        ],
      ),
    );
  }
}

class ColorIndexWidget extends UI {
  const ColorIndexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: (Colors.primaries.indexOf(settingsRM.materialColor()) + 1).text(),
    ).pad();
  }
}
