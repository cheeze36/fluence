import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the GestureDetector widget.
class FluentGestureDetector extends FluentWidget {
  Widget? _child;
  void Function(FluentGestureDetector self)? _onTap;
  void Function(FluentGestureDetector self)? _onDoubleTap;
  void Function(FluentGestureDetector self)? _onLongPress;
  HitTestBehavior? _behavior;

  FluentGestureDetector({Widget? child}) : _child = child;

  FluentGestureDetector setChild(Widget? child) {
    _child = child;
    notifyListeners();
    return this;
  }

  FluentGestureDetector setOnTap(void Function(FluentGestureDetector self)? onTap) {
    _onTap = onTap;
    notifyListeners();
    return this;
  }

  FluentGestureDetector setOnDoubleTap(void Function(FluentGestureDetector self)? onDoubleTap) {
    _onDoubleTap = onDoubleTap;
    notifyListeners();
    return this;
  }

  FluentGestureDetector setOnLongPress(void Function(FluentGestureDetector self)? onLongPress) {
    _onLongPress = onLongPress;
    notifyListeners();
    return this;
  }

  FluentGestureDetector setBehavior(HitTestBehavior? behavior) {
    _behavior = behavior;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return GestureDetector(
      behavior: _behavior,
      onTap: _onTap == null ? null : () => _onTap!(this),
      onDoubleTap: _onDoubleTap == null ? null : () => _onDoubleTap!(this),
      onLongPress: _onLongPress == null ? null : () => _onLongPress!(this),
      child: _child,
    );
  }
}
