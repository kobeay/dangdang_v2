import 'package:email_validator/email_validator.dart';

class AuthValidator {
  static String? validateLogin({
    required String email,
    required String password,
  }) {
    return validateEmail(email) ?? validatePassword(password);
  }

  static String? validateSignup({
    required String name,
    required String nickname,
    required String email,
    required String password,
    required DateTime? birthDate,
    required String? gender,
    required String height,
    required String weight,
    required String? diabetesType,
  }) {
    return validateName(name) ??
        validateNickname(nickname) ??
        validateEmail(email) ??
        validatePassword(password) ??
        validateBirthDate(birthDate) ??
        validateGender(gender) ??
        validateHeight(height) ??
        validateWeight(weight) ??
        validateDiabetesType(diabetesType);
  }

  static String? validateName(String name) {
    if (name.isEmpty) {
      return '이름을 입력해주세요.';
    }

    return null;
  }

  static String? validateNickname(String nickname) {
    if (nickname.isEmpty) {
      return '닉네임을 입력해주세요.';
    }

    return null;
  }

  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return '이메일을 입력해주세요.';
    }

    if (!EmailValidator.validate(email)) {
      return '올바른 이메일 형식을 입력해주세요.';
    }

    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return '비밀번호를 입력해주세요.';
    }

    return null;
  }

  static String? validateBirthDate(DateTime? birthDate) {
    if (birthDate == null) {
      return '생년월일을 선택해주세요.';
    }

    return null;
  }

  static String? validateGender(String? gender) {
    if (gender == null) {
      return '성별을 선택해주세요.';
    }

    return null;
  }

  static String? validateWeight(String weight) {
    if (weight.isEmpty) {
      return '키를 입력해주세요.';
    }

    return null;
  }

  static String? validateHeight(String weight) {
    if (weight.isEmpty) {
      return '몸무게를 입력해주세요.';
    }

    return null;
  }

  static String? validateDiabetesType(String? diabetesType) {
    if (diabetesType == null) {
      return '당뇨 유형을 선택해주세요.';
    }

    return null;
  }
}
