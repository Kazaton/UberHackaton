// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:frontend/constants/urls.dart';
import 'package:frontend/screens/homepage.dart';
import 'package:frontend/screens/auth/login_screen.dart';
import 'package:frontend/context/token_service.dart';
import 'package:frontend/context/token_refresh_timer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationBlock extends StatefulWidget {
  const RegistrationBlock({super.key});

  @override
  State<RegistrationBlock> createState() => _RegistrationBlockState();
}

class _RegistrationBlockState extends State<RegistrationBlock> {
  final TextEditingController _phoneController =
      TextEditingController(); //phone input
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController =
      TextEditingController(); //all above is input

  Future<void> _register() async {
    final response = await http.post(
      Uri.parse(registerRef),
      body: json.encode({
        'phone': _phoneController.text,
        'password': _passwordController.text,
        'confirm_password': _confirmPasswordController.text,
        'first_name': _firstNameController.text,
        'last_name': _lastNameController.text,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    final responseBody = json.decode(response.body);

    if (response.statusCode == 201) {
      final access = json.decode(response.body)['access'];
      final refresh = json.decode(response.body)['refresh'];

      TokenService().saveAccessToken(access);
      TokenService().saveRefreshToken(refresh);

      TokenRefreshTimer().start();

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
            title: const Text('Registration Error'),
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
        //container for the whole screen
        color: const Color(0xFF191919),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                child: Text('Registration',
                    style: TextStyle(
                      color: Color(0xFFECF6FF),
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text('What’s your name?',
                  style: TextStyle(
                    color: Color(0xFFECF6FF),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  )),
            ),
            Row(children: [
              //row of texts so they go after each other to the right
              Expanded(
                  child: TextField(
                      controller: _firstNameController,
                      decoration:
                          const InputDecoration(labelText: 'First Name'))),
              Spacer(), //creating a space between them
              Expanded(
                child: TextField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(labelText: 'Last Name')),
              )
            ]),
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
                decoration: const InputDecoration(labelText: 'Phone Number')),
            Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Choose a password',
                  style: TextStyle(
                    color: Color(0xFFECF6FF),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                )),
            TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password')),
            TextField(
                controller: _confirmPasswordController,
                decoration:
                    const InputDecoration(labelText: 'Confirm Password')),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Log in',
                      style: const TextStyle(
                        color: Color(0xFF535AFF),
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Material(
                                child: LoginScreen(),
                              ),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                    //creating a button
                    onPressed: _register, //if button is pressed
                    style: ElevatedButton.styleFrom(
                        shadowColor: Color(0xFF191919),
                        elevation: 4,
                        minimumSize: Size(341, 58)),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Color(0xFFECF6FF),
                        fontSize: 21.60,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
