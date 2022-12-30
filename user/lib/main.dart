import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user/screens/login.dart';
import 'package:user/screens/register.dart';
import 'package:user/screens/splash.dart';
import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
runApp(const MyApp());
}
   

// Task:
// 1. send message passwordConfig
// 2. navbar -> screens[currentIndex]
// 3. database firebase -> not work
// 4. home page change to user name
// 5. push notifications + 10 sec delay


 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
