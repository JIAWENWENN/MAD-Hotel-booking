# Integration Guide - Forgot Password Screen

This guide explains how to integrate the Forgot Password screen into your existing Flutter application.

## Quick Start

### 1. Copy the necessary files to your project

Copy these files to your project:
- `lib/screens/forgot_password_screen.dart`
- `lib/theme/app_theme.dart`
- `lib/widgets/custom_text_field.dart` (optional)
- `lib/widgets/primary_button.dart` (optional)

### 2. Update your pubspec.yaml

Ensure you have Material 3 enabled and the necessary dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
```

### 3. Apply the theme

In your `main.dart`, apply the app theme:

```dart
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const YourHomeScreen(),
    );
  }
}
```

### 4. Navigate to the Forgot Password screen

From your login screen or anywhere in your app:

```dart
import 'screens/forgot_password_screen.dart';

// In your login screen or button handler:
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => const ForgotPasswordScreen(),
  ),
);
```

## Customization

### Changing the submit behavior

By default, the screen simulates sending a reset link. To integrate with your backend:

```dart
// In forgot_password_screen.dart, modify the _handleSubmit method:

Future<void> _handleSubmit() async {
  if (_formKey.currentState!.validate()) {
    setState(() {
      _isLoading = true;
    });

    try {
      // Replace with your API call
      await yourApiService.sendPasswordResetEmail(_emailController.text);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password reset link sent to your email'),
            backgroundColor: Color(0xFF0E3286),
          ),
        );
        Navigator.of(context).pop(); // Go back to login
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${error.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
```

### Modifying the email validation

Update the `_validateEmail` method in `forgot_password_screen.dart`:

```dart
String? _validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  // Add your custom validation logic here
  if (!value.contains('@')) {
    return 'Please enter a valid email';
  }
  return null;
}
```

### Changing colors

Modify the colors in `lib/theme/app_theme.dart`:

```dart
static const Color primaryColor = Color(0xFF0E3286); // Change this
static const Color backgroundLight = Color(0xFFF6F8F6); // Change this
static const Color backgroundDark = Color(0xFF132210); // Change this
```

### Using custom fonts

If you're not using Manrope or want to use a different font:

1. Update `pubspec.yaml`:
```yaml
flutter:
  fonts:
    - family: YourFont
      fonts:
        - asset: fonts/YourFont-Regular.ttf
        - asset: fonts/YourFont-Bold.ttf
          weight: 700
```

2. Update `app_theme.dart`:
```dart
fontFamily: 'YourFont',
```

### Adjusting the layout

To change the max width constraint:

```dart
// In forgot_password_screen.dart:
ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 448), // Change this value
  child: SingleChildScrollView(
    // ... rest of the code
  ),
)
```

## Navigation Patterns

### Option 1: Modal Route (Slide up)

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => const ForgotPasswordScreen(),
    fullscreenDialog: true,
  ),
);
```

### Option 2: Named Routes

In your `MaterialApp`:

```dart
MaterialApp(
  routes: {
    '/forgot-password': (context) => const ForgotPasswordScreen(),
  },
)
```

Navigate:

```dart
Navigator.of(context).pushNamed('/forgot-password');
```

### Option 3: Go Router (recommended for larger apps)

```yaml
# pubspec.yaml
dependencies:
  go_router: ^13.0.0
```

```dart
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
  ],
);

// Navigate:
context.go('/forgot-password');
```

## Testing

### Unit Testing the Validation

```dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Email validation - empty email', () {
    final validator = _validateEmail;
    expect(validator(''), 'Please enter your email');
  });

  test('Email validation - invalid email', () {
    final validator = _validateEmail;
    expect(validator('invalid'), 'Please enter a valid email');
  });

  test('Email validation - valid email', () {
    final validator = _validateEmail;
    expect(validator('test@example.com'), null);
  });
}
```

### Widget Testing

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Forgot password screen renders correctly', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ForgotPasswordScreen(),
      ),
    );

    expect(find.text('Reset Your Password'), findsOneWidget);
    expect(find.byIcon(Icons.lock_rounded), findsOneWidget);
    expect(find.text('SEND RESET LINK'), findsOneWidget);
  });

  testWidgets('Shows validation error for invalid email', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ForgotPasswordScreen(),
      ),
    );

    await tester.enterText(
      find.byType(TextFormField),
      'invalid-email',
    );
    await tester.tap(find.text('SEND RESET LINK'));
    await tester.pump();

    expect(find.text('Please enter a valid email'), findsOneWidget);
  });
}
```

## Accessibility

The screen includes proper accessibility support:

- Semantic labels for icons
- Proper contrast ratios (WCAG AA compliant)
- Focus management for form fields
- Screen reader support

To enhance accessibility further:

```dart
TextFormField(
  // ... other properties
  decoration: InputDecoration(
    // ... other properties
    semanticLabel: 'Email address input',
  ),
)

ElevatedButton(
  // ... other properties
  child: Semantics(
    label: 'Send password reset link',
    child: const Text('SEND RESET LINK'),
  ),
)
```

## Troubleshooting

### Issue: Theme colors not applying

**Solution**: Ensure you're wrapping your screen with `MaterialApp` that has the theme applied:

```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  home: const ForgotPasswordScreen(),
)
```

### Issue: Font not loading

**Solution**: 
1. Verify font files are in the correct location
2. Run `flutter clean` and `flutter pub get`
3. Check that font paths in `pubspec.yaml` match actual file locations

### Issue: Icons not showing

**Solution**: Material Icons are included by default. If using custom icons, add to `pubspec.yaml`:

```yaml
flutter:
  uses-material-design: true
```

## Best Practices

1. **State Management**: For larger apps, consider using a state management solution (Provider, Riverpod, Bloc) instead of StatefulWidget.

2. **API Integration**: Use a service layer to separate business logic from UI:
   ```dart
   class AuthService {
     Future<void> sendPasswordResetEmail(String email) async {
       // API call here
     }
   }
   ```

3. **Error Handling**: Implement proper error handling for network failures, timeouts, etc.

4. **Analytics**: Track user interactions for product insights:
   ```dart
   analytics.logEvent('password_reset_requested', parameters: {
     'method': 'email',
   });
   ```

5. **Localization**: Support multiple languages using Flutter's internationalization:
   ```dart
   Text(AppLocalizations.of(context)!.resetPassword)
   ```

## Support

For issues or questions about this implementation, please refer to:
- Flutter documentation: https://flutter.dev/docs
- Material Design 3: https://m3.material.io/
- Flutter community: https://flutter.dev/community
