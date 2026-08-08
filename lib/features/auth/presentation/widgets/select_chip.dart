import 'package:dangdang_v2/app/theme/app_radius.dart';
import 'package:flutter/material.dart';

class SelectChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color? selectedColor;

  const SelectChip({
    super.key,
    required this.text,
    required this.isSelected,
    this.onTap,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final color = selectedColor ?? colorScheme.primary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selectedColor != null
                ? colorScheme.surface
                : isSelected
                ? color
                : colorScheme.surface,
            borderRadius: AppRadius.medium,
            border: Border.all(
              color: isSelected ? color : colorScheme.outlineVariant,
              width: 1,
            ),
          ),
          child: Text(
            text,
            style: textTheme.labelLarge?.copyWith(
              color: isSelected
                  ? selectedColor ?? colorScheme.onPrimary
                  : colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
