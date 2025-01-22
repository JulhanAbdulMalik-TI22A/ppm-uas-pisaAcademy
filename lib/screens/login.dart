import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:pisa_academy/controllers/auth_controller.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final AuthController _authController = Get.put(AuthController());

  Future<String?> _loginUser(LoginData data) async {
    try {
      await _authController.login(data.name, data.password);
      return null;
    } catch (error) {
      return error.toString();
    }
  }

  Future<String?> _signupUser(SignupData data) async {
    try {
      await _authController.signup(data.name!, data.password!);
      return null;
    } catch (error) {
      return error.toString();
    }
  }

  Future<String?> _recoverPassword(String name) async {
    if (!_authController.isAuthenticated) {
      return 'User tidak ditemukan!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      logo: const AssetImage('assets/images/logo_pisa2.png'),
      onLogin: _loginUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        if (_authController.isAuthenticated) {
          Get.toNamed('/bottomNavScreen');
        }
      },
      onRecoverPassword: _recoverPassword,
      messages: LoginMessages(
        loginButton: 'Masuk',
        signupButton: 'Daftar',
        forgotPasswordButton: 'Lupa password?',
        confirmPasswordError: 'Password tidak cocok.',
        flushbarTitleError: 'Erorr',
      ),
      theme: LoginTheme(
        primaryColor: Colors.blue,
        pageColorLight: Colors.white,
        pageColorDark: Colors.blue.shade100,
        cardTheme: CardTheme(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        buttonTheme: LoginButtonTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        inputTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 232, 241, 255)),
            borderRadius: BorderRadius.all(Radius.circular(13)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 232, 241, 255)),
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 239, 245, 255),
          labelStyle: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ),
      hideForgotPasswordButton: true,
    );
  }
}
