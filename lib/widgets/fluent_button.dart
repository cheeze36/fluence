import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the ElevatedButton widget.
class FluentButton extends FluentWidget {
  Widget? _child;
  void Function(FluentButton self)? _onPressed;
  ButtonStyle? _style;

  FluentButton({Widget? child, void Function(FluentButton self)? onPressed})
      : _child = child,
        _onPressed = onPressed;

  FluentButton setChild(Widget? child) {
    _child = child;
    notifyListeners();
    return this;
  }

  FluentButton setLabel(String text) {
    _child = Text(text);
    notifyListeners();
    return this;
  }

  FluentButton setOnPressed(void Function(FluentButton self)? onPressed) {
    _onPressed = onPressed;
    notifyListeners();
    return this;
  }

  FluentButton setStyle(ButtonStyle? style) {
    _style = style;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed == null ? null : () => _onPressed!(this),
      style: _style,
      child: _child ?? const SizedBox.shrink(),
    );
  }
}
