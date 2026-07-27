import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? suffixText;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.suffixText,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      readOnly: readOnly,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9FAFC),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFFC4C6D0)),
        suffixText: suffixText,
        suffixStyle: const TextStyle(
          color: Color(0xFF9CA3AF),
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      onTap: onTap,
    );
  }
}
