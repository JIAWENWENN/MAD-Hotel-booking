# MAD-Hotel-booking

A mobile application development project for secure hotel booking.

## Project Structure

### HTML/CSS Onboarding (Original)
- `index.html` - Static single-page onboarding experience built with Tailwind CSS
- Features secure booking hero with dark mode support

### Flutter Implementation (New)
- `flutter_app/` - Complete Flutter conversion of the Forgot Password UI
- Production-ready implementation with Material Design 3
- Full documentation and integration guides

## Flutter Forgot Password Screen

The forgot password screen has been converted from HTML/CSS to Flutter with:

✅ **Lock icon hero** visual in rounded circle  
✅ **Email input field** with mail icon and validation  
✅ **Reset Your Password** heading and descriptive text  
✅ **SEND RESET LINK** primary button with loading state  
✅ **Back button** in top navigation  
✅ **Remember your password?** footer with login link  
✅ **Dark/light mode** support with proper theming  
✅ **Responsive design** (mobile-first, max-width constraint)  
✅ **Material Design 3** components and best practices  

### Quick Start

```bash
cd flutter_app
flutter pub get
flutter run
```

### Documentation

- [Quick Start Guide](flutter_app/QUICK_START.md) - Get started in 5 minutes
- [Full README](flutter_app/README.md) - Complete project overview
- [Integration Guide](flutter_app/INTEGRATION_GUIDE.md) - How to integrate into your app
- [Design Specifications](flutter_app/DESIGN_SPEC.md) - Detailed design documentation
- [Visual Layout](flutter_app/VISUAL_LAYOUT.md) - Visual reference with diagrams
- [Conversion Summary](FLUTTER_CONVERSION_SUMMARY.md) - Overview of the conversion

## Features

### Design System
- Primary color: #0E3286 (Blue)
- Background light: #F6F8F6
- Background dark: #132210
- Font: Manrope (with fallback)
- Material Symbols icons

### Functionality
- Email validation with regex
- Form submission with loading states
- Theme switching (light/dark)
- Responsive layout
- Navigation support
- Accessibility features

## Technology Stack

### Original (HTML/CSS)
- HTML5
- Tailwind CSS (CDN)
- Google Fonts (Manrope)
- Material Symbols
- JavaScript for configuration

### Flutter Implementation
- Flutter 3.0.0+
- Material Design 3
- Dart
- Custom theming system
- Form validation
- State management

## Development

### HTML Version
Simply open `index.html` in a browser or deploy to a static host.

### Flutter Version
See the [flutter_app](flutter_app/) directory for complete setup instructions.

## License

This project is part of the MAD (Mobile Application Development) coursework.
