class User {
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

  const User({
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
}
