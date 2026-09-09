import 'package:dangdang_v2/app/theme/app_radius.dart';
import 'package:dangdang_v2/core/widgets/app_bottom_navigation_bar.dart';
import 'package:dangdang_v2/features/home/presentation/widgets/blood_glucose_chart.dart';
import 'package:dangdang_v2/features/home/presentation/widgets/meal_image_source_bottom_sheet.dart';
import 'package:dangdang_v2/features/home/presentation/widgets/quick_action_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: source);

    if (image == null) {
      return;
    }

    debugPrint(image.path);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '안녕하세요, 코비님!',
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '오늘도 건강한 하루 되세요',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(radius: 24, child: Icon(Icons.person)),
                ],
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: AppRadius.large,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            borderRadius: AppRadius.medium,
                          ),
                          child: Center(
                            child: Text('최근 혈당', style: textTheme.labelSmall),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    Row(
                      children: [
                        Text(
                          '100',
                          style: textTheme.headlineLarge?.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'mg/DL',
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Text('✓ 정상 범위 내에 있습니다(식후)', style: textTheme.labelSmall),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Row(
                children: [
                  Expanded(
                    child: QuickActionCard(
                      icon: Icons.add,
                      iconColor: colorScheme.primary,
                      iconBackgroundColor: const Color(0xFFE8F0FE),
                      title: '혈당 기록',
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.large,
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.shadow.withValues(alpha: 0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: QuickActionCard(
                        icon: Icons.camera_alt_outlined,
                        iconColor: const Color(0xFF12B76A),
                        iconBackgroundColor: const Color(0xFFE8FAF1),
                        title: '식단 촬영',
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: colorScheme.surface,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(28),
                              ),
                            ),
                            builder: (context) {
                              return MealImageSourceBottomSheet(
                                onTapCamera: () {
                                  Navigator.pop(context);
                                  _pickImage(ImageSource.camera);
                                },
                                onTapGallery: () {
                                  Navigator.pop(context);
                                  _pickImage(ImageSource.gallery);
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              Row(
                children: [
                  Expanded(child: Text('혈당 리포트', style: textTheme.titleLarge)),
                  TextButton(
                    onPressed: () {},
                    child: Text('자세히 보기', style: textTheme.bodyMedium),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const BloodGlucoseChart(),
            ],
          ),
        ),
      ),
    );
  }
}
