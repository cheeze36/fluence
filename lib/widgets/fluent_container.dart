import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the Container widget.
class FluentContainer extends FluentWidget {
  Widget? _child;
  double? _width;
  double? _height;
  Color? _color;
  EdgeInsetsGeometry? _padding;
  AlignmentGeometry? _alignment;

  FluentContainer setChild(Widget? child) {
    _child = child;
    notifyListeners();
    return this;
  }

  FluentContainer setWidth(double? width) {
    _width = width;
    notifyListeners();
    return this;
  }

  FluentContainer setHeight(double? height) {
    _height = height;
    notifyListeners();
    return this;
  }

  FluentContainer setColor(Color? color) {
    _color = color;
    notifyListeners();
    return this;
  }

  FluentContainer setPadding(EdgeInsetsGeometry? padding) {
    _padding = padding;
    notifyListeners();
    return this;
  }

  FluentContainer setAlignment(AlignmentGeometry? alignment) {
    _alignment = alignment;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      color: _color,
      padding: _padding,
      alignment: _alignment,
      child: _child,
    );
  }
}
