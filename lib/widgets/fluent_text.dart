import 'package:flutter/material.dart';
import '../fluent_base.dart';

/// A wrapper for the Text widget.
class FluentText extends FluentWidget {
  String _text = '';
  TextStyle? _style;
  TextAlign? _textAlign;

  FluentText([this._text = '']);

  FluentText setText(String text) {
    _text = text;
    notifyListeners();
    return this;
  }

  FluentText setStyle(TextStyle? style) {
    _style = style;
    notifyListeners();
    return this;
  }

  FluentText setTextAlign(TextAlign? textAlign) {
    _textAlign = textAlign;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Text(_text, style: _style, textAlign: _textAlign);
  }
}
