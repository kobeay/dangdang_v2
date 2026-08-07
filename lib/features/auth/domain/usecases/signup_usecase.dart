import 'package:dangdang_v2/features/auth/domain/entities/user.dart';
import 'package:dangdang_v2/features/auth/domain/repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository _authRepository;

  SignupUseCase(this._authRepository);

  Future<User> signup({
    required String name,
    required String nickname,
    required String email,
    required String password,
    required DateTime birthDate,
    required String gender,
    required double height,
    required double weight,
    required String diabetesType,
  }) {
    return _authRepository.signup(
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
  }
}
