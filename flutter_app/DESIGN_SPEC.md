# Design Specification - Forgot Password Screen

This document outlines the design specifications for the Flutter implementation of the Forgot Password screen, based on the original HTML/CSS design system.

## Design System

### Color Palette

#### Light Mode
| Element | Color Code | Usage |
|---------|------------|-------|
| Primary | `#0E3386` | Buttons, links, focused borders, icons |
| Background | `#F6F8F6` | Page background |
| Surface | `#FFFFFF` | Cards, input fields |
| Text Primary | `#111827` | Headings, body text |
| Text Secondary | `#6B7280` | Descriptions, hints |
| Border | `#E5E7EB` | Input borders, dividers |

#### Dark Mode
| Element | Color Code | Usage |
|---------|------------|-------|
| Primary | `#0E3386` | Buttons, links, focused borders, icons |
| Background | `#132210` | Page background |
| Surface | `#1F2937` | Cards, input fields |
| Text Primary | `#FFFFFF` | Headings, body text |
| Text Secondary | `#9CA3AF` | Descriptions, hints |
| Border | `#374151` | Input borders, dividers |

### Typography

| Style | Font Size | Weight | Line Height | Usage |
|-------|-----------|--------|-------------|-------|
| Display Large | 32px | 700 (Bold) | 1.2 | Main headings |
| Headline Medium | 24px | 700 (Bold) | 1.3 | Section headings |
| Body Large | 16px | 400 (Regular) | 1.5 | Descriptions, body text |
| Body Medium | 14px | 400 (Regular) | 1.4 | Secondary text, labels |
| Button Text | 16px | 700 (Bold) | 1.0 | Button labels |

**Font Family**: Manrope (fallback to system sans-serif)

### Spacing Scale

```
4px   (0.25rem)  - xs
8px   (0.5rem)   - sm
12px  (0.75rem)  - md
16px  (1rem)     - lg
24px  (1.5rem)   - xl
32px  (2rem)     - 2xl
40px  (2.5rem)   - 3xl
48px  (3rem)     - 4xl
```

### Border Radius

```
8px   - Small elements
16px  - Input fields, cards
28px  - Buttons (pill shape)
9999px - Circular elements
```

## Component Specifications

### 1. Hero Lock Icon

**Dimensions**: 120x120px
**Background**: Primary color (`#0E3386`)
**Shape**: Circle
**Icon**: Material Icons `lock_rounded`
**Icon Size**: 60px
**Icon Color**: White
**Shadow**:
- Color: Primary with 30% opacity
- Blur: 30px
- Offset: (0, 10px)

**Flutter Implementation**:
```dart
Container(
  width: 120,
  height: 120,
  decoration: BoxDecoration(
    color: Color(0xFF0E3386),
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: Color(0xFF0E3386).withOpacity(0.3),
        blurRadius: 30,
        offset: Offset(0, 10),
      ),
    ],
  ),
  child: Icon(
    Icons.lock_rounded,
    size: 60,
    color: Colors.white,
  ),
)
```

### 2. Heading

**Text**: "Reset Your Password"
**Font Size**: 28px (adjusted from 32px for mobile)
**Font Weight**: Bold (700)
**Color**: 
- Light mode: `#111827`
- Dark mode: `#FFFFFF`
**Alignment**: Center
**Spacing Below**: 12px

### 3. Description Text

**Text**: "Enter your email address and we'll send you a link to reset your password."
**Font Size**: 16px
**Font Weight**: Regular (400)
**Color**:
- Light mode: `#6B7280`
- Dark mode: `#9CA3AF`
**Line Height**: 1.5
**Alignment**: Center
**Spacing Below**: 40px

### 4. Email Input Field

**Height**: Auto (minimum 56px including padding)
**Width**: Full width
**Border Radius**: 16px
**Background**:
- Light mode: `#FFFFFF`
- Dark mode: `#1F2937`
**Border**:
- Default: 1px solid
  - Light: `#E5E7EB`
  - Dark: `#374151`
- Focused: 2px solid `#0E3386`
- Error: 1px solid `#EF4444`
**Padding**: 16px horizontal, 16px vertical
**Hint Text**: "Enter your email"
**Hint Color**:
- Light mode: `#9CA3AF`
- Dark mode: `#6B7280`
**Suffix Icon**: Material Icons `mail_outline`
**Icon Color**: Primary (`#0E3386`)
**Icon Size**: 24px
**Spacing Below**: 24px

**Validation**:
- Empty: "Please enter your email"
- Invalid format: "Please enter a valid email"
- Validation on submit

### 5. Submit Button

**Text**: "SEND RESET LINK"
**Height**: 56px
**Width**: Full width
**Border Radius**: 28px (pill shape)
**Background**: Primary color (`#0E3386`)
**Text Color**: White (`#FFFFFF`)
**Font Size**: 16px
**Font Weight**: Bold (700)
**Letter Spacing**: 0.5px
**Hover Effect**: Brightness increase
**Active Effect**: Scale to 98%
**Loading State**: White circular progress indicator (24px)
**Shadow**:
- Color: Primary with 25% opacity
- Blur: 20px
**Spacing Below**: 32px

### 6. Footer Link

**Text**: "Remember your password? Login"
**Font Size**: 14px
**Font Weight**: 
- Regular text: 400 (Regular)
- Link: 700 (Bold)
**Color**:
- Regular text: `#6B7280` (light) / `#9CA3AF` (dark)
- Link: Primary (`#0E3386`)
**Link Underline**: On hover
**Action**: Navigate back or to login

### 7. Back Button (AppBar)

**Icon**: Material Icons `arrow_back`
**Size**: 24px
**Color**:
- Light mode: `#111827`
- Dark mode: `#FFFFFF`
**Position**: Top left of app bar
**Action**: Navigate back

## Layout Specifications

### Container Constraints

**Max Width**: 448px (md breakpoint)
**Horizontal Padding**: 24px
**Centering**: Horizontally centered

### Vertical Spacing

```
Top padding: 40px
Hero icon: 120px height
  ↓ 40px
Heading
  ↓ 12px
Description
  ↓ 40px
Email input
  ↓ 24px
Submit button
  ↓ 32px
Footer link
Bottom padding: 40px
```

### Responsive Behavior

- Mobile (< 448px): Full width with 24px padding
- Tablet/Desktop (> 448px): Constrained to 448px, centered
- SafeArea insets respected on all devices
- Keyboard overflow: Scrollable content

## States

### Default State
- Email field empty
- Submit button enabled
- No error messages

### Focused State
- Email field border: 2px primary color
- Suffix icon highlighted

### Validation Error State
- Email field border: red
- Error message below field
- Submit button enabled (to retry)

### Loading State
- Email field disabled (grayed out)
- Submit button shows loading spinner
- Back button disabled

### Success State
- SnackBar appears with success message
- Background: Primary color
- Duration: 3 seconds
- Optional: Navigate back to login

## Animations

### Button Press
```
Duration: 100ms
Scale: 1.0 → 0.98 → 1.0
Ease: ease-in-out
```

### Loading Spinner
```
Type: Circular
Color: White
Size: 24px
Stroke width: 2px
```

### Transitions
```
Theme change: 300ms
Color transitions: 200ms
Opacity changes: 200ms
```

## Accessibility

### WCAG Compliance
- **Contrast Ratios**: 
  - Normal text: 4.5:1 minimum
  - Large text: 3:1 minimum
- **Touch Targets**: Minimum 44x44px
- **Keyboard Navigation**: Full support
- **Screen Readers**: Semantic labels provided

### Focus Indicators
- Visible focus outline on all interactive elements
- Primary color outline, 2px width
- 2px offset from element

### Semantic Labels
- Email field: "Email address input"
- Submit button: "Send password reset link"
- Back button: "Navigate back"

## Platform Considerations

### iOS
- SafeArea insets respected
- Keyboard behavior: Scroll content when keyboard appears
- System font fallback: San Francisco

### Android
- Material Design 3 components
- Keyboard behavior: Resize content when keyboard appears
- System font fallback: Roboto

### Web
- Responsive breakpoints
- Keyboard shortcuts: Enter to submit
- Browser autofill support
- System font fallback: System UI

## Implementation Checklist

- [x] Light theme colors match specification
- [x] Dark theme colors match specification
- [x] Typography scale implemented
- [x] Hero lock icon with shadow
- [x] Email input field with validation
- [x] Submit button with loading state
- [x] Footer with login link
- [x] Back button in app bar
- [x] Form validation
- [x] Error handling
- [x] Success feedback
- [x] Responsive layout
- [x] Keyboard overflow handling
- [x] Theme switching support
- [x] Material Design 3 components
- [x] Accessibility features
- [x] State management
- [x] Navigation integration

## Browser/Platform Support

### Minimum Requirements
- **Flutter SDK**: 3.0.0+
- **Dart SDK**: 2.17.0+
- **iOS**: 11.0+
- **Android**: API 21+ (Android 5.0 Lollipop)
- **Web**: Modern browsers (Chrome, Firefox, Safari, Edge)

## Performance Targets

- **Initial Load**: < 100ms
- **Theme Switch**: < 300ms
- **Form Validation**: < 50ms
- **Animation Frame Rate**: 60fps
- **Memory Usage**: < 50MB

## Notes

1. The design maintains consistency with the original HTML/CSS design system
2. Material Design 3 provides enhanced usability and modern aesthetics
3. Theme colors can be customized in `app_theme.dart`
4. The implementation is production-ready and follows Flutter best practices
5. All spacing and sizing use logical pixels for cross-platform consistency
