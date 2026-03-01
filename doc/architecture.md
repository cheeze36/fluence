# Fluent Flutter Architecture

Fluent Flutter is an imperative, setter-based wrapper layer for the Flutter framework. Its goal is to provide a more traditional "widget-as-an-object" API that allows for direct property manipulation without manual state management or nested build methods.

## Core Concepts

### 1. The FluentWidget
All Fluent widgets inherit from `FluentWidget`, which extends `ChangeNotifier`. 
- **Internal State**: Each widget manages its own properties (text, style, children, etc.).
- **Automatic Rebuilds**: Uses `ListenableBuilder` internally. Calling a setter triggers `notifyListeners()`, causing only that specific widget to rebuild.
- **The `.build()` Method**: Returns a standard Flutter Widget that can be inserted anywhere in a traditional Flutter tree.

### 2. Imperative API
Instead of rebuilding widget trees, developers interact with long-lived widget instances:
```dart
final FluentText myLabel = FluentText("Hello");

void updateUI() {
  myLabel.setText("Updated via setter!"); // UI updates automatically
}
```

### 3. Layout Modifiers (Chainable Helpers)
FluentWidgets (and all standard Widgets via extensions) include convenience methods to reduce nesting:
- `.padded(EdgeInsets)`: Wraps the widget in Padding.
- `.centered()`: Wraps the widget in a Center.
- `.sized({width, height})`: Wraps the widget in a SizedBox.
- `.expanded({flex})`: Wraps the widget in an Expanded.

```dart
myButton.padded(F.p16).centered(); // Flat, readable layout
```

### 4. Application Shell
By using `FluentMaterialApp`, `FluentScaffold`, and `FluentAppBar`, you can define your entire app structure as static objects, eliminating the need for boilerplate `StatelessWidget` and `StatefulWidget` classes.

### 5. Global Navigation (FluentNavigator / FNav)
Fluent provides a global navigation system that does not require `BuildContext`. By accessing the `FNav` singleton, you can push and pop screens from anywhere in your logic.
```dart
FNav.goTo(DetailsPage());
FNav.pop();
```

### 6. Data & Networking (FluentData / FData)
An imperative HTTP client that allows for data fetching without `FutureBuilder`.
```dart
void fetchData() async {
  final data = await FData.get("/api/items");
  myList.setChildren(data.map((i) => Text(i['name'])).toList());
}
```

### 7. Imperative Animations (FluentAnimate)
Chainable animations that can be applied to any widget using the `.animate()` extension.
```dart
myIcon.animate()
  .rotateTo(0.25)
  .scaleTo(1.5)
  .fadeIn();
```

### 8. Dependency Injection (Fluent Core)
To manage large applications, Fluent includes a built-in Service Locator (`Fluent`).
```dart
Fluent.register<UserService>(UserService());
final service = Fluent.get<UserService>();
```

## Complete Example
```dart
import 'package:flutter/material.dart';
import 'package:fluent/fluent.dart';

final FluentMaterialApp myApp = FluentMaterialApp();
final FluentScaffold mainPage = FluentScaffold();
final FluentText label = FluentText("Welcome");

void main() {
  mainPage.setBody(
    FluentColumn().setChildren([
      label.build(),
      FluentButton()
        .setLabel("Change Text")
        .setOnPressed((self) => label.setText("Clicked!")),
    ]).centered().build()
  );

  myApp.setHome(mainPage.build());
  runApp(myApp.build());
}
```
