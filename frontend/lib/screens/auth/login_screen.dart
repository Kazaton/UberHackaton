import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/blocks/login_block.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              child: LoginBlock(),
            ),
          ],
        ) 
      ),
    );
  }
}