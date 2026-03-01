import 'package:flutter/material.dart';

/// Global imperative navigation for Fluent Flutter.
/// No BuildContext required.
class FluentNavigator {
  // Singleton instance
  static final FluentNavigator _instance = FluentNavigator._internal();
  factory FluentNavigator() => _instance;
  FluentNavigator._internal();

  /// The global key used to access the Navigator without Context.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Navigate to a new page.
  /// Usage: FluentNavigator().goTo(MyNextPage());
  Future<T?> goTo<T extends Object?>(Widget page) {
    return navigatorKey.currentState!.push<T>(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  /// Replace the current page with a new one.
  Future<T?> replace<T extends Object?, TO extends Object?>(Widget page) {
    return navigatorKey.currentState!.pushReplacement<T, TO>(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  /// Pop the current page off the stack.
  void pop<T extends Object?>([T? result]) {
    navigatorKey.currentState!.pop<T>(result);
  }

  /// Navigate to a new page and remove all previous routes.
  Future<T?> goToAndRemoveAll<T extends Object?>(Widget page) {
    return navigatorKey.currentState!.pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }
}

/// A global alias for easier access.
final FluentNavigator FNav = FluentNavigator();
