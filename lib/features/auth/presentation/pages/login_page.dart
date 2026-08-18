import 'package:dangdang_v2/features/auth/presentation/validators/auth_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_radius.dart';
import '../models/login_model.dart';
import '../widgets/card_container.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    return _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);

    ref.listen(loginProvider, (previous, next) {
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));

        ref.read(loginProvider.notifier).clearError();
      }

      if (next.isSuccess) {
        context.go('/home');
      }
    });

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset('assets/icons/app_icon.png', width: 90, height: 90),
              const SizedBox(height: 24),

              Text('당당하게', style: textTheme.headlineMedium),

              const SizedBox(height: 8),

              Text('건강 관리, 당당하게 시작해보세요!', style: textTheme.bodyMedium),

              const SizedBox(height: 40),

              CardContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: colorScheme.surface,
                              borderRadius: AppRadius.medium,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '로그인',
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: AppRadius.large,
                              onTap: () {
                                context.push('/signup');
                              },
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                child: Text(
                                  '회원가입',
                                  style: textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    Text('이메일 주소', style: textTheme.titleMedium),

                    const SizedBox(height: 12),

                    CustomTextField(
                      controller: _emailController,
                      hintText: 'name@example.com',
                      prefixIcon: Icons.email_outlined,
                      onChanged: (_) {
                        setState(() {});
                      },
                    ),

                    const SizedBox(height: 24),

                    Text('비밀번호', style: textTheme.titleMedium),

                    const SizedBox(height: 12),

                    CustomTextField(
                      controller: _passwordController,
                      hintText: '비밀번호를 입력하세요',
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

                    const SizedBox(height: 32),

                    PrimaryButton(
                      text: state.isLoading ? '로그인 중...' : '로그인',
                      isFormValid: _isFormValid,

                      onPressed: state.isLoading
                          ? null
                          : () {
                              final email = _emailController.text.trim();
                              final password = _passwordController.text;

                              final error = AuthValidator.validateLogin(
                                email: email,
                                password: password,
                              );

                              if (error != null) {
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(SnackBar(content: Text(error)));

                                return;
                              }

                              ref
                                  .read(loginProvider.notifier)
                                  .login(email: email, password: password);
                            },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
