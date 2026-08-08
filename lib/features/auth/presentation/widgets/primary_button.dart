import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isFormValid;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isFormValid = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isFormValid
              ? colorScheme.primary
              : colorScheme.surfaceContainerHighest,
        ),
        child: Text(
          text,
          style: textTheme.labelLarge?.copyWith(
            color: isFormValid ? colorScheme.onPrimary : colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
