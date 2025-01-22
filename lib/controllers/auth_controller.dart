import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  // URL API SignUp dan SignIn Firebase
  final String _signupUrl =
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyApSLhRO54GIxca_SJyGuC6NTvcxTE4y-8";
  final String _loginUrl =
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyApSLhRO54GIxca_SJyGuC6NTvcxTE4y-8";

  var token = RxnString();

  bool get isAuthenticated => token.value != null;

  Future<void> signup(String email, String password) async {
    final url = Uri.parse(_signupUrl);

    final response = await http.post(
      url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    final responseData = json.decode(response.body);

    if (responseData['error'] != null) {
      throw Exception(responseData['error']["message"]);
    }

    token.value = responseData['idToken'];

    Get.snackbar(
      'Berhasil',
      'Pendaftaran berhasil',
      colorText: Color.fromARGB(255, 12, 53, 106),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color.fromARGB(190, 160, 204, 255),
      margin: const EdgeInsets.all(15),
    );
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse(_loginUrl);

    final response = await http.post(
      url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    final responseData = json.decode(response.body);

    if (responseData['error'] != null) {
      throw Exception(responseData['error']["message"]);
    }

    token.value = responseData['idToken'];

    Get.snackbar(
      'Selamat Datang',
      'Login berhasil',
      colorText: Color.fromARGB(255, 12, 53, 106),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color.fromARGB(190, 160, 204, 255),
      margin: const EdgeInsets.all(15),
    );
  }

  Future<void> logout() async {
    token.value = null;
    Get.snackbar(
      'Logout',
      'Anda telah keluar',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color.fromARGB(255, 255, 193, 188),
      margin: const EdgeInsets.all(15),
    );
  }
}
