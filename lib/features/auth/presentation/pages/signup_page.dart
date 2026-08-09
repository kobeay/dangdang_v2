import 'package:dangdang_v2/features/auth/presentation/models/signup_model.dart';
import 'package:dangdang_v2/features/auth/presentation/validators/auth_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_radius.dart';
import '../widgets/card_container.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/select_chip.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _nameController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  bool _obscurePassword = true;

  DateTime? _birthDate;
  String? _gender;
  String? _diabetesType;

  @override
  void dispose() {
    _nameController.dispose();
    _nicknameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _birthDateController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    return _nameController.text.isNotEmpty &&
        _nicknameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _birthDate != null &&
        _gender != null &&
        _heightController.text.isNotEmpty &&
        _weightController.text.isNotEmpty &&
        _diabetesType != null;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signupProvider);

    ref.listen(signupProvider, (previous, next) {
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));

        ref.read(signupProvider.notifier).clearError();
      }

      if (next.isSuccess) {
        context.go('/login');
      }
    });

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
                    controller: _nameController,
                    hintText: '실명을 입력하세요',
                    prefixIcon: Icons.person_outline,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),

                  const SizedBox(height: 28),

                  Text('닉네임', style: textTheme.titleMedium),

                  const SizedBox(height: 12),

                  CustomTextField(
                    controller: _nicknameController,
                    hintText: '닉네임을 입력하세요',
                    prefixIcon: Icons.edit_outlined,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),

                  const SizedBox(height: 28),

                  Text('이메일 주소', style: textTheme.titleMedium),

                  const SizedBox(height: 12),

                  CustomTextField(
                    controller: _emailController,
                    hintText: 'name@example.com',
                    prefixIcon: Icons.mail_outline,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),

                  const SizedBox(height: 28),

                  Text('비밀번호', style: textTheme.titleMedium),

                  const SizedBox(height: 12),

                  CustomTextField(
                    controller: _passwordController,
                    hintText: '6자리 이상 입력하세요',
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    onSuffixIconPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    obscureText: _obscurePassword,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),

                  const SizedBox(height: 28),

                  Text('생년월일', style: textTheme.titleMedium),

                  const SizedBox(height: 12),

                  CustomTextField(
                    controller: _birthDateController,
                    hintText: '생년월일을 선택하세요',
                    prefixIcon: Icons.calendar_today,
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: _birthDate ?? DateTime(2000),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );

                      if (date != null) {
                        setState(() {
                          _birthDate = date;
                          _birthDateController.text =
                              '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
                        });
                      }
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
                          isSelected: _gender == '남성',
                          selectedColor: colorScheme.primary,
                          onTap: () {
                            setState(() {
                              _gender = '남성';
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SelectChip(
                          text: '여성',
                          isSelected: _gender == '여성',
                          selectedColor: Colors.red,
                          onTap: () {
                            setState(() {
                              _gender = '여성';
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

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
                              controller: _heightController,
                              hintText: 'ex) 175',
                              prefixIcon: null,
                              keyboardType: TextInputType.number,
                              suffixText: 'cm',
                              onChanged: (_) {
                                setState(() {});
                              },
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
                              controller: _weightController,
                              hintText: 'ex) 70',
                              prefixIcon: null,
                              keyboardType: TextInputType.number,
                              suffixText: 'kg',
                              onChanged: (_) {
                                setState(() {});
                              },
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
                          isSelected: _diabetesType == '1형',
                          onTap: () {
                            setState(() {
                              _diabetesType = '1형';
                            });
                          },
                        ),
                      ),

                      const SizedBox(width: 5),

                      Expanded(
                        child: SelectChip(
                          text: '2형',
                          isSelected: _diabetesType == '2형',
                          onTap: () {
                            setState(() {
                              _diabetesType = '2형';
                            });
                          },
                        ),
                      ),

                      const SizedBox(width: 5),

                      Expanded(
                        child: SelectChip(
                          text: '임신성',
                          isSelected: _diabetesType == '임신성',
                          onTap: () {
                            setState(() {
                              _diabetesType = '임신성';
                            });
                          },
                        ),
                      ),

                      const SizedBox(width: 5),

                      Expanded(
                        child: SelectChip(
                          text: '전단계',
                          isSelected: _diabetesType == '전단계',
                          onTap: () {
                            setState(() {
                              _diabetesType = '전단계';
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  PrimaryButton(
                    text: state.isLoading ? '회원가입 중...' : '회원가입 완료',
                    isFormValid: _isFormValid,
                    onPressed: state.isLoading
                        ? null
                        : () {
                            final name = _nameController.text;
                            final nickname = _nicknameController.text;
                            final email = _emailController.text.trim();
                            final password = _passwordController.text;
                            final height = _heightController.text;
                            final weight = _weightController.text;

                            final error = AuthValidator.validateSignup(
                              name: name,
                              nickname: nickname,
                              email: email,
                              password: password,
                              birthDate: _birthDate,
                              gender: _gender,
                              height: height,
                              weight: weight,
                              diabetesType: _diabetesType,
                            );

                            if (error != null) {
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text(error)));

                              return;
                            }

                            ref
                                .read(signupProvider.notifier)
                                .signup(
                                  name: name,
                                  nickname: nickname,
                                  email: email,
                                  password: password,
                                  birthDate: _birthDate!,
                                  gender: _gender!,
                                  height: double.parse(height),
                                  weight: double.parse(weight),
                                  diabetesType: _diabetesType!,
                                );
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
