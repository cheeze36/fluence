import 'package:flutter/material.dart';

/// Base class for imperative-style widgets.
abstract class FluentWidget extends ChangeNotifier {
  /// Builds the actual Flutter widget and listens for changes.
  Widget build() {
    return ListenableBuilder(
      listenable: this,
      builder: (context, _) => buildWidget(context),
    );
  }

  /// Internal method to build the widget using current properties.
  @protected
  Widget buildWidget(BuildContext context);

  /// Helper to wrap this widget in an Expanded widget.
  Widget expanded({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: build(),
    );
  }

  /// Helper to wrap this widget in a Flexible widget.
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) {
    return Flexible(
      flex: flex,
      fit: fit,
      child: build(),
    );
  }

  /// Helper to wrap this widget in a Padding widget.
  Widget padded(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: build(),
    );
  }

  /// Helper to wrap this widget in a Center widget.
  Widget centered() {
    return Center(
      child: build(),
    );
  }

  /// Helper to wrap this widget in a SizedBox.
  Widget sized({double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
      child: build(),
    );
  }
}

/// Extension to "fix" all standard Flutter widgets by adding Fluent layout helpers.
extension FluentWidgetExtensions on Widget {
  Widget padded(EdgeInsetsGeometry padding) => Padding(padding: padding, child: this);
  Widget centered() => Center(child: this);
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);
  Widget sized({double? width, double? height}) =>
      SizedBox(width: width, height: height, child: this);
}
