// ignore_for_file: use_build_context_synchronously

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
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color(0xFF021213),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone')),
            TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _login, 
              child: const Text(
                'Войти',
                textWidthBasis: TextWidthBasis.parent,
              )
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                text: 'No account? ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Create one',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Material(child: RegistrationScreen()),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}