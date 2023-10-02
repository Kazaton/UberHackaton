import 'package:flutter/material.dart';
import 'package:frontend/screens/bus/screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeWidget extends StatefulWidget {
  const QRCodeWidget({Key? key}) : super(key: key);

  @override
  State<QRCodeWidget> createState() => _QRCodeWidgetState();
}

class _QRCodeWidgetState extends State<QRCodeWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  String result = "";

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData.code!;
        if (result.contains("/bus/register/")) {
          controller.pauseCamera();

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BusRegisterScreen(url: result),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR to register', style: TextStyle(color: Color(0xFFEDF6FF)),),
        backgroundColor: const Color(0xFF021213),
        foregroundColor: const Color(0xFFEDF6FF),
      ),
      body: Column(children: [
        Expanded(
            flex: 5,
            child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated)),
      ]),
    );
  }
}
