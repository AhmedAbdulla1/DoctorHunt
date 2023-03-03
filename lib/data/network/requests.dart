class LoginRequest {
  String email;
  String password;

  LoginRequest({
    required this.email,
    required this.password,
  });
}

class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String location='';

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
  });
}

