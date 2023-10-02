// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'dart:convert';
import 'package:frontend/screens/auth/auth_screen.dart';
import 'package:frontend/screens/homepage.dart';
import 'package:frontend/context/token_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/constants/urls.dart';

class LoginBlock extends StatefulWidget {
  const LoginBlock({super.key});

  @override
  State<LoginBlock> createState() => _LoginBlockState();
}

class _LoginBlockState extends State<LoginBlock> {
  final TextEditingController _phoneController =
      TextEditingController(); //phone input
  final TextEditingController _passwordController =
      TextEditingController(); //passsword input

  Future<void> _login() async {
    final response = await http.post(
      Uri.parse(loginRef),
      body: json.encode({
        'phone': _phoneController.text,
        'password': _passwordController.text,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    final responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      final access = json.decode(response.body)['access'];
      final refresh = json.decode(response.body)['refresh'];

      TokenService().saveAccessToken(access);
      TokenService().saveRefreshToken(refresh);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      final errorText = responseBody['error'] ?? 'An error occurred.';
      String formatError(dynamic errorData) {
        if (errorData is String) {
          return errorData;
        } else if (errorData is Map<String, dynamic>) {
          List<String> errorMessages = [];
          errorData.forEach((key, value) {
            if (value is List<dynamic>) {
              List<String> messages = value.map((item) => '$item').toList();
              errorMessages.addAll(messages);
            } else {
              errorMessages.add('$value');
            }
          });
          return errorMessages.join('\n');
        } else {
          return 'An error occurred.';
        }
      }

      showDialog(
        //message if login is incorect
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login Error'),
            content: Text(formatError(errorText)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xFF191919),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                child: Text('Log in',
                    style: TextStyle(
                      color: Color(0xFFECF6FF),
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ))),
            Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Mobile phone number',
                  style: TextStyle(
                      color: Color(0xFFECF6FF),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0),
                )),
            TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone')),
            Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Enter your password',
                  style: TextStyle(
                      color: Color(0xFFECF6FF),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0),
                )),
            TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password')),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: RichText(
                text: TextSpan(
                  text: 'No account? ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Create one',
                      style: const TextStyle(
                        color: Color(0xFF535AFF),
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Material(child: RegistrationScreen()),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  shadowColor: Color(0x3F000000),
                  elevation: 4,
                  minimumSize: Size(340, 60),
                ),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Color(0xFFECF6FF),
                    fontSize: 21.60,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
