import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the Slider widget.
class FluentSlider extends FluentWidget {
  double _value = 0.0;
  double _min = 0.0;
  double _max = 1.0;
  int? _divisions;
  String? _label;
  void Function(FluentSlider self, double value)? _onChanged;
  void Function(FluentSlider self, double value)? _onChangeStart;
  void Function(FluentSlider self, double value)? _onChangeEnd;
  Color? _activeColor;
  Color? _inactiveColor;

  FluentSlider({double value = 0.0, double min = 0.0, double max = 1.0})
      : _value = value,
        _min = min,
        _max = max;

  FluentSlider setValue(double value) {
    _value = value;
    notifyListeners();
    return this;
  }

  double getValue() => _value;

  FluentSlider setMin(double min) {
    _min = min;
    notifyListeners();
    return this;
  }

  FluentSlider setMax(double max) {
    _max = max;
    notifyListeners();
    return this;
  }

  FluentSlider setDivisions(int? divisions) {
    _divisions = divisions;
    notifyListeners();
    return this;
  }

  FluentSlider setLabel(String? label) {
    _label = label;
    notifyListeners();
    return this;
  }

  FluentSlider setOnChanged(void Function(FluentSlider self, double value)? onChanged) {
    _onChanged = onChanged;
    notifyListeners();
    return this;
  }

  FluentSlider setOnChangeStart(void Function(FluentSlider self, double value)? onChangeStart) {
    _onChangeStart = onChangeStart;
    notifyListeners();
    return this;
  }

  FluentSlider setOnChangeEnd(void Function(FluentSlider self, double value)? onChangeEnd) {
    _onChangeEnd = onChangeEnd;
    notifyListeners();
    return this;
  }

  FluentSlider setActiveColor(Color? color) {
    _activeColor = color;
    notifyListeners();
    return this;
  }

  FluentSlider setInactiveColor(Color? color) {
    _inactiveColor = color;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Slider(
      value: _value,
      min: _min,
      max: _max,
      divisions: _divisions,
      label: _label,
      activeColor: _activeColor,
      inactiveColor: _inactiveColor,
      onChanged: (val) {
        _value = val;
        notifyListeners();
        if (_onChanged != null) _onChanged!(this, _value);
      },
      onChangeStart: (val) {
        if (_onChangeStart != null) _onChangeStart!(this, val);
      },
      onChangeEnd: (val) {
        if (_onChangeEnd != null) _onChangeEnd!(this, val);
      },
    );
  }
}
