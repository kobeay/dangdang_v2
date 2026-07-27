import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/primary_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/card_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset('assets/icons/app_icon.png', width: 90, height: 90),
              const SizedBox(height: 24),
              const Text(
                '당당하게',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '건강 관리, 당당하게 시작해보세요!',
                style: TextStyle(fontSize: 16, color: Color(0xFF8A8D9F)),
              ),
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: const Text(
                                '로그인',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(32),
                              onTap: () {
                                context.push('/signup');
                              },
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                child: const Text(
                                  '회원가입',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const Text('이메일 주소'),
                    const SizedBox(height: 12),
                    CustomTextField(
                      hintText: 'name@example.com',
                      prefixIcon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 24),
                    const Text('비밀번호'),
                    const SizedBox(height: 12),
                    CustomTextField(
                      hintText: '비밀번호를 입력하세요',
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: Icons.visibility_off_outlined,
                      obscureText: true,
                    ),
                    const SizedBox(height: 32),
                    PrimaryButton(text: '로그인', onPressed: null),
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
