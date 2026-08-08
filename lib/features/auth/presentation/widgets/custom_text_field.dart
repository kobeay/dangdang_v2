import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final String? suffixText;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    this.controller,
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.suffixText,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon == null
            ? null
            : IconButton(
                onPressed: onSuffixIconPressed,
                icon: Icon(suffixIcon),
              ),
        hintText: hintText,
        suffixText: suffixText,
      ),
      onTap: onTap,
      onChanged: onChanged,
    );
  }
}
