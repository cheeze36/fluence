import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the Padding widget.
class FluentPadding extends FluentWidget {
  Widget? _child;
  EdgeInsetsGeometry _padding = EdgeInsets.zero;

  FluentPadding setChild(Widget? child) {
    _child = child;
    notifyListeners();
    return this;
  }

  FluentPadding setPadding(EdgeInsetsGeometry padding) {
    _padding = padding;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Padding(
      padding: _padding,
      child: _child,
    );
  }
}
