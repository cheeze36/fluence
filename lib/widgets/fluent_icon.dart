import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the Icon widget.
class FluentIcon extends FluentWidget {
  IconData _icon;
  double? _size;
  Color? _color;
  String? _semanticLabel;
  TextDirection? _textDirection;

  FluentIcon(this._icon, {double? size, Color? color})
      : _size = size,
        _color = color;

  FluentIcon setIcon(IconData icon) {
    _icon = icon;
    notifyListeners();
    return this;
  }

  FluentIcon setSize(double? size) {
    _size = size;
    notifyListeners();
    return this;
  }

  FluentIcon setColor(Color? color) {
    _color = color;
    notifyListeners();
    return this;
  }

  FluentIcon setSemanticLabel(String? label) {
    _semanticLabel = label;
    notifyListeners();
    return this;
  }

  FluentIcon setTextDirection(TextDirection? direction) {
    _textDirection = direction;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Icon(
      _icon,
      size: _size,
      color: _color,
      semanticLabel: _semanticLabel,
      textDirection: _textDirection,
    );
  }
}
