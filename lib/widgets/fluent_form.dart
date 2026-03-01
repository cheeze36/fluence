import 'package:flutter/material.dart';
import '../fluent_base.dart';
import 'fluent_text_field.dart';
import 'fluent_checkbox.dart';
import 'fluent_switch.dart';
import 'fluent_slider.dart';

/// A controller and optional wrapper for managing multiple inputs imperatively.
class FluentForm extends FluentWidget {
  final Map<String, dynamic> _fields = {};
  String? _errorMessage;

  /// Register an input with a key.
  /// Supported types: FluentTextField, FluentCheckbox, FluentSwitch, FluentSlider.
  FluentForm addField(String key, dynamic field) {
    _fields[key] = field;
    return this;
  }

  /// Remove a field from the form.
  FluentForm removeField(String key) {
    _fields.remove(key);
    return this;
  }

  /// Validate all registered fields.
  /// Only validates FluentTextFields currently.
  bool validate() {
    bool isValid = true;
    _fields.forEach((key, field) {
      if (field is FluentTextField) {
        if (!field.validate()) {
          isValid = false;
        }
      }
    });
    
    if (!isValid) {
      _errorMessage = "Please correct the errors below.";
    } else {
      _errorMessage = null;
    }
    notifyListeners();
    return isValid;
  }

  /// Set a global error message for the form.
  FluentForm setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
    return this;
  }

  /// Collect values from all registered fields into a Map.
  Map<String, dynamic> getValues() {
    final values = <String, dynamic>{};
    _fields.forEach((key, field) {
      if (field is FluentTextField) {
        values[key] = field.getText();
      } else if (field is FluentCheckbox) {
        values[key] = field.getValue();
      } else if (field is FluentSwitch) {
        values[key] = field.getValue();
      } else if (field is FluentSlider) {
        values[key] = field.getValue();
      }
    });
    return values;
  }

  /// Clear all registered input fields.
  FluentForm clear() {
    _fields.forEach((key, field) {
      if (field is FluentTextField) {
        field.clear();
      } else if (field is FluentCheckbox) {
        field.setValue(false);
      } else if (field is FluentSwitch) {
        field.setValue(false);
      } else if (field is FluentSlider) {
        field.setValue(0.0);
      }
    });
    _errorMessage = null;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    if (_errorMessage == null) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.red.withOpacity(0.1),
      width: double.infinity,
      child: Text(
        _errorMessage!,
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }
}
