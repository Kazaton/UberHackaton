// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Opening2 extends StatelessWidget {
  const Opening2({super.key});

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
                  decoration: BoxDecoration(color: Colors.black),
                ),
              ),
              Positioned(
                left: 47,
                top: 402,
                child: Container(
                  width: 237.50,
                  height: 53,
                  child: Stack(children: []),
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
                                              "assets/safety.png"), //не работает
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
                                              "assets/safety.png"), //не работает
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
                left: 117,
                top: 328,
                child: Container(
                  width: 181,
                  height: 181,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 181,
                          height: 181,
                          decoration: ShapeDecoration(
                            color: Color(0xFF010101),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x66BDBDBD),
                                blurRadius: 10,
                                offset: Offset(-4, -4),
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(4, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 14,
                        top: 42,
                        child: SizedBox(
                          width: 154,
                          height: 96,
                          child: Text(
                            'Uber',
                            style: TextStyle(
                              color: Color(0xFFECF6FF),
                              fontSize: 64,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 37,
                top: 776,
                child: Container(
                  width: 341,
                  height: 58,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 341,
                          height: 58,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.00, -1.00),
                              end: Alignment(0, 1),
                              colors: [Color(0xFF1976D2), Color(0xFF5259FF)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(4, 4),
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(-4, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 101,
                        top: 16,
                        child: SizedBox(
                          width: 138,
                          height: 25.20,
                          child: Text(
                            'Get Started',
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
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 81,
                top: 550,
                child: Container(
                  width: 251,
                  height: 54.38,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 251,
                          height: 54.38,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.67, color: Color(0xFFECF6FF)),
                              borderRadius: BorderRadius.circular(16.73),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 19.24,
                        top: 14.22,
                        child: SizedBox(
                          width: 165.66,
                          height: 27.61,
                          child: Text(
                            'Move with safety',
                            style: TextStyle(
                              color: Color(0xFFECF6FF),
                              fontSize: 20.08,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 189.92,
                        top: 6.69,
                        child: Container(
                          width: 41.83,
                          height: 41.83,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.73),
                            ),
                          ),
                          child: Stack(children: []),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
