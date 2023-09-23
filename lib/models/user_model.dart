// ignore_for_file: camel_case_types, non_constant_identifier_names

class user_model {
  final String username;
  final String email;
  final String password;
  final String id;
  final String role;
  user_model({
    required this.username,
    required this.password,
    required this.email,
    required this.id,
    required this.role,
  });
}

class RegistrationResponse {
  List<String>? username;
  List<String>? password;
  List<String>? email;

  RegistrationResponse({
    this.email,
    this.username,
    this.password,
  });
  factory RegistrationResponse.fromJson(Map<String, dynamic> mapOfBody) {
    final email = mapOfBody['email'];
    final username = mapOfBody["username"];
    final password = mapOfBody["password"];

    final emailList = email is List ? email.cast<String>() : null;
    final usernameList = username is List ? username.cast<String>() : null;
    final passwordList = password is List ? password.cast<String>() : null;
    return RegistrationResponse(
      email: emailList,
      username: usernameList,
      password: passwordList,
    );
  }
}

class LoginResponse {
  List<String>? username;
  List<String>? password;
  LoginResponse({
    this.username,
    this.password,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> mapOfBody) {
    final username = mapOfBody["username"];
    final password = mapOfBody["password"];

    final usernameList = username is List ? username.cast<String>() : null;
    final passwordList = password is List ? password.cast<String>() : null;
    return LoginResponse(
      username: usernameList,
      password: passwordList,
    );
  }
}
