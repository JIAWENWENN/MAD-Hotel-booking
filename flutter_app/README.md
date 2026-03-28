# Secure Booking - Flutter App

This is a Flutter implementation of the Secure Booking forgot password screen, converted from the original HTML/CSS design.

## Features

- **Forgot Password Screen**: Complete password reset UI with email validation
- **Dark/Light Theme Support**: Seamlessly switch between light and dark modes
- **Responsive Design**: Mobile-first design with max-width constraint (448px)
- **Material Design 3**: Uses latest Material Design components
- **Form Validation**: Email validation with proper error messages
- **Smooth Animations**: Loading states and transitions

## Design System

### Colors
- **Primary**: #0E3286 (Blue)
- **Background Light**: #F6F8F6
- **Background Dark**: #132210
- **Text Light**: #111827
- **Text Dark**: #FFFFFF
- **Gray Light**: #6B7280
- **Gray Dark**: #9CA3AF

### Typography
- **Font Family**: Manrope (system default as fallback)
- **Display Large**: 32px, Bold
- **Headline Medium**: 24px, Bold
- **Body Large**: 16px, Regular
- **Body Medium**: 14px, Regular

### Components

#### Lock Icon Hero
- Circular background with primary color
- 120x120 size
- Lock icon (60px)
- Shadow with 30px blur radius

#### Email Input Field
- Rounded corners (16px)
- Mail icon on the right
- Email validation
- Focus state with primary color border

#### Reset Button
- Full width
- Rounded pill shape (28px border radius)
- Primary color background
- 56px height
- Loading state with spinner

#### Navigation
- Back button in app bar
- "Remember your password?" text with login link
- Proper routing support

## Project Structure

```
flutter_app/
├── lib/
│   ├── main.dart                 # App entry point with theme switching
│   ├── screens/
│   │   └── forgot_password_screen.dart  # Forgot password screen widget
│   └── theme/
│       └── app_theme.dart        # Light and dark theme definitions
├── pubspec.yaml                  # Dependencies and assets
└── README.md                     # This file
```

## Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (included with Flutter)

### Installation

1. Navigate to the flutter_app directory:
```bash
cd flutter_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Usage

### Forgot Password Screen

The `ForgotPasswordScreen` widget can be used in your navigation flow:

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => const ForgotPasswordScreen(),
  ),
);
```

### Theme Switching

The app supports dynamic theme switching between light and dark modes. Use the theme toggle button in the app bar to switch themes.

### Form Validation

The email input field includes built-in validation:
- Checks for empty input
- Validates email format using regex
- Shows error messages below the input field

## Customization

### Changing Colors

Edit the colors in `lib/theme/app_theme.dart`:

```dart
static const Color primaryColor = Color(0xFF0E3286);
static const Color backgroundLight = Color(0xFFF6F8F6);
static const Color backgroundDark = Color(0xFF132210);
```

### Modifying the Form

The form validation logic is in `lib/screens/forgot_password_screen.dart`. You can customize:
- Email validation regex
- Error messages
- Submit behavior
- Loading states

## Notes

### Fonts
The `pubspec.yaml` includes Manrope font configuration. If you want to use the Manrope font:
1. Download the Manrope font family from Google Fonts
2. Create a `fonts/` directory in the project root
3. Add the font files as specified in `pubspec.yaml`

Alternatively, the app will fall back to the system's default sans-serif font.

### Material Icons
The app uses Material Icons which are included by default in Flutter. No additional setup is required for:
- `Icons.arrow_back` (Back button)
- `Icons.lock_rounded` (Lock icon)
- `Icons.mail_outline` (Email icon)

## Best Practices Implemented

- ✅ Proper form validation with GlobalKey
- ✅ TextEditingController disposal to prevent memory leaks
- ✅ Loading states during async operations
- ✅ Responsive design with ConstrainedBox
- ✅ Material Design 3 components
- ✅ Theme-aware UI elements
- ✅ Proper state management with StatefulWidget
- ✅ SafeArea for proper spacing on all devices
- ✅ SingleChildScrollView for keyboard overflow handling
- ✅ Accessibility considerations (proper labels, contrast ratios)

## Testing

To run tests (when implemented):
```bash
flutter test
```

## Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## License

This project follows the same license as the original HTML/CSS implementation.
