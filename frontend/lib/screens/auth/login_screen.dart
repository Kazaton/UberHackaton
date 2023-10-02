import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/blocks/login_block.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFF191919),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                child: LoginBlock(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}