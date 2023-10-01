import 'package:flutter/material.dart';
class BusRegistrationPage extends StatelessWidget {
  final String qrCodeData;

  const BusRegistrationPage({super.key, required this.qrCodeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bus registration')),
      body: Center(
        child: Text('QR code data: $qrCodeData'),
      ),
    );
  }
}
