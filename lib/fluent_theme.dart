import 'package:flutter/material.dart';

/// Global imperative theme management for Fluent Flutter.
class FluentTheme extends ChangeNotifier {
  // Singleton instance
  static final FluentTheme _instance = FluentTheme._internal();
  factory FluentTheme() => _instance;
  FluentTheme._internal();

  Color _primaryColor = Colors.blue;
  Color _accentColor = Colors.orange;
  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;
  
  double _defaultFontSize = 14.0;
  String? _fontFamily;

  // Getters
  Color get primaryColor => _primaryColor;
  Color get accentColor => _accentColor;
  Color get backgroundColor => _backgroundColor;
  Color get textColor => _textColor;
  double get defaultFontSize => _defaultFontSize;
  String? get fontFamily => _fontFamily;

  // Setters
  FluentTheme setPrimaryColor(Color color) {
    _primaryColor = color;
    notifyListeners();
    return this;
  }

  FluentTheme setAccentColor(Color color) {
    _accentColor = color;
    notifyListeners();
    return this;
  }

  FluentTheme setBackgroundColor(Color color) {
    _backgroundColor = color;
    notifyListeners();
    return this;
  }

  FluentTheme setTextColor(Color color) {
    _textColor = color;
    notifyListeners();
    return this;
  }

  FluentTheme setDefaultFontSize(double size) {
    _defaultFontSize = size;
    notifyListeners();
    return this;
  }

  FluentTheme setFontFamily(String? family) {
    _fontFamily = family;
    notifyListeners();
    return this;
  }

  /// Returns a standard ThemeData object based on current Fluent settings.
  ThemeData toThemeData() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        secondary: _accentColor,
        surface: _backgroundColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: _textColor,
          fontSize: _defaultFontSize,
          fontFamily: _fontFamily,
        ),
      ),
    );
  }
}

/// Helper class for common constants and shortcuts.
class F {
  // Spacing
  static EdgeInsets all(double value) => EdgeInsets.all(value);
  static EdgeInsets symmetric({double h = 0, double v = 0}) => 
      EdgeInsets.symmetric(horizontal: h, vertical: v);
  static EdgeInsets only({double l = 0, double r = 0, double t = 0, double b = 0}) => 
      EdgeInsets.only(left: l, right: r, top: t, bottom: b);

  static const EdgeInsets p4 = EdgeInsets.all(4);
  static const EdgeInsets p8 = EdgeInsets.all(8);
  static const EdgeInsets p12 = EdgeInsets.all(12);
  static const EdgeInsets p16 = EdgeInsets.all(16);
  static const EdgeInsets p24 = EdgeInsets.all(24);

  // Text Styles
  static TextStyle style({
    Color? color,
    double? size,
    FontWeight? weight,
    FontStyle? fontStyle,
  }) => TextStyle(
    color: color,
    fontSize: size,
    fontWeight: weight,
    fontStyle: fontStyle,
  );

  static TextStyle get h1 => const TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  static TextStyle get h2 => const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle get h3 => const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle get body => const TextStyle(fontSize: 14);
  static TextStyle get caption => const TextStyle(fontSize: 12, color: Colors.grey);
}
