import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user/check.dart';
import 'package:user/screen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// Task
// 1. verify username
// 2. phone sms
// 3. home page change to user name
// 4. ***push notifications

// Try again:
// 1. navbar -> screens[currentIndex]
// 2. facebook and google login

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
      // check(),
    );
  }
}
