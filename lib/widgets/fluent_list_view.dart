import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the ListView widget with imperative list management.
class FluentListView extends FluentWidget {
  final List<Widget> _children = [];
  ScrollController? _controller;
  
  List<Widget> get children => List.unmodifiable(_children);
  EdgeInsetsGeometry? _padding;
  bool _reverse = false;
  bool _shrinkWrap = false;
  ScrollPhysics? _physics;

  FluentListView({List<Widget>? children}) {
    if (children != null) {
      _children.addAll(children);
    }
  }

  FluentListView addItem(Widget child) {
    _children.add(child);
    notifyListeners();
    return this;
  }

  FluentListView insertItem(int index, Widget child) {
    _children.insert(index, child);
    notifyListeners();
    return this;
  }

  FluentListView removeItem(Widget child) {
    _children.remove(child);
    notifyListeners();
    return this;
  }

  FluentListView removeItemAt(int index) {
    _children.removeAt(index);
    notifyListeners();
    return this;
  }

  FluentListView clear() {
    _children.clear();
    notifyListeners();
    return this;
  }

  FluentListView setChildren(List<Widget> children) {
    _children.clear();
    _children.addAll(children);
    notifyListeners();
    return this;
  }

  FluentListView setPadding(EdgeInsetsGeometry? padding) {
    _padding = padding;
    notifyListeners();
    return this;
  }

  FluentListView setReverse(bool reverse) {
    _reverse = reverse;
    notifyListeners();
    return this;
  }

  FluentListView setShrinkWrap(bool shrinkWrap) {
    _shrinkWrap = shrinkWrap;
    notifyListeners();
    return this;
  }

  FluentListView setPhysics(ScrollPhysics? physics) {
    _physics = physics;
    notifyListeners();
    return this;
  }

  FluentListView setController(ScrollController? controller) {
    _controller = controller;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return ListView(
      controller: _controller,
      padding: _padding,
      reverse: _reverse,
      shrinkWrap: _shrinkWrap,
      physics: _physics,
      children: List.from(_children), // Create a copy to avoid mutation issues during build
    );
  }
}
