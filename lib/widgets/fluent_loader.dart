import 'package:flutter/material.dart';
import '../fluent_base.dart';

enum FluentLoaderStatus { loading, success, error }

/// A wrapper that imperatively manages loading/success/error states.
class FluentLoader extends FluentWidget {
  FluentLoaderStatus _status = FluentLoaderStatus.success;
  Widget? _loadingWidget = const CircularProgressIndicator();
  Widget? _content;
  Widget Function(String error)? _errorBuilder;
  String _errorMessage = '';

  FluentLoader({Widget? content}) : _content = content;

  FluentLoader showLoading() {
    _status = FluentLoaderStatus.loading;
    notifyListeners();
    return this;
  }

  FluentLoader showSuccess([Widget? newContent]) {
    _status = FluentLoaderStatus.success;
    if (newContent != null) _content = newContent;
    notifyListeners();
    return this;
  }

  FluentLoader showError(String message) {
    _status = FluentLoaderStatus.error;
    _errorMessage = message;
    notifyListeners();
    return this;
  }

  FluentLoader setLoadingWidget(Widget widget) {
    _loadingWidget = widget;
    notifyListeners();
    return this;
  }

  FluentLoader setContent(Widget widget) {
    _content = widget;
    notifyListeners();
    return this;
  }

  FluentLoader setErrorBuilder(Widget Function(String error) builder) {
    _errorBuilder = builder;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    switch (_status) {
      case FluentLoaderStatus.loading:
        return _loadingWidget ?? const CircularProgressIndicator();
      case FluentLoaderStatus.error:
        return _errorBuilder != null
            ? _errorBuilder!(_errorMessage)
            : Center(child: Text('Error: $_errorMessage', style: const TextStyle(color: Colors.red)));
      case FluentLoaderStatus.success:
        return _content ?? const SizedBox.shrink();
    }
  }
}
