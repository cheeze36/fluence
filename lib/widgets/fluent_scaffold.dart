import 'package:flutter/material.dart';
import '../fluent_base.dart';
import 'fluent_app_bar.dart';

/// A wrapper for the Scaffold widget.
class FluentScaffold extends FluentWidget {
  FluentAppBar? _appBar;
  Widget? _body;
  Widget? _floatingActionButton;
  Color? _backgroundColor;
  Widget? _drawer;

  FluentScaffold setAppBar(FluentAppBar? appBar) {
    _appBar = appBar;
    notifyListeners();
    return this;
  }

  FluentScaffold setBody(Widget? body) {
    _body = body;
    notifyListeners();
    return this;
  }

  FluentScaffold setFloatingActionButton(Widget? fab) {
    _floatingActionButton = fab;
    notifyListeners();
    return this;
  }

  FluentScaffold setBackgroundColor(Color? color) {
    _backgroundColor = color;
    notifyListeners();
    return this;
  }

  FluentScaffold setDrawer(Widget? drawer) {
    _drawer = drawer;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: _appBar?.buildAppBar(),
      body: _body,
      floatingActionButton: _floatingActionButton,
      backgroundColor: _backgroundColor,
      drawer: _drawer,
    );
  }
}
