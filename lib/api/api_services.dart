// ignore_for_file: non_constant_identifier_names, avoid_print
import 'dart:convert';
import 'package:book_store/models/user_model.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

Map<String, String> headers = {
  'Content-Type': 'application/json',
  // 'Access-Control-Allow-Origin': '*', // Allow requests from all domains
};

class ApiService {
  Future<LoginResponse?> login(String email, String password) async {
    var response = await http.post(ApiConstants.loginUrl,
        headers: headers, body: {"email": email, "password": password});
    return LoginResponse.fromJson(jsonDecode(response.body));
  }

  Future<RegistrationResponse?> registration(
      String username, String email, String password, String role) async {
    Map<String, dynamic> requestBody = {
      "username": username,
      "password": password,
      "email": email,
      "role": role
    };
    String jsonBody = json.encode(requestBody);

    var registrationResponse = await http.post(ApiConstants.registrationUrl,
        headers: headers, body: jsonBody);
    if (registrationResponse.statusCode == 200) {
      print(registrationResponse.body);
      return RegistrationResponse.fromJson(
          jsonDecode(registrationResponse.body));
    }
    return null;
  }
}
