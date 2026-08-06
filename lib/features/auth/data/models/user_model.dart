import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dangdang_v2/features/auth/domain/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String nickname;
  final String email;
  final DateTime birthDate;
  final String gender;
  final double height;
  final double weight;
  final String diabetesType;
  final DateTime createdAt;

  const UserModel({
    required this.uid,
    required this.name,
    required this.nickname,
    required this.email,
    required this.birthDate,
    required this.gender,
    required this.height,
    required this.weight,
    required this.diabetesType,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      birthDate: (json['birthDate'] as Timestamp).toDate(),
      gender: json['gender'] as String,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      diabetesType: json['diabetesType'] as String,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'nickname': nickname,
      'email': email,
      'birthDate': Timestamp.fromDate(birthDate),
      'gender': gender,
      'height': height,
      'weight': weight,
      'diabetesType': diabetesType,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  User toEntity() {
    return User(
      uid: uid,
      name: name,
      nickname: nickname,
      email: email,
      birthDate: birthDate,
      gender: gender,
      height: height,
      weight: weight,
      diabetesType: diabetesType,
      createdAt: createdAt,
    );
  }
}
