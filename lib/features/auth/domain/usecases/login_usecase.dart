import 'package:dangdang_v2/features/auth/domain/entities/user.dart';
import 'package:dangdang_v2/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  const LoginUseCase(this._authRepository);

  Future<User> login({required String email, required String password}) {
    return _authRepository.login(email: email, password: password);
  }
}
