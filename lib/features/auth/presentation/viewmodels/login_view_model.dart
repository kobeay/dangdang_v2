import 'package:dangdang_v2/features/auth/presentation/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginViewModelProvider = NotifierProvider<LoginViewModel, LoginState>(
  LoginViewModel.new,
);

class LoginState {
  static const _undefined = Object();

  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  const LoginState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    Object? errorMessage = _undefined,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: identical(errorMessage, _undefined)
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}

class LoginViewModel extends Notifier<LoginState> {
  @override
  LoginState build() {
    return const LoginState();
  }

  Future<void> login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final loginUseCase = ref.read(loginUseCaseProvider);

      final user = await loginUseCase.login(email: email, password: password);

      debugPrint('로그인 성공: ${user.email}');

      state = state.copyWith(isLoading: false, isSuccess: true);
    } on FirebaseAuthException catch (e) {
      debugPrint('로그인 실패: ${e.code}');

      String message;

      switch (e.code) {
        case 'invalid-credential':
        case 'user-not-found':
        case 'wrong-password':
          message = '이메일 또는 비밀번호가 올바르지 않습니다.';
          break;

        case 'invalid-email':
          message = '올바른 이메일 형식을 입력해주세요.';
          break;

        case 'network-request-failed':
          message = '네트워크 연결을 확인해주세요.';
          break;

        default:
          message = '로그인에 실패했습니다.';
      }

      state = state.copyWith(isLoading: false, errorMessage: message);
    } catch (e) {
      debugPrint('로그인 실패: $e');

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
