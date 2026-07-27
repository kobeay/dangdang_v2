import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/card_container.dart';
import '../widgets/select_chip.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 18,
                    color: Color(0xFF9CA3AF),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    '로그인으로 돌아가기',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              '새 계정 만들기',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1C29),
                height: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '혈당 매니저와 함께 더 건강한\n내일을 만들어보세요!',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),
            CardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('이름'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: '실명을 입력하세요',
                    prefixIcon: Icons.person_outline,
                  ),

                  const SizedBox(height: 28),
                  const Text('닉네임'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: '닉네임을 입력하세요',
                    prefixIcon: Icons.edit_outlined,
                  ),

                  const SizedBox(height: 28),
                  const Text('이메일 주소'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: 'name@example.com',
                    prefixIcon: Icons.mail_outline,
                  ),

                  const SizedBox(height: 28),
                  const Text('비밀번호'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: '6자리 이상 입력하세요',
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: Icons.visibility_off_outlined,
                    obscureText: true,
                  ),

                  const SizedBox(height: 28),
                  const Text('생년월일'),
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
                  const Text('성별'),
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
                            const Text('키'),
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
                            const Text('몸무게'),
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
                  const Text('당뇨 유형'),
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
