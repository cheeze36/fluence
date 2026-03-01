import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the Checkbox widget.
class FluentCheckbox extends FluentWidget {
  bool _value = false;
  void Function(FluentCheckbox self, bool value)? _onChanged;
  Color? _activeColor;
  Color? _checkColor;

  FluentCheckbox({bool value = false}) : _value = value;

  FluentCheckbox setValue(bool value) {
    _value = value;
    notifyListeners();
    return this;
  }

  bool getValue() => _value;

  FluentCheckbox setOnChanged(void Function(FluentCheckbox self, bool value)? onChanged) {
    _onChanged = onChanged;
    notifyListeners();
    return this;
  }

  FluentCheckbox setActiveColor(Color? color) {
    _activeColor = color;
    notifyListeners();
    return this;
  }

  FluentCheckbox setCheckColor(Color? color) {
    _checkColor = color;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Checkbox(
      value: _value,
      activeColor: _activeColor,
      checkColor: _checkColor,
      onChanged: (val) {
        _value = val ?? false;
        notifyListeners();
        if (_onChanged != null) _onChanged!(this, _value);
      },
    );
  }
}
