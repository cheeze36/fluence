import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the Row widget.
class FluentRow extends FluentWidget {
  List<Widget> _children = [];
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;

  FluentRow({List<Widget>? children}) : _children = children ?? [];

  FluentRow setChildren(List<Widget> children) {
    _children = children;
    notifyListeners();
    return this;
  }

  FluentRow addChild(Widget child) {
    _children.add(child);
    notifyListeners();
    return this;
  }

  FluentRow setMainAxisAlignment(MainAxisAlignment alignment) {
    _mainAxisAlignment = alignment;
    notifyListeners();
    return this;
  }

  FluentRow setCrossAxisAlignment(CrossAxisAlignment alignment) {
    _crossAxisAlignment = alignment;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: _mainAxisAlignment,
      crossAxisAlignment: _crossAxisAlignment,
      children: _children,
    );
  }
}
