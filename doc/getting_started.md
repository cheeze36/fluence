# Getting Started with Fluent Flutter

Welcome to the Fluent framework! This guide will help you set up your first imperative-style Flutter application.

## 1. Setup

Import the Fluent library into your `main.dart` file:

```dart
import 'package:flutter/material.dart';
import 'package:fluence/fluent.dart';
```

## 2. Define Your Shell

Fluent replaces the traditional `MyApp` class with static shell objects. Define these at the top level of your file:

```dart
final FluentMaterialApp myApp = FluentMaterialApp();
final FluentScaffold myScaffold = FluentScaffold();
final FluentAppBar myAppBar = FluentAppBar();
```

## 3. Create Your Widgets

Define your UI components as static objects. This allows you to update them from anywhere.

```dart
final FluentText myLabel = FluentText("Initial Text");
final FluentButton myButton = FluentButton();
```

## 4. The `main` Function

Instead of a complex `build` method, configure your objects in the `main` function:

```dart
void main() {
  // 1. Configure properties
  myAppBar.setTitleText("My Fluent App");

  myButton
    .setLabel("Click Me")
    .setOnPressed((self) {
      myLabel.setText("Button was clicked!");
      self.setLabel("Clicked!");
    });

  // 2. Assemble the layout
  myScaffold
    .setAppBar(myAppBar)
    .setBody(
      FluentColumn().setChildren([
        myLabel.build(),
        myButton.build(),
      ]).centered().build()
    );

  // 3. Mount the app
  myApp.setHome(myScaffold.build());
  
  // 4. Run it
  runApp(myApp.build());
}
```

## 5. Navigation

To add a second page, simply define another `FluentScaffold` and use `FNav.goTo()`:

```dart
final FluentScaffold secondPage = FluentScaffold();

void goToSecondPage() {
  secondPage.setBody(Text("You are on page 2").centered());
  FNav.goTo(secondPage.build());
}
```

## Next Steps
- Read the [Architecture Overview](architecture.md) to understand how Fluent works.
- Check the [Widget Reference](widget_reference.md) for a full list of components.
- Explore the [TODO](todo.md) to see what's coming next.
