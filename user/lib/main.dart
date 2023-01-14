import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:user/provider/userData.dart';
import 'package:user/screens/splash.dart';
import 'services/firebase_options.dart';

// Task:
// 1. navbar -> screens[currentIndex]
void main() async {
  // Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Run Provider
  runApp(const AppState());
}

// Provider
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FirebaseAuthData(),
        )
      ],
      // Run App
      child: const MyApp(),
    );
  }
}

// Run App
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
