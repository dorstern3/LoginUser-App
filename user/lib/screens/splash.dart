import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Icon(
            Icons.account_circle_outlined,
            size: 90,
            color: Color(0xffF07DEA),
          ),
          Text(
            'User App',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color(0xffA460ED),
            ),
          ),
        ],
      ),
      duration: 5000,
      backgroundColor: Color(0xff9FC9F3),
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Duration(seconds: 2),
      nextScreen: Login(),
      splashIconSize: 250,
    );
  }
}
