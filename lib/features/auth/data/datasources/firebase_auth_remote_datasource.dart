import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:dangdang_v2/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:dangdang_v2/features/auth/data/models/user_model.dart';

class FirebaseAuthRemoteDataSource implements AuthRemoteDataSource {
  FirebaseAuthRemoteDataSource({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
       _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = credential.user!.uid;

    final document = await _firestore.collection('users').doc(uid).get();

    return UserModel.fromJson(document.data()!);
  }

  @override
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
  }) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = credential.user!.uid;

    final userModel = UserModel(
      uid: uid,
      name: name,
      nickname: nickname,
      email: email,
      birthDate: birthDate,
      gender: gender,
      height: height,
      weight: weight,
      diabetesType: diabetesType,
      createdAt: DateTime.now(),
    );

    await _firestore.collection('users').doc(uid).set(userModel.toJson());

    return userModel;
  }
}
