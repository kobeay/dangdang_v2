import 'package:dangdang_v2/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> signup({
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
