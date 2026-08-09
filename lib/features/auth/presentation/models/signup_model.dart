import 'package:dangdang_v2/features/auth/presentation/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupProvider = NotifierProvider<SignupModel, SignupState>(
  SignupModel.new,
);

class SignupState {
  static const _undefined = Object();

  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  const SignupState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  SignupState copyWith({
    bool? isLoading,
    bool? isSuccess,
    Object? errorMessage = _undefined,
  }) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: identical(errorMessage, _undefined)
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}

class SignupModel extends Notifier<SignupState> {
  @override
  SignupState build() {
    return const SignupState();
  }

  Future<void> signup({
    required String name,
    required String nickname,
    required String email,
    required String password,
    required DateTime birthDate,
    required String gender,
    required double height,
    required double weight,
    required String diabetesType,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final signupUseCase = ref.read(signupUseCaseProvider);

      final user = await signupUseCase.signup(
        name: name,
        nickname: nickname,
        email: email,
        password: password,
        birthDate: birthDate,
        gender: gender,
        height: height,
        weight: weight,
        diabetesType: diabetesType,
      );

      debugPrint('회원가입 성공: ${user.email}');

      state = state.copyWith(isLoading: false, isSuccess: true);
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'email-already-in-use':
          message = '이미 사용 중인 이메일입니다.';
          break;
        case 'weak-password':
          message = '비밀번호는 6자리 이상 입력해주세요.';
          break;
        case 'invalid-email':
          message = '올바른 이메일 형식을 입력해주세요.';
          break;
        case 'network-request-failed':
          message = '네트워크 연결을 확인해주세요.';
          break;
        default:
          message = '회원가입에 실패했습니다.';
      }

      state = state.copyWith(isLoading: false, errorMessage: message);
    } catch (e) {
      debugPrint('회원가입 실패: $e');

      state = state.copyWith(
        isLoading: false,
        errorMessage: '알 수 없는 오류가 발생했습니다.',
      );
    }
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}
