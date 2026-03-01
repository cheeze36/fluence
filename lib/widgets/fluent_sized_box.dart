import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the SizedBox widget.
class FluentSizedBox extends FluentWidget {
  double? _width;
  double? _height;
  Widget? _child;

  FluentSizedBox({double? width, double? height, Widget? child})
      : _width = width,
        _height = height,
        _child = child;

  FluentSizedBox setWidth(double? width) {
    _width = width;
    notifyListeners();
    return this;
  }

  FluentSizedBox setHeight(double? height) {
    _height = height;
    notifyListeners();
    return this;
  }

  FluentSizedBox setChild(Widget? child) {
    _child = child;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height,
      child: _child,
    );
  }
}
