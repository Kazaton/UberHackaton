import 'package:flutter/material.dart';
import 'package:frontend/AllScreens/mainscreen.dart';
import 'package:frontend/AllScreens/openingscreen.dart';
import 'package:frontend/AllScreens/openingscreen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Opening2(), //менять скрины через это
      debugShowCheckedModeBanner: false,
    );
  }
}
