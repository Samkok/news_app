class AuthService {

  final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$');
  final hasNumberRegex = RegExp(r'\d');
  final hasUpperCase = RegExp(r'[A-Z]');

  final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  bool validateEmail(String email) {
    return emailRegex.hasMatch(email);
  }

  bool validatePassword(String password) {
    return passwordRegex.hasMatch(password);
  }

  bool pwdHasNumber(String password) {
    return hasNumberRegex.hasMatch(password);
  }

  bool pwdHasUpperCase(String password) {
    return hasUpperCase.hasMatch(password);
  }

  bool enoughLength(String password) {
    return (password.length >= 8);
  }
}