// ignore_for_file: camel_case_types, non_constant_identifier_names

class user_model {
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final String id;
  final String phoneNumber;
  // final List adress[];
  user_model({
    required this.first_name,
    required this.last_name,
    required this.password,
    required this.email,
    required this.id,
    required this.phoneNumber,
    //required this.adress
  });
}
