import 'package:flutter/material.dart';
class RegistrationButtons extends StatelessWidget {
  final bool isRegistered;
  final VoidCallback onRegisterPressed;
  final VoidCallback onShowTicketPressed;
  final VoidCallback onExitPressed;

  const RegistrationButtons({
    super.key, 
    required this.isRegistered,
    required this.onRegisterPressed,
    required this.onShowTicketPressed,
    required this.onExitPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (!isRegistered)
          ElevatedButton(
            onPressed: onRegisterPressed,
            child: const Text('Register to this bus'),
          ),
        if (isRegistered)
          ElevatedButton(
            onPressed: onShowTicketPressed,
            child: const Text('Show ticket'),
          ),
        if (isRegistered)
          ElevatedButton(
            onPressed: onExitPressed,
            child: const Text('Exit the bus'),
          ),
      ],
    );
  }
}