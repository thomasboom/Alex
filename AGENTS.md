# Agent Development Guide for Alex

This file contains build commands, testing instructions, and code style guidelines for agentic coding assistants working on this Flutter AI companion application.

## Build, Lint, and Test Commands

### Core Commands
```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Run static analysis (linting)
flutter analyze

# Run all tests
flutter test

# Run a specific test file
flutter test test/widget_test.dart

# Run a specific test by name
flutter test --name "should detect sensitive content"

# Format code
flutter format .

# Build for release (platform-specific)
flutter build apk --release           # Android APK
flutter build appbundle --release      # Android App Bundle
flutter build ios --release            # iOS
flutter build web --release            # Web
flutter build linux --release          # Linux
flutter build macos --release          # macOS
flutter build windows --release        # Windows
```

## Code Style Guidelines

### Imports
- Use absolute package imports for external packages: `import 'package:flutter/material.dart';`
- Use relative imports for project files: `import '../services/ollama_service.dart';`
- Group imports logically: framework packages → third-party packages → local imports
- No blank line between import groups is acceptable but prefer grouping with blank lines

### Formatting
- Use 2-space indentation (Dart standard)
- Use `dart format .` to auto-format before committing
- Use double quotes for string literals
- Add `library;` declaration at the top of library files
- Trailing commas for multi-line parameters and lists
- 100-120 character line length is acceptable

### Types and Null Safety
- Use explicit type annotations for public APIs and method returns
- Use `final` for variables that don't change after initialization
- Use `required` keyword for required constructor parameters
- Use `late` for delayed initialization when value is guaranteed to be set before use
- Prefer `String?` over `String` when null is a valid state
- Avoid `dynamic` - use specific types or `Object?` when needed

### Naming Conventions
- **Classes**: PascalCase (`OllamaService`, `ConversationMessage`, `ChatScreen`)
- **Files**: snake_case (`ollama_service.dart`, `conversation_message.dart`)
- **Variables/Methods**: camelCase (`isUser`, `getCompletion`, `sendMessage`)
- **Private members**: Prefix with underscore (`_baseUrl`, `_logger`, `_loadSystemPrompt`)
- **Constants**: PascalCase in classes, SCREAMING_SNAKE_CASE for global (`appTitle`, `MAX_MESSAGES`)
- **Callbacks**: Start with `on` (`onMessageSent`, `onPinVerified`)

### Class Structure
```dart
/// Brief description of class purpose
class ClassName {
  // Static fields
  static const String constantName = 'value';

  // Instance fields (private)
  final Type _privateField;

  // Constructor (const when possible)
  const ClassName({
    required this.publicField,
    this.optionalField = defaultValue,
  });

  // Getters/setters (if needed)
  Type get computedValue => _privateField.value;

  // Public methods
  Type publicMethod(Type param) { }

  // Private methods
  Type _privateMethod(Type param) { }
}
```

### Error Handling
- Use try-catch blocks for operations that may throw
- Log errors using `AppLogger.e('message', error)` for debugging context
- Throw `Exception` with descriptive messages: `throw Exception('Failed to load: $e')`
- Check widget lifecycle before updates: `if (mounted) setState(() {})`
- Validate user input with clear error messages

### Testing Patterns
- Use `group()` to organize related tests
- Initialize services in `setUpAll()` when needed
- Use `test()` for unit tests and `testWidgets()` for widget tests
- Use `expect()` with matchers: `expect(value, isTrue)`, `expect(result, isNotEmpty)`
- Test both success and failure paths
- Keep tests focused and independent

### Logging
- Use `AppLogger.d()` for debug messages during development
- Use `AppLogger.i()` for important informational messages
- Use `AppLogger.w()` for warnings that don't prevent execution
- Use `AppLogger.e()` for errors that need attention
- Use `AppLogger.f()` for fatal errors
- Include context in log messages, not just "Error occurred"

### Flutter-Specific Guidelines
- Use `const` constructors for widgets when possible
- Prefer `StatelessWidget` over `StatefulWidget` when state is not needed
- Use `super.key` for widget keys
- Separate business logic from UI: use service layer for data, widgets for display
- Use `MediaQuery.of(context).size` for responsive dimensions
- Use `Theme.of(context)` for theme-aware styling

### File Organization
- `lib/components/` - Main UI components (screens, major features)
- `lib/services/` - Business logic, API calls, data management
- `lib/models/` - Data structures and domain models
- `lib/widgets/` - Reusable UI widgets
- `lib/utils/` - Utility functions and helpers
- `lib/constants/` - App-wide constants and configuration
- `test/` - Unit and widget tests

### Service Layer Patterns
- Use static methods for stateless services
- Use singleton pattern or static getters for shared state
- Load configuration from `.env` files using `flutter_dotenv`
- Return futures for async operations
- Document expected exceptions in comments

### Documentation
- Add doc comments (`///`) for all public classes and methods
- Keep comments brief and focused on "why", not "what"
- No inline comments for obvious code
- Document parameter types and return types in method signatures

### JSON Serialization
- Models should have `toJson()` and `fromJson()` methods
- Use `jsonEncode()` and `jsonDecode()` from `dart:convert`
- Use `DateTime.toIso8601String()` and `DateTime.parse()` for dates
- Keep serialization logic in model classes

## Environment Setup
- Ensure `assets/.env` exists and is configured with `OLLAMA_API_KEY`
- Required minimum SDK: ^3.9.2
- Run `flutter pub get` after pulling changes
- Run `flutter analyze` before committing to catch issues early
