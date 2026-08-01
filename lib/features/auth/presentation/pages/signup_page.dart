import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/primary_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/card_container.dart';
import '../widgets/select_chip.dart';
import '../../../../app/theme/app_radius.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 56, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  context.pop();
                },
                borderRadius: AppRadius.small,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 18,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '로그인으로 돌아가기',
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text('새 계정 만들기', style: textTheme.headlineLarge),
            const SizedBox(height: 16),
            Text('혈당 매니저와 함께 더 건강한\n내일을 만들어보세요!', style: textTheme.bodyLarge),
            const SizedBox(height: 40),
            CardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('이름', style: textTheme.titleMedium),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: '실명을 입력하세요',
                    prefixIcon: Icons.person_outline,
                  ),

                  const SizedBox(height: 28),
                  Text('닉네임', style: textTheme.titleMedium),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: '닉네임을 입력하세요',
                    prefixIcon: Icons.edit_outlined,
                  ),

                  const SizedBox(height: 28),
                  Text('이메일 주소', style: textTheme.titleMedium),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: 'name@example.com',
                    prefixIcon: Icons.mail_outline,
                  ),

                  const SizedBox(height: 28),
                  Text('비밀번호', style: textTheme.titleMedium),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: '6자리 이상 입력하세요',
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: Icons.visibility_off_outlined,
                    obscureText: true,
                  ),

                  const SizedBox(height: 28),
                  Text('생년월일', style: textTheme.titleMedium),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: '생년월일을 선택하세요',
                    prefixIcon: Icons.calendar_today,
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                    },
                  ),

                  const SizedBox(height: 28),
                  Text('성별', style: textTheme.titleMedium),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: SelectChip(
                          text: '남성',
                          isSelected: true,
                          onTap: null,
                        ),
                      ),

                      const SizedBox(width: 10),
                      Expanded(
                        child: SelectChip(
                          text: '여성',
                          isSelected: true,
                          onTap: null,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('키', style: textTheme.titleMedium),
                            const SizedBox(height: 12),
                            CustomTextField(
                              hintText: 'ex) 175',
                              prefixIcon: null,
                              keyboardType: TextInputType.number,
                              suffixText: 'cm',
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('몸무게', style: textTheme.titleMedium),
                            const SizedBox(height: 12),
                            CustomTextField(
                              hintText: 'ex) 70',
                              prefixIcon: null,
                              keyboardType: TextInputType.number,
                              suffixText: 'kg',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),
                  Text('당뇨 유형', style: textTheme.titleMedium),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: SelectChip(
                          text: '1형',
                          isSelected: true,
                          onTap: null,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: SelectChip(
                          text: '2형',
                          isSelected: true,
                          onTap: null,
                        ),
                      ),

                      const SizedBox(width: 5),
                      Expanded(
                        child: SelectChip(
                          text: '임신성',
                          isSelected: true,
                          onTap: null,
                        ),
                      ),

                      const SizedBox(width: 5),
                      Expanded(
                        child: SelectChip(
                          text: '전단계',
                          isSelected: true,
                          onTap: null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  PrimaryButton(text: '회원가입 완료', onPressed: null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
