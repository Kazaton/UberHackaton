import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/auth_screen.dart';
import 'package:frontend/screens/homepage.dart';
import 'package:frontend/context/token_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TokenService _tokenService = TokenService();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kazaton',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF021213),
        canvasColor: const Color(0xFF021213),
        colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark,
          onPrimaryContainer: Color(0xFFEDF6FF),
          primary: Color(0xff535AFF),
          onPrimary: Color(0xFFEDF6FF),
          tertiaryContainer: Color(0xFF021213),
          secondaryContainer: Color(0xFF021213),
          primaryContainer: Color(0xFF021213),
          secondary: Color(0xff535AFF),
          onSecondary: Color(0xFFEDF6FF),
          onTertiaryContainer: Color(0xFF021213),
          onSecondaryContainer: Color(0xFF021213),
          error: Color(0xffcf6679),
          onError: Color(0xFF021213),
          background: Color(0xFF021213),
          onBackground: Color(0xFFEDF6FF),
          surface: Color(0xFFDADADA),
          onSurface: Color(0xFF021213),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Color(0xFF021213),
        ),
      ),
      home: FutureBuilder<bool>(
        future: _tokenService.isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData && snapshot.data == true) {
              return const HomePage();
            } else {
              return Builder(
                builder: (context) => const RegistrationScreen(),
              );
            }
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
