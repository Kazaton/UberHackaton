// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

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

class Names extends StatefulWidget {
  @override
  _NamesState createState() => _NamesState();
}

class _NamesState extends State<Names> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 40.0),
          child: Text(
            'What’s your name?',
            style: TextStyle(
              color: Color(0xFFECF6FF),
              fontSize: 24,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 30.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First Name',
                    style: TextStyle(
                      color: Color(0xFFECF6FF),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Image.asset('assets/underline.png'),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Name',
                    style: TextStyle(
                      color: Color(0xFFECF6FF),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Image.asset('assets/underline.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 50.0),
            child: Text(
              'Mobile phone number',
              style: TextStyle(
                color: Color(0xFFECF6FF),
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 30.0),
            child: Text(
              '+7 777 777 77 77',
              style: TextStyle(
                color: Color(0xFFECF6FF),
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 5.0),
          child: Image.asset('assets/underline.png'),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 50.0),
            child: Row(children: [
              Text(
                'Do you have a disability?',
                style: TextStyle(
                  color: Color(0xFFECF6FF),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
              )
            ])),
        Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 50.0),
            child: Text(
              'Choose a password',
              style: TextStyle(
                color: Color(0xFFECF6FF),
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 30.0),
            child: Text(
              '••••••••••',
              style: TextStyle(
                color: Color(0xFFECF6FF),
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 5.0),
          child: Image.asset('assets/long_underline.png'),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 50.0),
            child: Text(
              'Confirm your password',
              style: TextStyle(
                color: Color(0xFFECF6FF),
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 30.0),
            child: Text(
              '••••••••••',
              style: TextStyle(
                color: Color(0xFFECF6FF),
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 5.0),
          child: Image.asset('assets/long_underline.png'),
        ),
        Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
                onPressed: () {
                  // Ваш код здесь
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF535AFF),
                    shadowColor: Color(0x3F000000),
                    elevation: 4, // высота тени
                    minimumSize: Size(341, 58)),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Color(0xFFECF6FF),
                    fontSize: 21.60,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                )))
      ],
    );
  }
}
