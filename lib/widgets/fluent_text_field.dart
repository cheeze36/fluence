import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the TextField widget.
class FluentTextField extends FluentWidget {
  final TextEditingController _controller = TextEditingController();
  String? _hintText;
  String? _labelText;
  String? _errorText;
  bool _obscureText = false;
  TextInputType? _keyboardType;
  void Function(FluentTextField self, String value)? _onChanged;
  void Function(FluentTextField self, String value)? _onSubmitted;
  String? Function(String value)? _validator;

  FluentTextField({String initialText = ''}) {
    _controller.text = initialText;
  }
  
  String? get errorText => _errorText;

  FluentTextField setError(String? error) {
    _errorText = error;
    notifyListeners();
    return this;
  }

  FluentTextField setValidator(String? Function(String value)? validator) {
    _validator = validator;
    return this;
  }

  bool validate() {
    if (_validator != null) {
      final error = _validator!(_controller.text);
      setError(error);
      return error == null;
    }
    return true;
  }

  FluentTextField setText(String text) {
    _controller.text = text;
    // We don't necessarily need notifyListeners() here because TextField
    // listens to the controller, but if other things depend on this widget's
    // state, it's safer to include it.
    notifyListeners();
    return this;
  }

  String getText() => _controller.text;

  FluentTextField clear() {
    _controller.clear();
    notifyListeners();
    return this;
  }

  FluentTextField setHintText(String? hintText) {
    _hintText = hintText;
    notifyListeners();
    return this;
  }

  FluentTextField setLabelText(String? labelText) {
    _labelText = labelText;
    notifyListeners();
    return this;
  }

  FluentTextField setObscureText(bool obscure) {
    _obscureText = obscure;
    notifyListeners();
    return this;
  }

  FluentTextField setKeyboardType(TextInputType type) {
    _keyboardType = type;
    notifyListeners();
    return this;
  }

  FluentTextField setOnChanged(void Function(FluentTextField self, String value)? onChanged) {
    _onChanged = onChanged;
    notifyListeners();
    return this;
  }

  FluentTextField setOnSubmitted(void Function(FluentTextField self, String value)? onSubmitted) {
    _onSubmitted = onSubmitted;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText: _obscureText,
      keyboardType: _keyboardType,
      onChanged: (value) {
        if (_onChanged != null) _onChanged!(this, value);
      },
      onSubmitted: (value) {
        if (_onSubmitted != null) _onSubmitted!(this, value);
      },
      decoration: InputDecoration(
        hintText: _hintText,
        labelText: _labelText,
        errorText: _errorText,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
