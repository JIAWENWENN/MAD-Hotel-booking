# Quick Start Guide

Get the Forgot Password screen running in 5 minutes!

## Prerequisites

- Flutter SDK installed (3.0.0 or higher)
- A code editor (VS Code, Android Studio, or IntelliJ IDEA)
- A device or emulator to run the app

## Installation

### Step 1: Navigate to the project
```bash
cd flutter_app
```

### Step 2: Get dependencies
```bash
flutter pub get
```

### Step 3: Run the app
```bash
flutter run
```

That's it! The app will launch and you'll see a demo home screen with a button to navigate to the Forgot Password screen.

## What You'll See

1. **Home Screen**: A simple screen with a "GO TO FORGOT PASSWORD" button and theme toggle
2. **Forgot Password Screen**: The fully functional password reset interface

## Testing the Features

### Theme Switching
- Click the sun/moon icon in the app bar to toggle between light and dark modes
- Watch all colors smoothly transition

### Form Validation
1. Click "SEND RESET LINK" without entering an email
   - See error: "Please enter your email"
2. Enter an invalid email (e.g., "test")
   - See error: "Please enter a valid email"
3. Enter a valid email (e.g., "user@example.com")
   - See loading spinner
   - See success message after 2 seconds

### Navigation
- Click the back arrow to return to the previous screen
- Click "Login" in the footer to go back

## Customization Quick Tips

### Change the Primary Color
Edit `lib/theme/app_theme.dart`:
```dart
static const Color primaryColor = Color(0xFF0E3386); // Change this hex value
```

### Change Button Text
Edit `lib/screens/forgot_password_screen.dart`:
```dart
const Text('SEND RESET LINK'), // Change to your text
```

### Change Max Width
Edit `lib/screens/forgot_password_screen.dart`:
```dart
constraints: const BoxConstraints(maxWidth: 448), // Change 448 to your value
```

## Integration into Your App

### Copy Just the Essentials
If you have an existing Flutter app, copy these files:
```
lib/screens/forgot_password_screen.dart  → Your project
lib/theme/app_theme.dart                 → Your project
```

### Apply the Theme
In your main.dart:
```dart
import 'theme/app_theme.dart';

MaterialApp(
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  themeMode: ThemeMode.system,
  // ... rest of your app
)
```

### Navigate to the Screen
From anywhere in your app:
```dart
import 'screens/forgot_password_screen.dart';

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const ForgotPasswordScreen(),
  ),
);
```

## Hot Reload

While the app is running, you can make changes to the code and press:
- `r` in the terminal to hot reload
- `R` in the terminal to hot restart
- `q` to quit

## Common Issues

### "flutter: command not found"
- Install Flutter: https://docs.flutter.dev/get-started/install

### "No devices found"
- Start an emulator or connect a physical device
- Check with `flutter devices`

### "Package not found"
- Run `flutter pub get` again
- Check your internet connection

### "Unsupported operation"
- Make sure Flutter SDK is version 3.0.0 or higher
- Check with `flutter --version`

## Next Steps

1. **Read the Documentation**
   - `README.md` - Full project overview
   - `INTEGRATION_GUIDE.md` - Detailed integration instructions
   - `DESIGN_SPEC.md` - Complete design specifications

2. **Customize for Your Needs**
   - Update colors to match your brand
   - Connect to your authentication API
   - Add analytics tracking

3. **Build for Production**
   - `flutter build apk` for Android
   - `flutter build ios` for iOS
   - `flutter build web` for Web

## Support

- Flutter Docs: https://docs.flutter.dev
- Material Design: https://m3.material.io
- Stack Overflow: https://stackoverflow.com/questions/tagged/flutter

## Tips

- Use `flutter doctor` to check your Flutter installation
- Use `flutter clean` if you encounter build issues
- Use `flutter analyze` to check for code issues
- Press `p` while app is running to see the widget tree

Happy coding! 🚀
