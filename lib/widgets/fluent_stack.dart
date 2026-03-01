import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the Stack widget.
class FluentStack extends FluentWidget {
  final List<Widget> _children = [];
  AlignmentGeometry _alignment = AlignmentDirectional.topStart;
  StackFit _fit = StackFit.loose;
  Clip _clipBehavior = Clip.hardEdge;

  FluentStack({List<Widget>? children}) {
    if (children != null) {
      _children.addAll(children);
    }
  }

  FluentStack setChildren(List<Widget> children) {
    _children.clear();
    _children.addAll(children);
    notifyListeners();
    return this;
  }

  FluentStack addChild(Widget child) {
    _children.add(child);
    notifyListeners();
    return this;
  }

  FluentStack setAlignment(AlignmentGeometry alignment) {
    _alignment = alignment;
    notifyListeners();
    return this;
  }

  FluentStack setFit(StackFit fit) {
    _fit = fit;
    notifyListeners();
    return this;
  }

  FluentStack setClipBehavior(Clip clipBehavior) {
    _clipBehavior = clipBehavior;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Stack(
      alignment: _alignment,
      fit: _fit,
      clipBehavior: _clipBehavior,
      children: List.from(_children),
    );
  }
}
