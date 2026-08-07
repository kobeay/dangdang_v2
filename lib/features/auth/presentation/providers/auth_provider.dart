import 'package:dangdang_v2/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:dangdang_v2/features/auth/data/datasources/firebase_auth_remote_datasource.dart';
import 'package:dangdang_v2/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:dangdang_v2/features/auth/domain/repositories/auth_repository.dart';
import 'package:dangdang_v2/features/auth/domain/usecases/login_usecase.dart';
import 'package:dangdang_v2/features/auth/domain/usecases/signup_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return FirebaseAuthRemoteDataSource();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider));
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.read(authRepositoryProvider));
});

final signupUseCaseProvider = Provider<SignupUseCase>((ref) {
  return SignupUseCase(ref.read(authRepositoryProvider));
});
