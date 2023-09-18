// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MobScreen extends StatelessWidget {
  const MobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Contains(),
        ]),
      ),
    );
  }
}

class Contains extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 414,
          height: 896,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFFECF6FF)),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 414,
                  height: 896,
                  decoration: BoxDecoration(color: Color(0xFF191919)),
                ),
              ),
              Positioned(
                left: 37,
                top: 776,
                child: Container(
                  width: 341,
                  height: 58,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 414,
                  height: 44.16,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 414,
                        height: 44.16,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 241.78,
                              height: 33.12,
                              child: Stack(children: []),
                            ),
                            Container(
                              width: 59.62,
                              height: 23.18,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
                                      padding: const EdgeInsets.only(
                                        top: 5.70,
                                        left: 13.75,
                                        right: 14.48,
                                        bottom: 5.24,
                                      ),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(35.33),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 73.59,
                              height: 12.51,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 46.74,
                                    top: 0,
                                    child: Container(
                                      width: 26.86,
                                      height: 12.51,
                                      child: Stack(children: []),
                                    ),
                                  ),
                                  Positioned(
                                    left: 24.32,
                                    top: 0,
                                    child: Container(
                                      width: 16.86,
                                      height: 12.11,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              " "), //хз че там за картинка
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0.37,
                                    child: Container(
                                      width: 18.77,
                                      height: 11.78,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              " "), //хз че там за картинка
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 179,
                top: 792,
                child: SizedBox(
                  width: 55,
                  height: 25,
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
              ),
              Positioned(
                left: 32,
                top: 131,
                child: SizedBox(
                  width: 349,
                  height: 33,
                  child: Text(
                    'Enter your mobile number',
                    style: TextStyle(
                      color: Color(0xFFECF6FF),
                      fontSize: 30,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 37,
                top: 249,
                child: SizedBox(
                  width: 409,
                  height: 33,
                  child: Text(
                    'Or connect with social',
                    style: TextStyle(
                      color: Color(0xFF5259FF),
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 128,
                top: 194,
                child: SizedBox(
                  width: 409,
                  height: 33,
                  child: Text(
                    '+91',
                    style: TextStyle(
                      color: Color(0xFFECF6FF),
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 178,
                top: 194,
                child: SizedBox(
                  width: 409,
                  height: 33,
                  child: Text(
                    '81234 56789',
                    style: TextStyle(
                      color: Color(0xFF979797),
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 37,
                top: 719,
                child: SizedBox(
                  width: 409,
                  height: 33,
                  child: Text(
                    'By continuing you may recieve an SMS for           verification. Message and data rates may apply.',
                    style: TextStyle(
                      color: Color(0xFFD9D9D9),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 38,
                top: 195,
                child: Container(
                  width: 52,
                  height: 31,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/52x31"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 37,
                top: 400,
                child: Container(width: 48, height: 48),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
