import 'package:flutter/material.dart';
import 'package:login_signup/theme/theme.dart';
import 'package:login_signup/screens/welcome_screen.dart';
import 'package:login_signup/screens/splash_screen.dart';
import 'package:login_signup/widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Signup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Poppins'),
          bodyMedium: TextStyle(fontFamily: 'Poppins'),
          bodySmall: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => BottomNavBar(),
      },
    );
  }
}
