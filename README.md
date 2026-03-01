# Fluence 

A Fluent, imperative, setter-based wrapper for the Flutter framework. 

## Imperitive Flutter
Fluence aims to provide a more traditional "widget-as-an-object" API that allows for direct property manipulation without manual state management or deeply nested build methods.

### Key Features
*   **Imperative API**: Update UI components directly using setter methods.
*   **Global Navigation**: Navigate between screens without `BuildContext`.
*   **Chainable Layouts**: Flatten your widget tree with postfix layout modifiers like `.padded()` and `.centered()`.
*   **Built-in Data Fetching**: Imperative HTTP client and loading state management.
*   **Tickerless Animations**: Simple, chainable animations on any widget.
*   **Service Locator**: Built-in dependency injection for easy global access.

## Documentation
Detailed documentation is available in the `doc/` folder:
- [Getting Started](doc/getting_started.md)
- [Architecture Overview](doc/architecture.md)
- [Widget Reference](doc/widget_reference.md)

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
