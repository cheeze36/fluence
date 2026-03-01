# Fluent Flutter Widget Reference Guide

This guide provides a comprehensive overview of every imperative wrapper and layout tool available in the Fluent library.

## Core Infrastructure

### `Fluent` (Service Locator)
A built-in registry for managing global objects.
```dart
Fluent.register<MyService>(MyService());
final service = Fluent.get<MyService>();
```

### `FluentNavigator` (Global `FNav`)
Manage app navigation without `BuildContext`.
```dart
FNav.goTo(MyDetailsPage()); // Navigate forward
FNav.pop(); // Go back
FNav.replace(OtherPage()); // Replace current route
```

### `FluentTheme` (Singleton)
Manage global styles, colors, and themes imperatively.
```dart
FluentTheme().setPrimaryColor(Colors.green).setTextColor(Colors.white);
```

### `F` (Utility Class)
Shorthand for common styles and constants.
- `F.p8`, `F.p16`, `F.p24` (Padding)
- `F.h1`, `F.h2`, `F.body`, `F.caption` (TextStyles)

---

## Layout & Containers

### `FluentScaffold`
The high-level screen structure.
- `setAppBar(FluentAppBar)`
- `setBody(Widget)`
- `setFloatingActionButton(Widget)`
- `setBackgroundColor(Color)`

```dart
myScaffold.setAppBar(myAppBar).setBody(myColumn.build());
```

### `FluentColumn` / `FluentRow`
- `setChildren(List<Widget>)`
- `addChild(Widget)`
- `setMainAxisAlignment(MainAxisAlignment)`
- `setCrossAxisAlignment(CrossAxisAlignment)`

```dart
FluentColumn().setChildren([
  FluentText("Item 1").build(),
  FluentText("Item 2").build(),
]).padded(F.p16).centered();
```

### `FluentContainer`
- `setChild(Widget)`
- `setWidth(double)`, `setHeight(double)`
- `setColor(Color)`, `setPadding(EdgeInsets)`, `setAlignment(Alignment)`

```dart
FluentContainer().setWidth(100).setHeight(100).setColor(Colors.red);
```

### `FluentListView`
Imperative list management.
- `addItem(Widget)`, `insertItem(int, Widget)`
- `removeItem(Widget)`, `removeItemAt(int)`
- `clear()`

```dart
myList.addItem(ListTile(title: Text("New Item"))).expanded();
```

---

## Core Widgets

### `FluentText`
- `setText(String)`
- `setStyle(TextStyle)`
- `setTextAlign(TextAlign)`

```dart
final title = FluentText("Hello").setStyle(F.h1);
```

### `FluentButton`
- `setLabel(String)`
- `setChild(Widget)`
- `setOnPressed(void Function(FluentButton self))`
- `setStyle(ButtonStyle)`

```dart
FluentButton().setLabel("Submit").setOnPressed((self) => self.setLabel("Sent!"));
```

### `FluentIcon`
- `setIcon(IconData)`
- `setSize(double)`, `setColor(Color)`

```dart
FluentIcon(Icons.star).setColor(Colors.yellow);
```

### `FluentImage`
- `FluentImage.asset(String)`, `FluentImage.network(String)`
- `setAsset(String)`, `setNetwork(String)`
- `setWidth(double)`, `setHeight(double)`, `setFit(BoxFit)`

```dart
FluentImage.network("https://example.com/logo.png").sized(width: 50);
```

---

## Input & Interactivity

### `FluentTextField`
- `setText(String)`, `getText()`, `clear()`
- `setHintText(String)`, `setLabelText(String)`
- `setOnChanged(void Function(FluentTextField self, String value))`
- `setValidator(String? Function(String value))`

```dart
FluentTextField().setLabelText("Name").setOnChanged((self, val) => print(val));
```

### `FluentForm`
- `addField(String key, dynamic field)`
- `validate()`, `getValues()` (Returns `Map<String, dynamic>`)
- `clear()`, `setErrorMessage(String?)`

```dart
myForm.addField("email", emailField).validate();
```

### `FluentSwitch` / `FluentCheckbox`
- `setValue(bool)`, `getValue()`, `setOnChanged(void Function(self, value))`

```dart
FluentSwitch().setValue(true).setOnChanged((self, val) => print(val));
```

---

## Animations & Data

### `FluentAnimate`
Applied using `.animate()` on any Widget or FluentWidget.
- `fadeIn()`, `fadeOut()`
- `scaleTo(double)`, `rotateTo(double turns)`, `moveTo(Offset)`

```dart
myLabel.animate().scaleTo(1.5).setDuration(Duration(seconds: 1));
```

### `FluentLoader`
Manages loading states.
- `showLoading()`, `showSuccess([Widget])`, `showError(String)`

```dart
myLoader.showLoading();
// ... later ...
myLoader.showSuccess(content.build());
```

### `FluentData` (Global `FData`)
Imperative networking.
- `get(path)`, `post(path, data)`, `put(path, data)`, `delete(path)`

```dart
final result = await FData.get("/users");
```
