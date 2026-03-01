# TODO: Fixing Flutter

The following widgets and features need to be "fixed" to follow the Fluent pattern.

## Core Widgets
- [x] `FluentText`
- [x] `FluentButton` (ElevatedButton)
- [x] `FluentColumn`
- [x] `FluentRow`
- [x] `FluentContainer`
- [x] `FluentPadding`
- [x] `FluentCenter`

## Input & Interactivity
- [x] `FluentTextField` - Needs imperative `setText`, `clear`, and `onChanged`.
- [x] `FluentCheckbox`
- [x] `FluentSwitch`
- [x] `FluentSlider`
- [x] `FluentGestureDetector` (Tap, Double Tap, Long Press)

## Layout & Containers
- [x] `FluentListView` - Imperative `addItem`, `removeItem`, `clear`.
- [x] `FluentStack`
- [x] `FluentSizedBox`
- [x] `FluentExpanded` / `FluentFlexible` (How to wrap these for easier use?)

## Media & Assets
- [x] `FluentImage` (Network, Asset, File)
- [x] `FluentIcon`

## Styling & Themes
- [x] `FluentTheme` - Global imperative style management.
- [x] Helper methods for common `EdgeInsets` and `TextStyle` constants.

## Navigation & Routing
- [x] `FluentNavigator` (Global `goTo`, `pop`, `replace` without Context)

## Data & Networking
- [x] `FluentData` (Imperative `get`, `post`, `put` with UI updates)
- [x] `FluentLoader` (Widget that imperatively handles loading/success/error)

## Animations & Effects
- [x] `FluentAnimate` (Chainable `animateTo`, `fadeOut`, etc. on any widget)

## Advanced Forms
- [x] `FluentForm` (Central validation and value collection)

## Infrastructure (DI/Service Locator)
- [x] `Fluent.register<T>` (Service registry for dependency management)
- [x] Package Distribution Setup (Formal `pubspec.yaml` and folder structure)
- [x] MIT License and README creation

## Documentation
- [x] Architecture Overview
- [x] Widget Reference Guide
- [x] Getting Started Guide
- [x] Example Project (refactoring `main.dart` count app)
