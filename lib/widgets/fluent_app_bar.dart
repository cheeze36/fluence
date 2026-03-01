import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the AppBar widget.
class FluentAppBar extends FluentWidget {
  Widget? _title;
  final List<Widget> _actions = [];
  Color? _backgroundColor;
  double? _elevation;
  bool _centerTitle = false;

  FluentAppBar setTitle(Widget title) {
    _title = title;
    notifyListeners();
    return this;
  }

  FluentAppBar setTitleText(String text) {
    _title = Text(text);
    notifyListeners();
    return this;
  }

  FluentAppBar setActions(List<Widget> actions) {
    _actions.clear();
    _actions.addAll(actions);
    notifyListeners();
    return this;
  }

  FluentAppBar addAction(Widget action) {
    _actions.add(action);
    notifyListeners();
    return this;
  }

  FluentAppBar setBackgroundColor(Color? color) {
    _backgroundColor = color;
    notifyListeners();
    return this;
  }

  FluentAppBar setElevation(double? elevation) {
    _elevation = elevation;
    notifyListeners();
    return this;
  }

  FluentAppBar setCenterTitle(bool center) {
    _centerTitle = center;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return AppBar(
      title: _title,
      actions: List.from(_actions),
      backgroundColor: _backgroundColor,
      elevation: _elevation,
      centerTitle: _centerTitle,
    );
  }

  /// Specialized build for PreferredSizeWidget requirement of Scaffold
  PreferredSizeWidget buildAppBar() {
    return _FluentAppBarWrapper(this);
  }
}

class _FluentAppBarWrapper extends StatelessWidget implements PreferredSizeWidget {
  final FluentAppBar fluent;
  const _FluentAppBarWrapper(this.fluent);

  @override
  Widget build(BuildContext context) {
    return fluent.build();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
