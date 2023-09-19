// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF191919),
        body: SingleChildScrollView(
          child: Column(children: [Names()]),
        ),
      ),
    );
  }
}

class Names extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mobile phone number',
            style: TextStyle(
              color: Color(0xFFECF6FF),
              fontSize: 24,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            '+7 777 777 77 77',
            style: TextStyle(
              color: Color(0xFFECF6FF),
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          SizedBox(height: 5.0),
          Image.asset('assets/long_underline.png'),
          SizedBox(height: 50.0),
          Text(
            'Write your password',
            style: TextStyle(
              color: Color(0xFFECF6FF),
              fontSize: 24,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            '••••••••••',
            style: TextStyle(
              color: Color(0xFFECF6FF),
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          SizedBox(height: 5.0),
          Image.asset('assets/long_underline.png'),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () {
              // Ваш код здесь
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF535AFF),
              shadowColor: Color(0x3F000000),
              elevation: 4, // высота тени
              minimumSize: Size(341, 58),
            ),
            child: Text(
              'Next',
              style: TextStyle(
                color: Color(0xFFECF6FF),
                fontSize: 21.60,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
