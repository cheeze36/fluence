/// Global Infrastructure for Fluent Flutter.
class Fluent {
  static final Map<Type, dynamic> _registry = {};

  /// Register a service or widget instance for global access.
  /// Usage: Fluent.register<UserService>(UserService());
  static void register<T>(T instance) {
    _registry[T] = instance;
  }

  /// Retrieve a registered service or widget instance.
  /// Usage: final service = Fluent.get<UserService>();
  static T get<T>() {
    if (!_registry.containsKey(T)) {
      throw Exception('Fluent: Service of type $T not found in registry. Did you forget to register it?');
    }
    return _registry[T] as T;
  }

  /// Remove a service from the registry.
  static void unregister<T>() {
    _registry.remove(T);
  }

  /// Clear the entire registry.
  static void clear() {
    _registry.clear();
  }
}
