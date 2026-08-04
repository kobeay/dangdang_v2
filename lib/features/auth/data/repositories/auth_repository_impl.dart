import 'package:dangdang_v2/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:dangdang_v2/features/auth/domain/entities/user.dart';
import 'package:dangdang_v2/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<User> login({required String email, required String password}) async {
    final userModel = await _remoteDataSource.login(
      email: email,
      password: password,
    );
    return (userModel.toEntity());
  }
}
