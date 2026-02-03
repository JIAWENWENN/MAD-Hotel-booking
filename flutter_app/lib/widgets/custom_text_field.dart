import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: isDark
              ? const Color(0xFF6B7280)
              : const Color(0xFF9CA3AF),
        ),
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
                color: theme.colorScheme.primary,
              )
            : null,
      ),
    );
  }
}
