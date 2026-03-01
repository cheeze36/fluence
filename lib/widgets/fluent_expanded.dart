import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the Expanded widget.
/// Note: Due to Flutter's ParentData constraints, changing 'flex' imperatively
/// may not trigger a rebuild of the parent Flex (Column/Row). 
/// Use the .expanded() helper on any FluentWidget for the most reliable behavior.
class FluentExpanded extends FluentWidget {
  int _flex = 1;
  Widget? _child;

  FluentExpanded({int flex = 1, Widget? child})
      : _flex = flex,
        _child = child;

  FluentExpanded setFlex(int flex) {
    _flex = flex;
    notifyListeners();
    return this;
  }

  FluentExpanded setChild(Widget? child) {
    _child = child;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Expanded(
      flex: _flex,
      child: _child ?? const SizedBox.shrink(),
    );
  }

  /// Override build to return Expanded directly to satisfy ParentData constraints.
  /// This means only the CHILD will rebuild automatically when its properties change,
  /// but changing 'flex' here might require a parent rebuild.
  @override
  Widget build() {
    return Expanded(
      flex: _flex,
      child: ListenableBuilder(
        listenable: this,
        builder: (context, _) => _child ?? const SizedBox.shrink(),
      ),
    );
  }
}
