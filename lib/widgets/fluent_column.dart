import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the Column widget.
class FluentColumn extends FluentWidget {
  List<Widget> _children = [];
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;

  FluentColumn({List<Widget>? children}) : _children = children ?? [];

  FluentColumn setChildren(List<Widget> children) {
    _children = children;
    notifyListeners();
    return this;
  }

  FluentColumn addChild(Widget child) {
    _children.add(child);
    notifyListeners();
    return this;
  }

  FluentColumn setMainAxisAlignment(MainAxisAlignment alignment) {
    _mainAxisAlignment = alignment;
    notifyListeners();
    return this;
  }

  FluentColumn setCrossAxisAlignment(CrossAxisAlignment alignment) {
    _crossAxisAlignment = alignment;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: _mainAxisAlignment,
      crossAxisAlignment: _crossAxisAlignment,
      children: _children,
    );
  }
}
