// ignore_for_file: non_constant_identifier_names, avoid_print
import 'dart:convert';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

Map<String, String> headers = {
  'Content-Type': 'application/json',
  // 'Access-Control-Allow-Origin': '*', // Allow requests from all domains
};

class ApiService {
  Future<LoginResponse?> login(String username, String password) async {
    Map<String, dynamic> requestBody = {
      "username": username,
      "password": password,
    };
    String jsonBody = json.encode(requestBody);

    var response = await http.post(ApiConstants.loginUrl,
      headers: headers,   body: jsonBody);
    if (response.statusCode == 400) {
      return null;
    } else {
      print(response.body);
      return LoginResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<RegistrationResponse?> registration(
      String username, String email, String password, String role) async {
    Map<String, dynamic> requestBody = {
      "username": username,
      "email": email,
      "password": password,
      "role": role
    };
    String jsonBody = json.encode(requestBody);

    var registrationResponse = await http.post(ApiConstants.registrationUrl,
        headers: headers, body: jsonBody);
    if (registrationResponse.statusCode == 201) {
      print(registrationResponse.body);
      return RegistrationResponse.fromJson(
          jsonDecode(registrationResponse.body));
    }
    return null;
  }
}
