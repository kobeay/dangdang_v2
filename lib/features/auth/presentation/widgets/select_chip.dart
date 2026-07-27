import 'package:flutter/material.dart';

class SelectChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const SelectChip({
    super.key,
    required this.text,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF6C79FA) : Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF6C79FA)
                  : const Color(0xFFE5E7EB),
              width: 1,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
