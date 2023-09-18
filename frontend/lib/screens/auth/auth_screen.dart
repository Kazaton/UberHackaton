import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/blocks/registration_block.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              child: RegistrationBlock(),
            ),
          ],
        ) 
      ),
    );
  }
}