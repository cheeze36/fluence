import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the Center widget.
class FluentCenter extends FluentWidget {
  Widget? _child;

  FluentCenter setChild(Widget? child) {
    _child = child;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Center(
      child: _child,
    );
  }
}
