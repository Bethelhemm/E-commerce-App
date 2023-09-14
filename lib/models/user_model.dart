// ignore_for_file: camel_case_types, non_constant_identifier_names

class user_model {
  final String username;
  final String email;
  final String password;
  final String id;
  final String role;
  // final String phoneNumber;
  // final List adress[];
  user_model({
    required this.username,
    required this.password,
    required this.email,
    required this.id,
    required this.role,
    // required this.phoneNumber,
    //required this.adress
  });
}

class RegistrationResponse {
  // List<String>? non_field_error;
  List<String>? username;
  List<String>? password;
  List<String>? email;
  // List<String>? id; //it can be  id

  RegistrationResponse(
      {this.email,
      this.username,
      this.password,
      // this.id,
      // this.non_field_error
      });
  factory RegistrationResponse.fromJson(mapOfBody) {
    return RegistrationResponse(
        email: mapOfBody("email"),
        username: mapOfBody("username"),
        password: mapOfBody("password"),
        // id: mapOfBody("key"),
        // non_field_error: mapOfBody("non_field_error")
        );
  }
}

class LoginResponse {
  dynamic key;
  List<dynamic>? non_field_error;
  LoginResponse({
    this.key,
    this.non_field_error,
  });

  factory LoginResponse.fromJson(mapOfBody) {
    return LoginResponse(
        key: mapOfBody("key"), non_field_error: mapOfBody("non_field_error"));
  }
}
