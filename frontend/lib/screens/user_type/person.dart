// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFF191919),
      body: SingleChildScrollView(
        child: Column(children: [Contains()]),
      ),
    ));
  }
}

class Contains extends StatelessWidget {
  const Contains({super.key});

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: MediaQuery.of(context).size.height,
        color: const Color(0xFF282F74),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.45),
              child: Text(
                'The evidence of possessing the ticket',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shadowColor: Color(0xFF191919),
                        elevation: 4,
                        minimumSize: Size(341, 58)),
                    child: Text(
                      'Close',
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
        ));
  }
}
