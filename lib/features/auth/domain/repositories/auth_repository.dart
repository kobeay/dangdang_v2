import 'package:dangdang_v2/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login({required String email, required String password});
}
