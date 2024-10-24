import '../../main.dart';

final SettingsRM settingsRM = SettingsRM();

class SettingsRM {
  late final settingsRM = RM.inject(
    () => Settings(),
    persist: () => persisted('settings', Settings.fromMap),
  );

  Settings settings([Settings? _settings]) {
    if (_settings != null)
      settingsRM
        ..state = _settings
        ..notify();
    return settingsRM.state;
  }

  ThemeMode themeMode([ThemeMode? _themeMode]) {
    if (_themeMode != null)
      settings(
        settings()..themeModeIndex = ThemeMode.values.indexOf(_themeMode),
      );
    return ThemeMode.values[settings().themeModeIndex];
  }

  bool trueThemeMode([bool? _trueThemeMode]) {
    if (_trueThemeMode != null)
      settings(
        settings()..trueThemeMode = _trueThemeMode,
      );
    return settings().trueThemeMode;
  }

  bool isColorsVisible([bool? _isColorsVisible]) {
    if (_isColorsVisible != null)
      settings(
        settings()..isColorsVisible = _isColorsVisible,
      );
    return settings().isColorsVisible;
  }

  bool isSearching([bool? _isSearching]) {
    if (_isSearching != null)
      settings(
        settings()..isSearching = _isSearching,
      );
    return settings().isSearching;
  }

  double padding([double? _padding]) {
    if (_padding != null)
      settings(
        settings()..padding = _padding,
      );
    return settings().padding;
  }

  double height([double? _height]) {
    if (_height != null)
      settings(
        settings()..height = _height,
      );
    return settings().height;
  }

  double borderRadius([double? _borderRadius]) {
    if (_borderRadius != null)
      settings(
        settings()..borderRadius = _borderRadius,
      );
    return settings().borderRadius;
  }

  double textScaleFactor([double? _textScaleFactor]) {
    if (_textScaleFactor != null)
      settings(
        settings()..textScaleFactor = _textScaleFactor,
      );
    return settings().textScaleFactor;
  }

  double elevation([double? _elevation]) {
    if (_elevation != null)
      settings(
        settings()..elevation = _elevation,
      );
    return settings().elevation;
  }

  String? get font => settings().font;
  void set font(font) => settings(settings()..font = font);

  bool isAdvancedThemeMode([bool? _isAdvancedThemingMode]) {
    if (_isAdvancedThemingMode != null)
      settings(
        settings()..isAdvancedThemingMode = _isAdvancedThemingMode,
      );
    return settings().isAdvancedThemingMode;
  }

  MaterialColor materialColor([MaterialColor? _materialColor]) {
    if (_materialColor != null)
      settings(
        settings()..colorIndex = Colors.primaries.indexOf(_materialColor),
      );
    return Colors.primaries[settings().colorIndex];
  }
}

@Entity()
class Settings {
  @Id()
  int id = 0;
  int colorIndex = 0;
  bool trueThemeMode = true;
  int themeModeIndex = 0;
  bool isColorsVisible = true;
  bool isSearching = false;
  double padding = 8;
  double height = 80;
  double borderRadius = 8;
  double textScaleFactor = 1;
  double elevation = 10;
  String font = '';
  bool isAdvancedThemingMode = false;
  Settings({
    this.id = 0,
    this.colorIndex = 0,
    this.trueThemeMode = false,
    this.themeModeIndex = 0,
    this.isColorsVisible = false,
    this.isSearching = false,
    this.padding = 8,
    this.height = 80,
    this.borderRadius = 8,
    this.textScaleFactor = 1,
    this.elevation = 10,
    this.font = '',
    this.isAdvancedThemingMode = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'colorIndex': colorIndex,
      'trueThemeMode': trueThemeMode,
      'themeModeIndex': themeModeIndex,
      'isColorsVisible': isColorsVisible,
      'isSearching': isSearching,
      'padding': padding,
      'height': height,
      'borderRadius': borderRadius,
      'textScaleFactor': textScaleFactor,
      'elevation': elevation,
      'font': font,
      'isAdvancedThemingMode': isAdvancedThemingMode,
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      id: map['id'] as int,
      colorIndex: map['colorIndex'] as int,
      trueThemeMode: map['trueThemeMode'] as bool,
      themeModeIndex: map['themeModeIndex'] as int,
      isColorsVisible: map['isColorsVisible'] as bool,
      isSearching: map['isSearching'] as bool,
      padding: map['padding'] as double,
      height: map['height'] as double,
      borderRadius: map['borderRadius'] as double,
      textScaleFactor: map['textScaleFactor'] as double,
      elevation: map['elevation'] as double,
      font: map['font'] as String,
      isAdvancedThemingMode: map['isAdvancedThemingMode'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Settings.fromJson(String source) =>
      Settings.fromMap(json.decode(source) as Map<String, dynamic>);
}
