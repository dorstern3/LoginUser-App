import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user/check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// Task
// 1. verify username
// 2. navbar
// 3. phone sms
// 4. facebook and google login
// 5. home page change to user name

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: check(),
    );
  }
}
