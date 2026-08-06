import 'package:dangdang_v2/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
}
