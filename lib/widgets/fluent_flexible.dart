import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the Flexible widget.
class FluentFlexible extends FluentWidget {
  int _flex = 1;
  FlexFit _fit = FlexFit.loose;
  Widget? _child;

  FluentFlexible({int flex = 1, FlexFit fit = FlexFit.loose, Widget? child})
      : _flex = flex,
        _fit = fit,
        _child = child;

  FluentFlexible setFlex(int flex) {
    _flex = flex;
    notifyListeners();
    return this;
  }

  FluentFlexible setFit(FlexFit fit) {
    _fit = fit;
    notifyListeners();
    return this;
  }

  FluentFlexible setChild(Widget? child) {
    _child = child;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
     return Flexible(
      flex: _flex,
      fit: _fit,
      child: _child ?? const SizedBox.shrink(),
    );
  }

  @override
  Widget build() {
    return Flexible(
      flex: _flex,
      fit: _fit,
      child: ListenableBuilder(
        listenable: this,
        builder: (context, _) => _child ?? const SizedBox.shrink(),
      ),
    );
  }
}
