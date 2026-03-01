import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper that provides imperative, chainable animations for any widget.
class FluentAnimate extends FluentWidget {
  final Widget _child;
  
  double _opacity = 1.0;
  double _scale = 1.0;
  double _rotation = 0.0;
  Offset _offset = Offset.zero;
  
  Duration _duration = const Duration(milliseconds: 300);
  Curve _curve = Curves.easeInOut;

  FluentAnimate({required Widget child}) : _child = child;

  FluentAnimate setDuration(Duration duration) {
    _duration = duration;
    return this;
  }

  FluentAnimate setCurve(Curve curve) {
    _curve = curve;
    return this;
  }

  FluentAnimate fadeOut() {
    _opacity = 0.0;
    notifyListeners();
    return this;
  }

  FluentAnimate fadeIn() {
    _opacity = 1.0;
    notifyListeners();
    return this;
  }

  FluentAnimate scaleTo(double scale) {
    _scale = scale;
    notifyListeners();
    return this;
  }

  FluentAnimate rotateTo(double turns) {
    _rotation = turns;
    notifyListeners();
    return this;
  }

  FluentAnimate moveTo(Offset offset) {
    _offset = offset;
    notifyListeners();
    return this;
  }

  FluentAnimate reset() {
    _opacity = 1.0;
    _scale = 1.0;
    _rotation = 0.0;
    _offset = Offset.zero;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: _duration,
      curve: _curve,
      child: AnimatedScale(
        scale: _scale,
        duration: _duration,
        curve: _curve,
        child: AnimatedRotation(
          turns: _rotation,
          duration: _duration,
          curve: _curve,
          child: AnimatedSlide(
            offset: _offset,
            duration: _duration,
            curve: _curve,
            child: _child,
          ),
        ),
      ),
    );
  }
}

/// Extension to add .animate() to any Widget or FluentWidget.
extension FluentAnimateExtension on Widget {
  FluentAnimate animate() => FluentAnimate(child: this);
}

extension FluentWidgetAnimateExtension on FluentWidget {
  FluentAnimate animate() => FluentAnimate(child: build());
}
