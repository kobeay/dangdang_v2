import 'package:dangdang_v2/app/theme/app_radius.dart';
import 'package:flutter/material.dart';

class MealImageSourceBottomSheet extends StatelessWidget {
  final VoidCallback onTapCamera;
  final VoidCallback onTapGallery;

  const MealImageSourceBottomSheet({
    super.key,
    required this.onTapCamera,
    required this.onTapGallery,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 바텀시트 손잡이
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 30),

          // 카메라 버튼
          SizedBox(
            width: double.infinity,
            height: 60,
            child: FilledButton(
              onPressed: onTapCamera,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF3D6D9C),
                foregroundColor: colorScheme.onPrimary,
                shape: RoundedRectangleBorder(borderRadius: AppRadius.medium),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt, color: colorScheme.onPrimary),
                  const SizedBox(width: 10),
                  Text('카메라로 촬영하기', style: textTheme.labelLarge),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 갤러리 버튼
          SizedBox(
            width: double.infinity,
            height: 60,
            child: FilledButton(
              onPressed: onTapGallery,
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.surfaceContainerHighest,
                foregroundColor: colorScheme.onSurface,
                shape: RoundedRectangleBorder(borderRadius: AppRadius.medium),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_outlined,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '갤러리에서 선택하기',
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
