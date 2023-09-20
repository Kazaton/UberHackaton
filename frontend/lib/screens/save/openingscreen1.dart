// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OpeningScreen extends StatefulWidget {
  @override
  _OpeningState createState() => _OpeningState();
}

class _OpeningState extends State<OpeningScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414,
      height: 896,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
      child: Center(child: Icon()),
    );
  }
}

class Icon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 181,
        height: 181,
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 181,
                  height: 181,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color:
                              Color.fromRGBO(189, 189, 189, 0.4000000059604645),
                          offset: Offset(-4, -4),
                          blurRadius: 10)
                    ],
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ))),
          Positioned(
              top: 42,
              left: 14,
              child: SizedBox(
                width: 154,
                height: 96,
                child: Text('Uber',
                    style: TextStyle(
                      color: Color(0xFFECF6FF),
                      fontSize: 64,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    )),
              ))
        ]));
  }
}
