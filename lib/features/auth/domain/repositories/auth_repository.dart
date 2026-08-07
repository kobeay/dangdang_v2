import 'package:dangdang_v2/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<User> login({required String email, required String password});
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
  });
}
