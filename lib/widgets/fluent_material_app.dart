import 'package:flutter/material.dart';
import '../fluent_base.dart';
import '../fluent_theme.dart';
import '../fluent_navigator.dart';

/// A wrapper for the MaterialApp widget.
/// Automatically listens to the global FluentTheme().
class FluentMaterialApp extends FluentWidget {
  String _title = '';
  Widget? _home;
  ThemeData? _theme;
  bool _showDebugBanner = false;

  FluentMaterialApp setTitle(String title) {
    _title = title;
    notifyListeners();
    return this;
  }

  FluentMaterialApp setHome(Widget? home) {
    _home = home;
    notifyListeners();
    return this;
  }

  FluentMaterialApp setTheme(ThemeData? theme) {
    _theme = theme;
    notifyListeners();
    return this;
  }

  FluentMaterialApp setShowDebugBanner(bool show) {
    _showDebugBanner = show;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    // We use another ListenableBuilder inside to listen to global theme changes.
    return ListenableBuilder(
      listenable: FluentTheme(),
      builder: (context, _) {
        return MaterialApp(
          navigatorKey: FluentNavigator().navigatorKey,
          title: _title,
          theme: _theme ?? FluentTheme().toThemeData(),
          home: _home,
          debugShowCheckedModeBanner: _showDebugBanner,
        );
      },
    );
  }
}
