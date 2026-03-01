import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the Switch widget.
class FluentSwitch extends FluentWidget {
  bool _value = false;
  void Function(FluentSwitch self, bool value)? _onChanged;
  Color? _activeColor;
  Color? _activeTrackColor;
  Color? _inactiveThumbColor;
  Color? _inactiveTrackColor;

  FluentSwitch({bool value = false}) : _value = value;

  FluentSwitch setValue(bool value) {
    _value = value;
    notifyListeners();
    return this;
  }

  bool getValue() => _value;

  FluentSwitch setOnChanged(void Function(FluentSwitch self, bool value)? onChanged) {
    _onChanged = onChanged;
    notifyListeners();
    return this;
  }

  FluentSwitch setActiveColor(Color? color) {
    _activeColor = color;
    notifyListeners();
    return this;
  }

  FluentSwitch setActiveTrackColor(Color? color) {
    _activeTrackColor = color;
    notifyListeners();
    return this;
  }

  FluentSwitch setInactiveThumbColor(Color? color) {
    _inactiveThumbColor = color;
    notifyListeners();
    return this;
  }

  FluentSwitch setInactiveTrackColor(Color? color) {
    _inactiveTrackColor = color;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Switch(
      value: _value,
      activeColor: _activeColor,
      activeTrackColor: _activeTrackColor,
      inactiveThumbColor: _inactiveThumbColor,
      inactiveTrackColor: _inactiveTrackColor,
      onChanged: (val) {
        _value = val;
        notifyListeners();
        if (_onChanged != null) _onChanged!(this, _value);
      },
    );
  }
}
